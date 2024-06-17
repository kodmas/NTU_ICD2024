module interpolation (
    input           clk,
    input           RST,
    input           START,
    input   [5:0]   H0,     // x-coordinate 
    input   [5:0]   V0,     // y-coordinate 
    input   [3:0]   SW,     // width
    input   [3:0]   SH,     // height
    output          REN,    // set to low to read data from ROM
    input   [7:0]   R_DATA, // data read from ROM
    output  [11:0]  ADDR,   // tell ROM which address to read
    output  [7:0]   O_DATA, 
    output          O_VALID
);

// set parameters for states
`define S_IDLE   3'b000 // 0
`define S_FETCH  3'b001 // 1
`define S_WAIT   3'b010 // 2
`define S_READ   3'b011 // 3
`define S_CALC   3'b100 // 4
`define S_OUT    3'b101 // 5

reg [11:0]  addr_r, addr_w;
reg         valid_r, valid_w;
reg [2:0]   state_r, state_w;
reg         ren_r, ren_w;
reg [7:0]   o_data_r, o_data_w;
reg [8:0]   counter_r, counter_w;
reg [1:0]   cycle_r, cycle_w;

reg [7:0]   data_ul_r, data_ur_r, data_ll_r, data_lr_r, data_ul_w, data_ur_w, data_ll_w, data_lr_w;    // *latch*                     
reg [7:0]   fract_x, fract_y;                   // *latch*      // use to calculate
reg         diff_x, diff_y;                     // *latch*      // to see if we have to interpolate x or y 
reg [11:0]  temp, temp_x, temp_y, temp_y2;      


// only at the start that we can read H0,V0,SW,SH
reg [5:0]   h0_r, h0_w, v0_r, v0_w;                             // *latch* 
reg [7:0]   width_r, width_w, height_r, height_w;                      // *latch* 

assign ADDR     = addr_r;
assign O_VALID  = valid_r;
assign REN      = ren_r;
assign O_DATA   = o_data_r;

always @(*) begin
    valid_w     = valid_r;
    state_w     = state_r;
    ren_w       = ren_r;
    addr_w      = addr_r;
    o_data_w    = o_data_r;
    cycle_w     = cycle_r;
    counter_w   = counter_r;
    data_ul_w   = data_ul_r;
    data_ur_w   = data_ur_r;
    data_ll_w   = data_ll_r;
    data_lr_w   = data_lr_r;
    width_w     = width_r;
    height_w    = height_r;
    h0_w        = h0_r;
    v0_w        = v0_r;
    fract_x = ((counter_r % 17) * (width_r >> 4));
    fract_y = ((counter_r / 17) * (height_r >> 4));
    diff_x = ({fract_x[7:4] , 4'b0} != fract_x) ? 1 : 0; 
    diff_y = ({fract_y[7:4] , 4'b0} != fract_y) ? 1 : 0;

    case(state_r)
        
        
        `S_IDLE: begin
            counter_w = 0;
            cycle_w   = 0;
            width_w     = 0;
            height_w    = 0;
            h0_w        = 0;
            v0_w        = 0;

            if(START) begin
                state_w = `S_FETCH;
                addr_w  = H0+64*V0; // find the starting point
                ren_w   = 0;             // tell ROM to read data               
                width_w   = {SW-1,4'b0};
                height_w  = {SH-1,4'b0};
                h0_w      = H0;
                v0_w     = V0;
            end
        end

        `S_FETCH: begin
            // fract_x = 0;
            // fract_y = 0;
            // int_fract_x = 0;
            // fract_y[7:4] = 0;
            // diff_x = 0;
            // diff_y = 0;
            // upper-left corner 
            if(counter_r == 0) begin
                state_w  = `S_READ;
                ren_w    = 0;
            end
            // upper-right corner || lower-left corner || lower-right corner
            else if(counter_r == 16 || counter_r == 272 || counter_r == 288) begin

                case(counter_r)
                    16: begin
                        addr_w = h0_r+width_r[7:4]+(v0_r<<6);
                    end
                    272: begin
                        addr_w =  h0_r+((v0_r+height_r[7:4])<<6);
                    end
                    288: begin
                        addr_w = h0_r+width_r[7:4]+((v0_r+height_r[7:4])<<6); 
                    end
                    default: begin
                        addr_w = h0_r+((v0_r)<<6);
                    end
                endcase
                state_w = `S_WAIT;
                ren_w = 0;
            end

            else begin
                fract_x = ((counter_r % 17) * (width_r >> 4));
                fract_y = ((counter_r / 17) * (height_r >> 4));
                // fract_x = ({4'b0, width[7:4]});
                // fract_y = ({4'b0, height[7:4]});
                // int_fract_x = fract_x[7:4];
                // int_fract_y = fract_y[7:4];
          

                diff_x = ({fract_x[7:4], 4'b0} != fract_x) ? 1 : 0; 
                diff_y = ({fract_y[7:4], 4'b0} != fract_y) ? 1 : 0;

                if(cycle_r == 0) begin 
                    addr_w = (h0_r+fract_x[7:4])+((v0_r+fract_y[7:4])<<6); // upper-left data                                   
                end

                else begin 
                    if(diff_y && !diff_x) begin 
                        addr_w =  (h0_r+fract_x[7:4])+((v0_r+fract_y[7:4]+1)<<6); // lower-left data
                    end
                    else if(!diff_y && diff_x) begin
                        addr_w =  (h0_r+fract_x[7:4]+1)+((v0_r+fract_y[7:4])<<6); // upper-right data
                    end
                    else begin
                        case(cycle_r)
                            1: begin
                                addr_w = (h0_r+fract_x[7:4])+((v0_r+fract_y[7:4]+1)<<6); // lower-left data
                            end
                            2: begin
                                addr_w =  (h0_r+fract_x[7:4]+1)+((v0_r+fract_y[7:4])<<6); // upper-right data
                            end
                            3: begin
                                addr_w = (h0_r+fract_x[7:4]+1)+((v0_r+fract_y[7:4]+1)<<6); // lower-right data
                            end
                            default: begin 
                                addr_w = (h0_r+fract_x[7:4])+((v0_r+fract_y[7:4])<<6);
                            end
                        endcase
                    end
                end

                ren_w = 0;
                state_w = `S_WAIT;  

            end
        end
        
        `S_WAIT: begin
            state_w = `S_READ;
        end
        
        `S_READ: begin
            if(counter_r == 0) begin
                o_data_w  = R_DATA;
                state_w  = `S_OUT;
                ren_w    = 1;
                valid_w  = 1;
            end
            else if(counter_r == 16 || counter_r == 272 || counter_r == 288) begin 
                o_data_w = R_DATA;
                state_w  = `S_OUT;
                ren_w    = 1;
                valid_w  = 1;
            end
            else begin 
                if(cycle_r == 0) begin 
                    if(!diff_x && !diff_y) begin 
                        o_data_w = R_DATA;
                        state_w = `S_OUT;
                        ren_w = 1;
                        valid_w = 1;
                    end
                    else begin 
                        data_ul_w = R_DATA;
                        cycle_w = cycle_r + 1; 
                        state_w = `S_FETCH;
                    end              
                end
                else begin
                    if(diff_y && !diff_x) begin 
                        data_ll_w = R_DATA;        // lower-left data
                        state_w = `S_CALC;
                    end
                    else if(!diff_y && diff_x) begin
                        data_ur_w = R_DATA;        // upper-right data
                        state_w = `S_CALC;
                    end
                    else begin
                        state_w = `S_FETCH;
                        case(cycle_r)
                            1: begin
                                data_ll_w = R_DATA;    // lower-left data
                                cycle_w = cycle_r + 1;
                            end
                            2: begin
                               data_ur_w = R_DATA;     // upper-right data
                               cycle_w = cycle_r + 1;
                            end
                            3: begin
                                data_lr_w = R_DATA;    // lower-right data
                                state_w = `S_CALC;
                            end
                            default: begin
                                state_w = `S_FETCH;
                            end
                            
                        endcase
                    end
                end
                
            end
        end
        
        `S_CALC: begin
            if(diff_y && !diff_x) begin 
                temp_y = {data_ul_r, 4'b0} + (fract_y[3:0]) * (data_ll_r - data_ul_r) < 0 ? 0 : ({data_ul_r, 4'b0} + (fract_y[3:0]) * (data_ll_r - data_ul_r));
                o_data_w = ({data_ul_r, 4'b0} + (fract_y[3:0]) * (data_ll_r - data_ul_r)) > {8'd255, 4'b0} ? 255 : temp_y[11:4];

            end 
            else if(!diff_y && diff_x) begin
                temp_x = ({data_ul_r, 4'b0} + (fract_x[3:0]) * (data_ur_r - data_ul_r)) < 0  ? 0 :({data_ul_r, 4'b0} + (fract_x[3:0]) * (data_ur_r - data_ul_r));
                o_data_w = ({data_ul_r, 4'b0} + (fract_x[3:0]) * (data_ur_r - data_ul_r)) > {8'd255, 4'b0} ? 255 : temp_x[11:4];
            end
            else begin  
                if(({data_ul_r, 4'b0} + (fract_y[3:0]) * (data_ll_r - data_ul_r)) < 0 ) begin 
                    temp_y = 0;
                end
                else begin 
                    temp_y = ({data_ul_r, 4'b0} + (fract_y[3:0]) * (data_ll_r - data_ul_r)) > {8'd255, 4'b0} ? {8'd255, 4'b0}  : ({data_ul_r, 4'b0} + (fract_y[3:0]) * (data_ll_r - data_ul_r));
                end
               
                if(({data_ur_r, 4'b0} + (fract_y[3:0]) * (data_lr_r- data_ur_r)) < 0) begin 
                    temp_y2 = 0;
                end
                else begin 
                    temp_y2 = ({data_ur_r, 4'b0} + (fract_y[3:0]) * (data_lr_r - data_ur_r)) > {8'd255, 4'b0} ? {8'd255, 4'b0}  : ({data_ur_r, 4'b0} + (fract_y[3:0]) * (data_lr_r - data_ur_r));
                end

                if (temp_y + (fract_x[3:0])*(temp_y2[11:4] - temp_y[11:4]) < 0) begin 
                    temp_x = 0;
                end
                else begin 
                    temp =  (fract_x[3:0])*(temp_y2[11:4] - temp_y[11:4]);

                    temp_x = {(temp_y[11:4] + temp[11:4]), 4'b0} > {8'd255, 4'b0} ? {8'd255, 4'b0}  : {(temp_y[11:4] + temp[11:4]), 4'b0} ;
                end
                

                // temp_x (( = ((fract_x[3:0]) * ((data_ur + (temp_y2[11:4])) - (data_ul + temp_y[11:4] ))) < 0 ? 0 : ((fract_x[3:0]) * ((data_ur + (temp_y2[11:4])) - (data_ul + temp_y[11:4] )));
                o_data_w = temp_x[11:4];
            end
            state_w = `S_OUT;
            ren_w = 1;
            valid_w = 1;
        end


        `S_OUT: begin
            valid_w = 0;
            counter_w = counter_r + 1;
            cycle_w = 0;
            
            if(counter_r == 288) begin
                state_w = `S_IDLE;
                counter_w = 0;
            end
            else begin 
                state_w = `S_FETCH;
            end
            
        end
    endcase

end

always @(posedge clk or posedge RST) begin
    if(RST) begin
        state_r     <= `S_IDLE;
        valid_r     <= 1'b0;
        addr_r      <= 12'b0;
        ren_r       <= 1'b1;
        o_data_r    <= 0;
        cycle_r     <= 0;
        counter_r   <= 0;
        data_ul_r   <= 0;
        data_ur_r   <= 0;
        data_ll_r   <= 0;
        data_lr_r   <= 0;
        width_r     <= 0;
        height_r    <= 0;
        h0_r        <= 0;
        v0_r        <= 0;

    end
    else begin
        state_r     <= state_w;
        valid_r     <= valid_w;
        addr_r      <= addr_w;
        ren_r       <= ren_w;
        o_data_r    <= o_data_w;
        cycle_r     <= cycle_w;
        counter_r   <= counter_w;
        data_ul_r   <= data_ul_w;
        data_ur_r   <= data_ur_w;
        data_ll_r   <= data_ll_w;
        data_lr_r   <= data_lr_w;
        width_r     <= width_w;
        height_r    <= height_w;
        h0_r        <= h0_w;
        v0_r        <= v0_w;
    end
end

endmodule