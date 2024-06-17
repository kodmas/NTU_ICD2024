/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12
// Date      : Thu Jun 13 10:16:50 2024
/////////////////////////////////////////////////////////////


module interpolation_DW01_inc_0_DW01_inc_1 ( A, SUM );
  input [8:0] A;
  output [8:0] SUM;

  wire   [8:2] carry;

  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2X1 U1 ( .A(carry[8]), .B(A[8]), .Y(SUM[8]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module interpolation_DW01_add_2 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [11:1] carry;

  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(n1), .CO(carry[6]), .S(SUM[5]) );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFXL U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFXL U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFXL U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFXL U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  XOR3X1 U1_11 ( .A(A[11]), .B(B[11]), .C(carry[11]), .Y(SUM[11]) );
  AND2X2 U1 ( .A(B[4]), .B(A[4]), .Y(n1) );
  XOR2X1 U2 ( .A(B[4]), .B(A[4]), .Y(SUM[4]) );
  CLKBUFX3 U3 ( .A(B[0]), .Y(SUM[0]) );
  CLKBUFX3 U4 ( .A(B[1]), .Y(SUM[1]) );
  CLKBUFX3 U5 ( .A(B[2]), .Y(SUM[2]) );
  CLKBUFX3 U6 ( .A(B[3]), .Y(SUM[3]) );
endmodule


module interpolation_DW_mult_uns_0 ( a, b, product );
  input [3:0] a;
  input [11:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134;

  ADDFXL U3 ( .A(n13), .B(n15), .CI(n3), .CO(n2), .S(product[10]) );
  ADDFXL U4 ( .A(n18), .B(n16), .CI(n4), .CO(n3), .S(product[9]) );
  ADDFXL U5 ( .A(n19), .B(n23), .CI(n5), .CO(n4), .S(product[8]) );
  ADDFXL U6 ( .A(n24), .B(n26), .CI(n6), .CO(n5), .S(product[7]) );
  ADDFXL U7 ( .A(n27), .B(n29), .CI(n7), .CO(n6), .S(product[6]) );
  ADDFXL U8 ( .A(n30), .B(n32), .CI(n8), .CO(n7), .S(product[5]) );
  ADDFXL U9 ( .A(n33), .B(n34), .CI(n9), .CO(n8), .S(product[4]) );
  ADDFXL U10 ( .A(n35), .B(n37), .CI(n10), .CO(n9), .S(product[3]) );
  ADDFXL U11 ( .A(n11), .B(n56), .CI(n39), .CO(n10), .S(product[2]) );
  ADDHXL U12 ( .A(n65), .B(n73), .CO(n11), .S(product[1]) );
  ADDFXL U13 ( .A(n48), .B(n41), .CI(n14), .CO(n12), .S(n13) );
  CMPR42X1 U14 ( .A(n121), .B(n42), .C(n49), .D(n57), .ICI(n17), .S(n16), 
        .ICO(n14), .CO(n15) );
  CMPR42X1 U15 ( .A(n58), .B(n50), .C(n66), .D(n21), .ICI(n22), .S(n19), .ICO(
        n17), .CO(n18) );
  CMPR42X1 U17 ( .A(n51), .B(n43), .C(n59), .D(n67), .ICI(n25), .S(n24), .ICO(
        n22), .CO(n23) );
  CMPR42X1 U18 ( .A(n52), .B(n44), .C(n60), .D(n68), .ICI(n28), .S(n27), .ICO(
        n25), .CO(n26) );
  CMPR42X1 U19 ( .A(n53), .B(n45), .C(n61), .D(n69), .ICI(n31), .S(n30), .ICO(
        n28), .CO(n29) );
  CMPR42X1 U20 ( .A(n54), .B(n46), .C(n62), .D(n70), .ICI(n36), .S(n33), .ICO(
        n31), .CO(n32) );
  ADDFXL U21 ( .A(n63), .B(n71), .CI(n38), .CO(n34), .S(n35) );
  ADDHXL U22 ( .A(n55), .B(n47), .CO(n36), .S(n37) );
  ADDHXL U23 ( .A(n72), .B(n64), .CO(n38), .S(n39) );
  NOR2XL U75 ( .A(n120), .B(n130), .Y(n45) );
  NOR2XL U76 ( .A(n120), .B(n129), .Y(n44) );
  NOR2XL U77 ( .A(n120), .B(n128), .Y(n43) );
  NAND2XL U78 ( .A(a[0]), .B(b[9]), .Y(n66) );
  NOR2XL U79 ( .A(n120), .B(n126), .Y(n42) );
  NAND2XL U80 ( .A(a[2]), .B(b[9]), .Y(n48) );
  NOR2XL U81 ( .A(n120), .B(n125), .Y(n41) );
  NOR2XL U82 ( .A(n120), .B(n132), .Y(n47) );
  NAND2XL U83 ( .A(b[5]), .B(a[3]), .Y(n21) );
  INVX1 U84 ( .A(a[3]), .Y(n120) );
  CLKINVX2 U85 ( .A(a[1]), .Y(n123) );
  CLKINVX2 U86 ( .A(a[2]), .Y(n122) );
  CLKINVX2 U87 ( .A(a[0]), .Y(n124) );
  CLKINVX1 U88 ( .A(n21), .Y(n121) );
  CLKINVX1 U89 ( .A(b[3]), .Y(n129) );
  CLKINVX1 U90 ( .A(b[2]), .Y(n130) );
  CLKINVX1 U91 ( .A(b[1]), .Y(n131) );
  CLKINVX1 U92 ( .A(b[4]), .Y(n128) );
  CLKINVX1 U93 ( .A(b[5]), .Y(n127) );
  CLKINVX1 U94 ( .A(b[6]), .Y(n126) );
  CLKINVX1 U95 ( .A(b[7]), .Y(n125) );
  CLKINVX1 U96 ( .A(b[0]), .Y(n132) );
  XOR2X1 U97 ( .A(n133), .B(n134), .Y(product[11]) );
  XOR2X1 U98 ( .A(n2), .B(n12), .Y(n134) );
  NAND2X1 U99 ( .A(b[9]), .B(a[3]), .Y(n133) );
  NOR2X1 U100 ( .A(n124), .B(n132), .Y(product[0]) );
  NOR2X1 U101 ( .A(n124), .B(n131), .Y(n73) );
  NOR2X1 U102 ( .A(n124), .B(n130), .Y(n72) );
  NOR2X1 U103 ( .A(n124), .B(n129), .Y(n71) );
  NOR2X1 U104 ( .A(n124), .B(n128), .Y(n70) );
  NOR2X1 U105 ( .A(n124), .B(n127), .Y(n69) );
  NOR2X1 U106 ( .A(n124), .B(n126), .Y(n68) );
  NOR2X1 U107 ( .A(n124), .B(n125), .Y(n67) );
  NOR2X1 U108 ( .A(n132), .B(n123), .Y(n65) );
  NOR2X1 U109 ( .A(n131), .B(n123), .Y(n64) );
  NOR2X1 U110 ( .A(n130), .B(n123), .Y(n63) );
  NOR2X1 U111 ( .A(n129), .B(n123), .Y(n62) );
  NOR2X1 U112 ( .A(n128), .B(n123), .Y(n61) );
  NOR2X1 U113 ( .A(n127), .B(n123), .Y(n60) );
  NOR2X1 U114 ( .A(n126), .B(n123), .Y(n59) );
  NOR2X1 U115 ( .A(n125), .B(n123), .Y(n58) );
  NAND2X1 U116 ( .A(a[1]), .B(b[9]), .Y(n57) );
  NOR2X1 U117 ( .A(n132), .B(n122), .Y(n56) );
  NOR2X1 U118 ( .A(n131), .B(n122), .Y(n55) );
  NOR2X1 U119 ( .A(n130), .B(n122), .Y(n54) );
  NOR2X1 U120 ( .A(n129), .B(n122), .Y(n53) );
  NOR2X1 U121 ( .A(n128), .B(n122), .Y(n52) );
  NOR2X1 U122 ( .A(n127), .B(n122), .Y(n51) );
  NOR2X1 U123 ( .A(n126), .B(n122), .Y(n50) );
  NOR2X1 U124 ( .A(n125), .B(n122), .Y(n49) );
  NOR2X1 U125 ( .A(n120), .B(n131), .Y(n46) );
endmodule


module interpolation_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFXL U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFXL U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFXL U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFXL U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFXL U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  ADDFXL U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  ADDFXL U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  CLKINVX1 U1 ( .A(B[0]), .Y(n9) );
  CLKINVX1 U2 ( .A(B[3]), .Y(n6) );
  CLKINVX1 U3 ( .A(B[1]), .Y(n8) );
  NAND2X1 U4 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  CLKINVX1 U5 ( .A(A[0]), .Y(n1) );
  CLKINVX1 U6 ( .A(B[2]), .Y(n7) );
  CLKINVX1 U7 ( .A(B[4]), .Y(n5) );
  XNOR2X1 U8 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  CLKINVX1 U9 ( .A(B[5]), .Y(n4) );
  CLKINVX1 U10 ( .A(B[6]), .Y(n3) );
  CLKINVX1 U11 ( .A(B[7]), .Y(n2) );
  CLKINVX1 U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module interpolation_DW01_add_3 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [11:1] carry;

  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(n1), .CO(carry[6]), .S(SUM[5]) );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFXL U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFXL U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFXL U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFXL U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  XOR3X1 U1_11 ( .A(A[11]), .B(B[11]), .C(carry[11]), .Y(SUM[11]) );
  AND2X2 U1 ( .A(B[4]), .B(A[4]), .Y(n1) );
  XOR2X1 U2 ( .A(B[4]), .B(A[4]), .Y(SUM[4]) );
  CLKBUFX3 U3 ( .A(B[0]), .Y(SUM[0]) );
  CLKBUFX3 U4 ( .A(B[1]), .Y(SUM[1]) );
  CLKBUFX3 U5 ( .A(B[2]), .Y(SUM[2]) );
  CLKBUFX3 U6 ( .A(B[3]), .Y(SUM[3]) );
endmodule


module interpolation_DW_mult_uns_1 ( a, b, product );
  input [3:0] a;
  input [11:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134;

  ADDFXL U3 ( .A(n13), .B(n15), .CI(n3), .CO(n2), .S(product[10]) );
  ADDFXL U4 ( .A(n18), .B(n16), .CI(n4), .CO(n3), .S(product[9]) );
  ADDFXL U5 ( .A(n19), .B(n23), .CI(n5), .CO(n4), .S(product[8]) );
  ADDFXL U6 ( .A(n24), .B(n26), .CI(n6), .CO(n5), .S(product[7]) );
  ADDFXL U7 ( .A(n27), .B(n29), .CI(n7), .CO(n6), .S(product[6]) );
  ADDFXL U11 ( .A(n11), .B(n56), .CI(n39), .CO(n10), .S(product[2]) );
  ADDHXL U12 ( .A(n65), .B(n73), .CO(n11), .S(product[1]) );
  ADDFXL U13 ( .A(n48), .B(n41), .CI(n14), .CO(n12), .S(n13) );
  CMPR42X1 U14 ( .A(n121), .B(n42), .C(n49), .D(n57), .ICI(n17), .S(n16), 
        .ICO(n14), .CO(n15) );
  CMPR42X1 U15 ( .A(n58), .B(n50), .C(n66), .D(n21), .ICI(n22), .S(n19), .ICO(
        n17), .CO(n18) );
  CMPR42X1 U17 ( .A(n51), .B(n43), .C(n59), .D(n67), .ICI(n25), .S(n24), .ICO(
        n22), .CO(n23) );
  CMPR42X1 U18 ( .A(n52), .B(n44), .C(n60), .D(n68), .ICI(n28), .S(n27), .ICO(
        n25), .CO(n26) );
  CMPR42X1 U19 ( .A(n53), .B(n45), .C(n61), .D(n69), .ICI(n31), .S(n30), .ICO(
        n28), .CO(n29) );
  CMPR42X1 U20 ( .A(n54), .B(n46), .C(n62), .D(n70), .ICI(n36), .S(n33), .ICO(
        n31), .CO(n32) );
  ADDFXL U21 ( .A(n63), .B(n71), .CI(n38), .CO(n34), .S(n35) );
  ADDHXL U23 ( .A(n72), .B(n64), .CO(n38), .S(n39) );
  ADDHXL U75 ( .A(n55), .B(n47), .CO(n36), .S(n37) );
  NOR2X1 U76 ( .A(n120), .B(n132), .Y(n47) );
  ADDFXL U77 ( .A(n33), .B(n34), .CI(n9), .CO(n8), .S(product[4]) );
  ADDFXL U78 ( .A(n30), .B(n32), .CI(n8), .CO(n7), .S(product[5]) );
  ADDFXL U79 ( .A(n35), .B(n37), .CI(n10), .CO(n9), .S(product[3]) );
  NOR2XL U80 ( .A(n124), .B(n128), .Y(n70) );
  NOR2XL U81 ( .A(n129), .B(n123), .Y(n62) );
  NOR2XL U82 ( .A(n124), .B(n127), .Y(n69) );
  NOR2XL U83 ( .A(n120), .B(n130), .Y(n45) );
  NOR2XL U84 ( .A(n128), .B(n123), .Y(n61) );
  NOR2XL U85 ( .A(n129), .B(n122), .Y(n53) );
  NOR2XL U86 ( .A(n124), .B(n126), .Y(n68) );
  NOR2XL U87 ( .A(n120), .B(n129), .Y(n44) );
  NOR2XL U88 ( .A(n127), .B(n123), .Y(n60) );
  NOR2XL U89 ( .A(n128), .B(n122), .Y(n52) );
  NOR2XL U90 ( .A(n124), .B(n125), .Y(n67) );
  NOR2XL U91 ( .A(n120), .B(n128), .Y(n43) );
  NOR2XL U92 ( .A(n126), .B(n123), .Y(n59) );
  NOR2XL U93 ( .A(n127), .B(n122), .Y(n51) );
  NAND2XL U94 ( .A(a[0]), .B(b[9]), .Y(n66) );
  NOR2XL U95 ( .A(n125), .B(n123), .Y(n58) );
  NOR2XL U96 ( .A(n126), .B(n122), .Y(n50) );
  NAND2XL U97 ( .A(a[1]), .B(b[9]), .Y(n57) );
  NOR2XL U98 ( .A(n125), .B(n122), .Y(n49) );
  NOR2XL U99 ( .A(n120), .B(n125), .Y(n41) );
  NAND2XL U100 ( .A(a[2]), .B(b[9]), .Y(n48) );
  NOR2XL U101 ( .A(n124), .B(n132), .Y(product[0]) );
  CLKINVX2 U102 ( .A(a[1]), .Y(n123) );
  CLKINVX2 U103 ( .A(a[2]), .Y(n122) );
  CLKINVX2 U104 ( .A(a[0]), .Y(n124) );
  CLKINVX1 U105 ( .A(n21), .Y(n121) );
  CLKINVX1 U106 ( .A(b[3]), .Y(n129) );
  CLKINVX1 U107 ( .A(b[2]), .Y(n130) );
  CLKINVX1 U108 ( .A(b[1]), .Y(n131) );
  CLKINVX1 U109 ( .A(b[4]), .Y(n128) );
  CLKINVX1 U110 ( .A(b[5]), .Y(n127) );
  CLKINVX1 U111 ( .A(b[6]), .Y(n126) );
  CLKINVX1 U112 ( .A(b[7]), .Y(n125) );
  CLKINVX1 U113 ( .A(b[0]), .Y(n132) );
  INVX3 U114 ( .A(a[3]), .Y(n120) );
  NAND2XL U115 ( .A(b[9]), .B(a[3]), .Y(n133) );
  NAND2XL U116 ( .A(b[5]), .B(a[3]), .Y(n21) );
  XOR2X1 U117 ( .A(n133), .B(n134), .Y(product[11]) );
  XOR2X1 U118 ( .A(n2), .B(n12), .Y(n134) );
  NOR2X1 U119 ( .A(n124), .B(n131), .Y(n73) );
  NOR2X1 U120 ( .A(n124), .B(n130), .Y(n72) );
  NOR2X1 U121 ( .A(n124), .B(n129), .Y(n71) );
  NOR2X1 U122 ( .A(n132), .B(n123), .Y(n65) );
  NOR2X1 U123 ( .A(n131), .B(n123), .Y(n64) );
  NOR2X1 U124 ( .A(n130), .B(n123), .Y(n63) );
  NOR2X1 U125 ( .A(n132), .B(n122), .Y(n56) );
  NOR2X1 U126 ( .A(n131), .B(n122), .Y(n55) );
  NOR2X1 U127 ( .A(n130), .B(n122), .Y(n54) );
  NOR2X1 U128 ( .A(n120), .B(n131), .Y(n46) );
  NOR2X1 U129 ( .A(n120), .B(n126), .Y(n42) );
endmodule


module interpolation_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFXL U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFXL U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFXL U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFXL U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFXL U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  ADDFXL U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  ADDFXL U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  CLKINVX1 U1 ( .A(B[0]), .Y(n9) );
  CLKINVX1 U2 ( .A(B[3]), .Y(n6) );
  CLKINVX1 U3 ( .A(B[1]), .Y(n8) );
  NAND2X1 U4 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  CLKINVX1 U5 ( .A(A[0]), .Y(n1) );
  CLKINVX1 U6 ( .A(B[2]), .Y(n7) );
  CLKINVX1 U7 ( .A(B[4]), .Y(n5) );
  XNOR2X1 U8 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  CLKINVX1 U9 ( .A(B[5]), .Y(n4) );
  CLKINVX1 U10 ( .A(B[6]), .Y(n3) );
  CLKINVX1 U11 ( .A(B[7]), .Y(n2) );
  CLKINVX1 U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module interpolation_DW01_add_24_DW01_add_16 ( A, B, CI, SUM, CO );
  input [5:0] A;
  input [5:0] B;
  output [5:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3;
  wire   [5:1] carry;

  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  NAND2X1 U1 ( .A(n1), .B(n2), .Y(carry[1]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(n2) );
  INVXL U3 ( .A(B[0]), .Y(n1) );
  XNOR2X2 U4 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  CLKXOR2X2 U5 ( .A(A[4]), .B(carry[4]), .Y(SUM[4]) );
  XNOR2X1 U6 ( .A(A[5]), .B(n3), .Y(SUM[5]) );
  NAND2X1 U7 ( .A(A[4]), .B(carry[4]), .Y(n3) );
endmodule


module interpolation_DW01_add_29_DW01_add_21 ( A, B, CI, SUM, CO );
  input [5:0] A;
  input [5:0] B;
  output [5:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [5:1] carry;

  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  CMPR32X2 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .CO(carry[2]), .S(SUM[1]) );
  CMPR32X2 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  CLKXOR2X2 U3 ( .A(A[4]), .B(carry[4]), .Y(SUM[4]) );
  XNOR2X1 U4 ( .A(A[5]), .B(n2), .Y(SUM[5]) );
  NAND2X1 U5 ( .A(A[4]), .B(carry[4]), .Y(n2) );
endmodule


module interpolation_DW01_sub_5 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFXL U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFXL U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFXL U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  ADDFXL U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFXL U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFXL U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFX2 U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  NAND2X2 U1 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX1 U2 ( .A(B[5]), .Y(n4) );
  CLKINVX1 U3 ( .A(A[0]), .Y(n1) );
  CLKINVX1 U4 ( .A(B[2]), .Y(n7) );
  CLKINVX1 U5 ( .A(B[1]), .Y(n8) );
  CLKINVX1 U6 ( .A(B[3]), .Y(n6) );
  CLKINVX1 U7 ( .A(B[4]), .Y(n5) );
  CLKINVX1 U8 ( .A(B[0]), .Y(n9) );
  CLKINVX1 U9 ( .A(B[6]), .Y(n3) );
  XNOR2X1 U10 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  CLKINVX1 U11 ( .A(B[7]), .Y(n2) );
  CLKINVX1 U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module interpolation_DW_mult_uns_8 ( a, b, product );
  input [3:0] a;
  input [11:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n12, n13, n14, n15, n16, n17, n18,
         n19, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n57, n58, n59, n60, n61, n62, n63,
         n64, n66, n67, n68, n69, n70, n71, n72, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141;

  ADDFXL U3 ( .A(n13), .B(n15), .CI(n3), .CO(n2), .S(product[10]) );
  ADDFXL U4 ( .A(n18), .B(n16), .CI(n4), .CO(n3), .S(product[9]) );
  ADDFXL U5 ( .A(n19), .B(n23), .CI(n5), .CO(n4), .S(product[8]) );
  ADDFXL U6 ( .A(n24), .B(n26), .CI(n6), .CO(n5), .S(product[7]) );
  ADDFXL U7 ( .A(n27), .B(n29), .CI(n7), .CO(n6), .S(product[6]) );
  ADDFXL U13 ( .A(n48), .B(n41), .CI(n14), .CO(n12), .S(n13) );
  CMPR42X1 U14 ( .A(n126), .B(n42), .C(n49), .D(n57), .ICI(n17), .S(n16), 
        .ICO(n14), .CO(n15) );
  CMPR42X1 U15 ( .A(n58), .B(n50), .C(n66), .D(n21), .ICI(n22), .S(n19), .ICO(
        n17), .CO(n18) );
  CMPR42X1 U17 ( .A(n51), .B(n43), .C(n59), .D(n67), .ICI(n25), .S(n24), .ICO(
        n22), .CO(n23) );
  CMPR42X1 U18 ( .A(n52), .B(n44), .C(n60), .D(n68), .ICI(n28), .S(n27), .ICO(
        n25), .CO(n26) );
  CMPR42X1 U19 ( .A(n53), .B(n45), .C(n61), .D(n69), .ICI(n31), .S(n30), .ICO(
        n28), .CO(n29) );
  CMPR42X1 U20 ( .A(n54), .B(n46), .C(n62), .D(n70), .ICI(n36), .S(n33), .ICO(
        n31), .CO(n32) );
  ADDHXL U22 ( .A(n55), .B(n47), .CO(n36), .S(n37) );
  ADDHXL U23 ( .A(n72), .B(n64), .CO(n38), .S(n39) );
  INVX3 U75 ( .A(a[1]), .Y(n135) );
  INVX3 U76 ( .A(a[3]), .Y(n133) );
  ADDFXL U77 ( .A(n33), .B(n34), .CI(n9), .CO(n8), .S(product[4]) );
  CLKINVX1 U78 ( .A(n35), .Y(n128) );
  OR2X1 U79 ( .A(n131), .B(n128), .Y(n122) );
  OR2X1 U80 ( .A(n139), .B(n128), .Y(n120) );
  NAND3X1 U81 ( .A(n120), .B(n121), .C(n122), .Y(n9) );
  NOR2XL U82 ( .A(n136), .B(n129), .Y(n71) );
  AOI222XL U83 ( .A0(n39), .A1(n140), .B0(n141), .B1(n39), .C0(n141), .C1(n140), .Y(n139) );
  OR2X1 U84 ( .A(n139), .B(n131), .Y(n121) );
  ADDFXL U85 ( .A(n30), .B(n32), .CI(n8), .CO(n7), .S(product[5]) );
  ADDFXL U86 ( .A(n63), .B(n71), .CI(n38), .CO(n34), .S(n35) );
  CLKINVX1 U87 ( .A(b[6]), .Y(n124) );
  CLKINVX1 U88 ( .A(b[4]), .Y(n127) );
  CLKINVX1 U89 ( .A(b[2]), .Y(n130) );
  NOR2XL U90 ( .A(n133), .B(n130), .Y(n45) );
  NOR2XL U91 ( .A(n134), .B(n129), .Y(n53) );
  NOR2XL U92 ( .A(n135), .B(n127), .Y(n61) );
  NOR2XL U93 ( .A(n133), .B(n127), .Y(n43) );
  NOR2XL U94 ( .A(n134), .B(n125), .Y(n51) );
  NOR2XL U95 ( .A(n135), .B(n124), .Y(n59) );
  NOR2XL U96 ( .A(n133), .B(n129), .Y(n44) );
  NOR2XL U97 ( .A(n134), .B(n127), .Y(n52) );
  NOR2XL U98 ( .A(n135), .B(n125), .Y(n60) );
  NOR2XL U99 ( .A(n133), .B(n132), .Y(n46) );
  NOR2XL U100 ( .A(n134), .B(n130), .Y(n54) );
  NOR2XL U101 ( .A(n135), .B(n129), .Y(n62) );
  NAND2XL U102 ( .A(b[8]), .B(a[3]), .Y(n137) );
  AND4XL U103 ( .A(b[1]), .B(a[1]), .C(a[0]), .D(b[0]), .Y(n140) );
  NOR2XL U104 ( .A(n134), .B(n124), .Y(n50) );
  NOR2XL U105 ( .A(n135), .B(n123), .Y(n58) );
  NOR2XL U106 ( .A(n134), .B(n123), .Y(n49) );
  NAND2XL U107 ( .A(a[1]), .B(b[8]), .Y(n57) );
  NAND2XL U108 ( .A(b[5]), .B(a[3]), .Y(n21) );
  CLKINVX1 U109 ( .A(n37), .Y(n131) );
  CLKINVX1 U110 ( .A(b[5]), .Y(n125) );
  CLKINVX1 U111 ( .A(b[3]), .Y(n129) );
  CLKINVX1 U112 ( .A(b[1]), .Y(n132) );
  CLKINVX1 U113 ( .A(n21), .Y(n126) );
  INVX1 U114 ( .A(a[2]), .Y(n134) );
  INVX1 U115 ( .A(a[0]), .Y(n136) );
  CLKINVX1 U116 ( .A(b[7]), .Y(n123) );
  XOR2X1 U117 ( .A(n137), .B(n138), .Y(product[11]) );
  XOR2X1 U118 ( .A(n2), .B(n12), .Y(n138) );
  AND2X1 U119 ( .A(b[0]), .B(a[2]), .Y(n141) );
  NOR2X1 U120 ( .A(n136), .B(n130), .Y(n72) );
  NOR2X1 U121 ( .A(n136), .B(n127), .Y(n70) );
  NOR2X1 U122 ( .A(n136), .B(n125), .Y(n69) );
  NOR2X1 U123 ( .A(n136), .B(n124), .Y(n68) );
  NOR2X1 U124 ( .A(n136), .B(n123), .Y(n67) );
  NAND2X1 U125 ( .A(a[0]), .B(b[8]), .Y(n66) );
  NOR2X1 U126 ( .A(n135), .B(n132), .Y(n64) );
  NOR2X1 U127 ( .A(n135), .B(n130), .Y(n63) );
  NOR2X1 U128 ( .A(n134), .B(n132), .Y(n55) );
  NAND2X1 U129 ( .A(a[2]), .B(b[8]), .Y(n48) );
  NOR2BX1 U130 ( .AN(b[0]), .B(n133), .Y(n47) );
  NOR2X1 U131 ( .A(n133), .B(n124), .Y(n42) );
  NOR2X1 U132 ( .A(n133), .B(n123), .Y(n41) );
endmodule


module interpolation_DW01_add_30_DW01_add_22 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [7:1] carry;

  XOR3X1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .Y(SUM[7]) );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2XL U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module interpolation_DW_mult_uns_2 ( a, b, product );
  input [7:0] a;
  input [3:0] b;
  output [11:0] product;
  wire   n2, n3, n4, n5, n6, n7, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n28, n29, n30, n31, n33, n34, n35, n36,
         n37, n40, n41, n42, n43, n44, n48, n49, n50, n51, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119;

  ADDFXL U3 ( .A(n14), .B(n16), .CI(n3), .CO(n2), .S(product[6]) );
  ADDFXL U4 ( .A(n17), .B(n19), .CI(n4), .CO(n3), .S(product[5]) );
  ADDFXL U6 ( .A(n22), .B(n24), .CI(n6), .CO(n5), .S(product[3]) );
  ADDFXL U7 ( .A(n7), .B(n37), .CI(n26), .CO(n6), .S(product[2]) );
  ADDHXL U8 ( .A(n44), .B(n51), .CO(n7), .S(product[1]) );
  CMPR42X1 U15 ( .A(n35), .B(n30), .C(n41), .D(n48), .ICI(n23), .S(n20), .ICO(
        n18), .CO(n19) );
  ADDFXL U16 ( .A(n42), .B(n49), .CI(n25), .CO(n21), .S(n22) );
  ADDHXL U17 ( .A(n36), .B(n31), .CO(n23), .S(n24) );
  ADDHXL U18 ( .A(n50), .B(n43), .CO(n25), .S(n26) );
  XNOR2X1 U59 ( .A(n117), .B(n118), .Y(product[7]) );
  ADDFX2 U60 ( .A(n20), .B(n21), .CI(n5), .CO(n4), .S(product[4]) );
  OAI222X1 U61 ( .A0(n96), .A1(n93), .B0(n101), .B1(n93), .C0(n96), .C1(n101), 
        .Y(n15) );
  NAND2XL U62 ( .A(n15), .B(n28), .Y(n107) );
  NAND2XL U63 ( .A(n15), .B(n100), .Y(n108) );
  INVX1 U64 ( .A(a[0]), .Y(n98) );
  INVX1 U65 ( .A(a[2]), .Y(n97) );
  CLKINVX1 U66 ( .A(a[1]), .Y(n99) );
  CLKINVX1 U67 ( .A(a[4]), .Y(n95) );
  CLKINVX1 U68 ( .A(n18), .Y(n94) );
  CLKINVX1 U69 ( .A(n29), .Y(n96) );
  CLKINVX1 U70 ( .A(n34), .Y(n101) );
  CLKINVX1 U71 ( .A(a[3]), .Y(n102) );
  CLKINVX1 U72 ( .A(n40), .Y(n93) );
  CLKINVX1 U73 ( .A(n28), .Y(n100) );
  CLKINVX1 U74 ( .A(b[1]), .Y(n105) );
  CLKINVX1 U75 ( .A(b[2]), .Y(n104) );
  CLKINVX1 U76 ( .A(b[3]), .Y(n103) );
  CLKINVX1 U77 ( .A(b[0]), .Y(n106) );
  NAND2XL U78 ( .A(b[3]), .B(a[4]), .Y(n119) );
  NOR2BX1 U79 ( .AN(n33), .B(n100), .Y(n12) );
  XNOR3X1 U80 ( .A(n100), .B(n33), .C(n15), .Y(n14) );
  MXI2X1 U81 ( .A(n107), .B(n108), .S0(n33), .Y(n13) );
  NAND2X1 U82 ( .A(n109), .B(n110), .Y(n16) );
  XOR2X1 U83 ( .A(n111), .B(n112), .Y(n17) );
  NOR3X1 U84 ( .A(n94), .B(n29), .C(n40), .Y(n113) );
  NOR3X1 U85 ( .A(n94), .B(n40), .C(n96), .Y(n114) );
  NOR3X1 U86 ( .A(n94), .B(n101), .C(n93), .Y(n115) );
  NOR3X1 U87 ( .A(n94), .B(n34), .C(n93), .Y(n116) );
  XOR2X1 U88 ( .A(n29), .B(n34), .Y(n111) );
  XOR2X1 U89 ( .A(n40), .B(n18), .Y(n112) );
  MXI2X1 U90 ( .A(n114), .B(n113), .S0(n34), .Y(n110) );
  MXI2X1 U91 ( .A(n116), .B(n115), .S0(n29), .Y(n109) );
  XOR2X1 U92 ( .A(n2), .B(n13), .Y(n118) );
  XOR2X1 U93 ( .A(n119), .B(n12), .Y(n117) );
  NOR2X1 U94 ( .A(n106), .B(n98), .Y(product[0]) );
  NOR2X1 U95 ( .A(n106), .B(n99), .Y(n51) );
  NOR2X1 U96 ( .A(n106), .B(n97), .Y(n50) );
  NOR2X1 U97 ( .A(n106), .B(n102), .Y(n49) );
  NOR2X1 U98 ( .A(n95), .B(n106), .Y(n48) );
  NOR2X1 U99 ( .A(n105), .B(n98), .Y(n44) );
  NOR2X1 U100 ( .A(n105), .B(n99), .Y(n43) );
  NOR2X1 U101 ( .A(n105), .B(n97), .Y(n42) );
  NOR2X1 U102 ( .A(n105), .B(n102), .Y(n41) );
  NOR2X1 U103 ( .A(n95), .B(n105), .Y(n40) );
  NOR2X1 U104 ( .A(n104), .B(n98), .Y(n37) );
  NOR2X1 U105 ( .A(n104), .B(n99), .Y(n36) );
  NOR2X1 U106 ( .A(n104), .B(n97), .Y(n35) );
  NOR2X1 U107 ( .A(n104), .B(n102), .Y(n34) );
  NOR2X1 U108 ( .A(n95), .B(n104), .Y(n33) );
  NOR2X1 U109 ( .A(n103), .B(n98), .Y(n31) );
  NOR2X1 U110 ( .A(n103), .B(n99), .Y(n30) );
  NOR2X1 U111 ( .A(n103), .B(n97), .Y(n29) );
  NOR2X1 U112 ( .A(n103), .B(n102), .Y(n28) );
endmodule


module interpolation_DW_mult_uns_7 ( a, b, product );
  input [4:0] a;
  input [3:0] b;
  output [8:0] product;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83;

  ADDFXL U3 ( .A(n10), .B(n9), .CI(n3), .CO(n2), .S(product[6]) );
  ADDFXL U4 ( .A(n11), .B(n15), .CI(n4), .CO(n3), .S(product[5]) );
  ADDFXL U9 ( .A(n24), .B(n28), .CI(n12), .CO(n8), .S(n9) );
  ADDFXL U10 ( .A(n14), .B(n29), .CI(n13), .CO(n10), .S(n11) );
  ADDHXL U11 ( .A(n33), .B(n25), .CO(n12), .S(n13) );
  CMPR42X1 U12 ( .A(n30), .B(n26), .C(n34), .D(n38), .ICI(n19), .S(n16), .ICO(
        n14), .CO(n15) );
  ADDFXL U13 ( .A(n35), .B(n39), .CI(n21), .CO(n17), .S(n18) );
  ADDHXL U14 ( .A(n31), .B(n27), .CO(n19), .S(n20) );
  ADDHXL U15 ( .A(n40), .B(n36), .CO(n21), .S(n22) );
  ADDFX2 U47 ( .A(n16), .B(n17), .CI(n5), .CO(n4), .S(product[4]) );
  ADDFX2 U48 ( .A(n7), .B(n32), .CI(n22), .CO(n6), .S(product[2]) );
  ADDHX1 U49 ( .A(n37), .B(n41), .CO(n7), .S(product[1]) );
  ADDFX2 U50 ( .A(n18), .B(n20), .CI(n6), .CO(n5), .S(product[3]) );
  NOR2X2 U51 ( .A(n73), .B(n81), .Y(product[0]) );
  CLKINVX1 U52 ( .A(a[0]), .Y(n73) );
  CLKINVX1 U53 ( .A(a[4]), .Y(n77) );
  CLKINVX1 U54 ( .A(a[3]), .Y(n76) );
  CLKINVX1 U55 ( .A(a[2]), .Y(n75) );
  CLKINVX1 U56 ( .A(a[1]), .Y(n74) );
  CLKINVX1 U57 ( .A(b[1]), .Y(n80) );
  CLKINVX1 U58 ( .A(b[0]), .Y(n81) );
  CLKINVX1 U59 ( .A(b[2]), .Y(n79) );
  CLKINVX1 U60 ( .A(b[3]), .Y(n78) );
  XOR2X1 U61 ( .A(n82), .B(n83), .Y(product[7]) );
  XNOR2X1 U62 ( .A(n8), .B(n2), .Y(n83) );
  NAND2X1 U63 ( .A(b[3]), .B(a[4]), .Y(n82) );
  NOR2X1 U64 ( .A(n81), .B(n74), .Y(n41) );
  NOR2X1 U65 ( .A(n81), .B(n75), .Y(n40) );
  NOR2X1 U66 ( .A(n81), .B(n76), .Y(n39) );
  NOR2X1 U67 ( .A(n77), .B(n81), .Y(n38) );
  NOR2X1 U68 ( .A(n73), .B(n80), .Y(n37) );
  NOR2X1 U69 ( .A(n74), .B(n80), .Y(n36) );
  NOR2X1 U70 ( .A(n75), .B(n80), .Y(n35) );
  NOR2X1 U71 ( .A(n76), .B(n80), .Y(n34) );
  NOR2X1 U72 ( .A(n77), .B(n80), .Y(n33) );
  NOR2X1 U73 ( .A(n73), .B(n79), .Y(n32) );
  NOR2X1 U74 ( .A(n74), .B(n79), .Y(n31) );
  NOR2X1 U75 ( .A(n75), .B(n79), .Y(n30) );
  NOR2X1 U76 ( .A(n76), .B(n79), .Y(n29) );
  NOR2X1 U77 ( .A(n77), .B(n79), .Y(n28) );
  NOR2X1 U78 ( .A(n78), .B(n73), .Y(n27) );
  NOR2X1 U79 ( .A(n78), .B(n74), .Y(n26) );
  NOR2X1 U80 ( .A(n78), .B(n75), .Y(n25) );
  NOR2X1 U81 ( .A(n78), .B(n76), .Y(n24) );
endmodule


module interpolation_DW01_sub_4 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFXL U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFXL U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFXL U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFXL U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFXL U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFXL U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  ADDFXL U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  CLKINVX1 U1 ( .A(B[0]), .Y(n9) );
  CLKINVX1 U2 ( .A(B[2]), .Y(n7) );
  CLKINVX1 U3 ( .A(B[1]), .Y(n8) );
  NAND2X1 U4 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  CLKINVX1 U5 ( .A(A[0]), .Y(n1) );
  CLKINVX1 U6 ( .A(B[3]), .Y(n6) );
  XNOR2X1 U7 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  CLKINVX1 U8 ( .A(B[4]), .Y(n5) );
  CLKINVX1 U9 ( .A(B[5]), .Y(n4) );
  CLKINVX1 U10 ( .A(B[6]), .Y(n3) );
  CLKINVX1 U11 ( .A(B[7]), .Y(n2) );
  CLKINVX1 U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module interpolation_DW_mult_uns_6 ( a, b, product );
  input [3:0] a;
  input [11:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n8, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n57, n58, n59, n60, n61, n62, n63, n64,
         n66, n67, n68, n69, n70, n71, n72, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140;

  ADDFXL U3 ( .A(n13), .B(n15), .CI(n3), .CO(n2), .S(product[10]) );
  ADDFXL U4 ( .A(n18), .B(n16), .CI(n4), .CO(n3), .S(product[9]) );
  ADDFXL U5 ( .A(n19), .B(n23), .CI(n5), .CO(n4), .S(product[8]) );
  ADDFXL U6 ( .A(n24), .B(n26), .CI(n6), .CO(n5), .S(product[7]) );
  ADDFXL U7 ( .A(n27), .B(n29), .CI(n7), .CO(n6), .S(product[6]) );
  ADDFXL U8 ( .A(n30), .B(n32), .CI(n8), .CO(n7), .S(product[5]) );
  ADDFXL U9 ( .A(n33), .B(n34), .CI(n125), .CO(n8), .S(product[4]) );
  ADDFXL U13 ( .A(n48), .B(n41), .CI(n14), .CO(n12), .S(n13) );
  CMPR42X1 U14 ( .A(n20), .B(n42), .C(n49), .D(n57), .ICI(n17), .S(n16), .ICO(
        n14), .CO(n15) );
  CMPR42X1 U15 ( .A(n58), .B(n50), .C(n66), .D(n122), .ICI(n22), .S(n19), 
        .ICO(n17), .CO(n18) );
  CMPR42X1 U17 ( .A(n51), .B(n43), .C(n59), .D(n67), .ICI(n25), .S(n24), .ICO(
        n22), .CO(n23) );
  CMPR42X1 U18 ( .A(n52), .B(n44), .C(n60), .D(n68), .ICI(n28), .S(n27), .ICO(
        n25), .CO(n26) );
  CMPR42X1 U19 ( .A(n53), .B(n45), .C(n61), .D(n69), .ICI(n31), .S(n30), .ICO(
        n28), .CO(n29) );
  CMPR42X1 U20 ( .A(n54), .B(n46), .C(n62), .D(n70), .ICI(n36), .S(n33), .ICO(
        n31), .CO(n32) );
  ADDFXL U21 ( .A(n63), .B(n71), .CI(n38), .CO(n34), .S(n35) );
  ADDHXL U22 ( .A(n55), .B(n47), .CO(n36), .S(n37) );
  ADDHXL U23 ( .A(n72), .B(n64), .CO(n38), .S(n39) );
  CLKINVX2 U75 ( .A(a[1]), .Y(n133) );
  CLKINVX2 U76 ( .A(a[3]), .Y(n131) );
  NAND2XL U77 ( .A(a[1]), .B(b[8]), .Y(n57) );
  NAND2XL U78 ( .A(a[2]), .B(b[8]), .Y(n48) );
  CLKINVX1 U79 ( .A(n137), .Y(n125) );
  CLKINVX2 U80 ( .A(a[2]), .Y(n132) );
  CLKINVX2 U81 ( .A(a[0]), .Y(n134) );
  CLKINVX1 U82 ( .A(n20), .Y(n122) );
  CLKINVX1 U83 ( .A(n138), .Y(n127) );
  CLKINVX1 U84 ( .A(b[2]), .Y(n128) );
  CLKINVX1 U85 ( .A(b[1]), .Y(n129) );
  CLKINVX1 U86 ( .A(b[3]), .Y(n126) );
  CLKINVX1 U87 ( .A(b[4]), .Y(n124) );
  CLKINVX1 U88 ( .A(b[5]), .Y(n123) );
  CLKINVX1 U89 ( .A(b[6]), .Y(n121) );
  CLKINVX1 U90 ( .A(b[7]), .Y(n120) );
  CLKINVX1 U91 ( .A(b[0]), .Y(n130) );
  NAND2XL U92 ( .A(b[8]), .B(a[3]), .Y(n135) );
  XOR2X1 U93 ( .A(n135), .B(n136), .Y(product[11]) );
  XOR2X1 U94 ( .A(n2), .B(n12), .Y(n136) );
  NOR2X1 U95 ( .A(n134), .B(n130), .Y(product[0]) );
  AOI222XL U96 ( .A0(n127), .A1(n35), .B0(n127), .B1(n37), .C0(n37), .C1(n35), 
        .Y(n137) );
  AOI222XL U97 ( .A0(n39), .A1(n139), .B0(n140), .B1(n39), .C0(n140), .C1(n139), .Y(n138) );
  NOR2X1 U98 ( .A(n132), .B(n130), .Y(n140) );
  NOR4X1 U99 ( .A(n129), .B(n133), .C(n130), .D(n134), .Y(n139) );
  NOR2X1 U100 ( .A(n134), .B(n128), .Y(n72) );
  NOR2X1 U101 ( .A(n134), .B(n126), .Y(n71) );
  NOR2X1 U102 ( .A(n134), .B(n124), .Y(n70) );
  NOR2X1 U103 ( .A(n134), .B(n123), .Y(n69) );
  NOR2X1 U104 ( .A(n134), .B(n121), .Y(n68) );
  NOR2X1 U105 ( .A(n134), .B(n120), .Y(n67) );
  NAND2X1 U106 ( .A(a[0]), .B(b[8]), .Y(n66) );
  NOR2X1 U107 ( .A(n133), .B(n129), .Y(n64) );
  NOR2X1 U108 ( .A(n133), .B(n128), .Y(n63) );
  NOR2X1 U109 ( .A(n133), .B(n126), .Y(n62) );
  NOR2X1 U110 ( .A(n133), .B(n124), .Y(n61) );
  NOR2X1 U111 ( .A(n133), .B(n123), .Y(n60) );
  NOR2X1 U112 ( .A(n133), .B(n121), .Y(n59) );
  NOR2X1 U113 ( .A(n133), .B(n120), .Y(n58) );
  NOR2X1 U114 ( .A(n132), .B(n129), .Y(n55) );
  NOR2X1 U115 ( .A(n132), .B(n128), .Y(n54) );
  NOR2X1 U116 ( .A(n132), .B(n126), .Y(n53) );
  NOR2X1 U117 ( .A(n132), .B(n124), .Y(n52) );
  NOR2X1 U118 ( .A(n132), .B(n123), .Y(n51) );
  NOR2X1 U119 ( .A(n132), .B(n121), .Y(n50) );
  NOR2X1 U120 ( .A(n132), .B(n120), .Y(n49) );
  NOR2X1 U121 ( .A(n131), .B(n130), .Y(n47) );
  NOR2X1 U122 ( .A(n131), .B(n129), .Y(n46) );
  NOR2X1 U123 ( .A(n131), .B(n128), .Y(n45) );
  NOR2X1 U124 ( .A(n131), .B(n126), .Y(n44) );
  NOR2X1 U125 ( .A(n131), .B(n124), .Y(n43) );
  NOR2X1 U126 ( .A(n131), .B(n121), .Y(n42) );
  NOR2X1 U127 ( .A(n131), .B(n120), .Y(n41) );
  NOR2X1 U128 ( .A(n123), .B(n131), .Y(n20) );
endmodule


module interpolation_DW01_add_20_DW01_add_12 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [11:1] carry;

  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(n1), .CO(carry[6]), .S(SUM[5]) );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFXL U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFXL U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFXL U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFXL U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  XOR3X1 U1_11 ( .A(A[11]), .B(B[11]), .C(carry[11]), .Y(SUM[11]) );
  AND2X2 U1 ( .A(B[4]), .B(A[4]), .Y(n1) );
  XOR2X1 U2 ( .A(B[4]), .B(A[4]), .Y(SUM[4]) );
endmodule


module interpolation_DW01_sub_3 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFXL U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFXL U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFXL U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFXL U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFXL U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFXL U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  ADDFXL U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  CLKINVX1 U1 ( .A(B[0]), .Y(n9) );
  CLKINVX1 U2 ( .A(B[2]), .Y(n7) );
  CLKINVX1 U3 ( .A(B[1]), .Y(n8) );
  NAND2X1 U4 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  CLKINVX1 U5 ( .A(A[0]), .Y(n1) );
  CLKINVX1 U6 ( .A(B[3]), .Y(n6) );
  XNOR2X1 U7 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  CLKINVX1 U8 ( .A(B[4]), .Y(n5) );
  CLKINVX1 U9 ( .A(B[5]), .Y(n4) );
  CLKINVX1 U10 ( .A(B[6]), .Y(n3) );
  CLKINVX1 U11 ( .A(B[7]), .Y(n2) );
  CLKINVX1 U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module interpolation_DW_mult_uns_5 ( a, b, product );
  input [3:0] a;
  input [11:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n8, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n57, n58, n59, n60, n61, n62, n63, n64,
         n66, n67, n68, n69, n70, n71, n72, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140;

  ADDFXL U3 ( .A(n13), .B(n15), .CI(n3), .CO(n2), .S(product[10]) );
  ADDFXL U4 ( .A(n18), .B(n16), .CI(n4), .CO(n3), .S(product[9]) );
  ADDFXL U5 ( .A(n19), .B(n23), .CI(n5), .CO(n4), .S(product[8]) );
  ADDFXL U6 ( .A(n24), .B(n26), .CI(n6), .CO(n5), .S(product[7]) );
  ADDFXL U7 ( .A(n27), .B(n29), .CI(n7), .CO(n6), .S(product[6]) );
  ADDFXL U8 ( .A(n30), .B(n32), .CI(n8), .CO(n7), .S(product[5]) );
  ADDFXL U9 ( .A(n33), .B(n34), .CI(n125), .CO(n8), .S(product[4]) );
  ADDFXL U13 ( .A(n48), .B(n41), .CI(n14), .CO(n12), .S(n13) );
  CMPR42X1 U14 ( .A(n20), .B(n42), .C(n49), .D(n57), .ICI(n17), .S(n16), .ICO(
        n14), .CO(n15) );
  CMPR42X1 U15 ( .A(n58), .B(n50), .C(n66), .D(n122), .ICI(n22), .S(n19), 
        .ICO(n17), .CO(n18) );
  CMPR42X1 U17 ( .A(n51), .B(n43), .C(n59), .D(n67), .ICI(n25), .S(n24), .ICO(
        n22), .CO(n23) );
  CMPR42X1 U18 ( .A(n52), .B(n44), .C(n60), .D(n68), .ICI(n28), .S(n27), .ICO(
        n25), .CO(n26) );
  CMPR42X1 U19 ( .A(n53), .B(n45), .C(n61), .D(n69), .ICI(n31), .S(n30), .ICO(
        n28), .CO(n29) );
  CMPR42X1 U20 ( .A(n54), .B(n46), .C(n62), .D(n70), .ICI(n36), .S(n33), .ICO(
        n31), .CO(n32) );
  ADDFXL U21 ( .A(n63), .B(n71), .CI(n38), .CO(n34), .S(n35) );
  ADDHXL U22 ( .A(n55), .B(n47), .CO(n36), .S(n37) );
  ADDHXL U23 ( .A(n72), .B(n64), .CO(n38), .S(n39) );
  CLKINVX2 U75 ( .A(a[1]), .Y(n133) );
  CLKINVX2 U76 ( .A(a[3]), .Y(n131) );
  NAND2XL U77 ( .A(a[1]), .B(b[8]), .Y(n57) );
  NAND2XL U78 ( .A(a[2]), .B(b[8]), .Y(n48) );
  CLKINVX1 U79 ( .A(n137), .Y(n125) );
  CLKINVX2 U80 ( .A(a[2]), .Y(n132) );
  CLKINVX2 U81 ( .A(a[0]), .Y(n134) );
  CLKINVX1 U82 ( .A(n20), .Y(n122) );
  CLKINVX1 U83 ( .A(n138), .Y(n127) );
  CLKINVX1 U84 ( .A(b[2]), .Y(n128) );
  CLKINVX1 U85 ( .A(b[1]), .Y(n129) );
  CLKINVX1 U86 ( .A(b[3]), .Y(n126) );
  CLKINVX1 U87 ( .A(b[4]), .Y(n124) );
  CLKINVX1 U88 ( .A(b[5]), .Y(n123) );
  CLKINVX1 U89 ( .A(b[6]), .Y(n121) );
  CLKINVX1 U90 ( .A(b[7]), .Y(n120) );
  CLKINVX1 U91 ( .A(b[0]), .Y(n130) );
  NAND2XL U92 ( .A(b[8]), .B(a[3]), .Y(n135) );
  XOR2X1 U93 ( .A(n135), .B(n136), .Y(product[11]) );
  XOR2X1 U94 ( .A(n2), .B(n12), .Y(n136) );
  NOR2X1 U95 ( .A(n134), .B(n130), .Y(product[0]) );
  AOI222XL U96 ( .A0(n127), .A1(n35), .B0(n127), .B1(n37), .C0(n37), .C1(n35), 
        .Y(n137) );
  AOI222XL U97 ( .A0(n39), .A1(n139), .B0(n140), .B1(n39), .C0(n140), .C1(n139), .Y(n138) );
  NOR2X1 U98 ( .A(n132), .B(n130), .Y(n140) );
  NOR4X1 U99 ( .A(n129), .B(n133), .C(n130), .D(n134), .Y(n139) );
  NOR2X1 U100 ( .A(n134), .B(n128), .Y(n72) );
  NOR2X1 U101 ( .A(n134), .B(n126), .Y(n71) );
  NOR2X1 U102 ( .A(n134), .B(n124), .Y(n70) );
  NOR2X1 U103 ( .A(n134), .B(n123), .Y(n69) );
  NOR2X1 U104 ( .A(n134), .B(n121), .Y(n68) );
  NOR2X1 U105 ( .A(n134), .B(n120), .Y(n67) );
  NAND2X1 U106 ( .A(a[0]), .B(b[8]), .Y(n66) );
  NOR2X1 U107 ( .A(n133), .B(n129), .Y(n64) );
  NOR2X1 U108 ( .A(n133), .B(n128), .Y(n63) );
  NOR2X1 U109 ( .A(n133), .B(n126), .Y(n62) );
  NOR2X1 U110 ( .A(n133), .B(n124), .Y(n61) );
  NOR2X1 U111 ( .A(n133), .B(n123), .Y(n60) );
  NOR2X1 U112 ( .A(n133), .B(n121), .Y(n59) );
  NOR2X1 U113 ( .A(n133), .B(n120), .Y(n58) );
  NOR2X1 U114 ( .A(n132), .B(n129), .Y(n55) );
  NOR2X1 U115 ( .A(n132), .B(n128), .Y(n54) );
  NOR2X1 U116 ( .A(n132), .B(n126), .Y(n53) );
  NOR2X1 U117 ( .A(n132), .B(n124), .Y(n52) );
  NOR2X1 U118 ( .A(n132), .B(n123), .Y(n51) );
  NOR2X1 U119 ( .A(n132), .B(n121), .Y(n50) );
  NOR2X1 U120 ( .A(n132), .B(n120), .Y(n49) );
  NOR2X1 U121 ( .A(n131), .B(n130), .Y(n47) );
  NOR2X1 U122 ( .A(n131), .B(n129), .Y(n46) );
  NOR2X1 U123 ( .A(n131), .B(n128), .Y(n45) );
  NOR2X1 U124 ( .A(n131), .B(n126), .Y(n44) );
  NOR2X1 U125 ( .A(n131), .B(n124), .Y(n43) );
  NOR2X1 U126 ( .A(n131), .B(n121), .Y(n42) );
  NOR2X1 U127 ( .A(n131), .B(n120), .Y(n41) );
  NOR2X1 U128 ( .A(n123), .B(n131), .Y(n20) );
endmodule


module interpolation_DW01_add_19_DW01_add_11 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [11:1] carry;

  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(n1), .CO(carry[6]), .S(SUM[5]) );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFXL U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFXL U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  XOR3X1 U1_11 ( .A(A[11]), .B(B[11]), .C(carry[11]), .Y(SUM[11]) );
  ADDFXL U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFXL U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  AND2X2 U1 ( .A(B[4]), .B(A[4]), .Y(n1) );
  XOR2X1 U2 ( .A(B[4]), .B(A[4]), .Y(SUM[4]) );
endmodule


module interpolation_DW01_add_17_DW01_add_9 ( A, B, CI, SUM, CO );
  input [5:0] A;
  input [5:0] B;
  output [5:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [5:1] carry;

  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  XOR2X1 U3 ( .A(A[4]), .B(carry[4]), .Y(SUM[4]) );
  XNOR2X1 U4 ( .A(A[5]), .B(n2), .Y(SUM[5]) );
  NAND2X1 U5 ( .A(A[4]), .B(carry[4]), .Y(n2) );
endmodule


module interpolation_DW01_sub_2 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFXL U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFXL U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFXL U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFXL U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFXL U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  ADDFXL U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  ADDFXL U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  CLKINVX1 U1 ( .A(B[0]), .Y(n9) );
  CLKINVX1 U2 ( .A(B[3]), .Y(n6) );
  CLKINVX1 U3 ( .A(B[1]), .Y(n8) );
  NAND2X1 U4 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  CLKINVX1 U5 ( .A(A[0]), .Y(n1) );
  CLKINVX1 U6 ( .A(B[2]), .Y(n7) );
  CLKINVX1 U7 ( .A(B[4]), .Y(n5) );
  XNOR2X1 U8 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  CLKINVX1 U9 ( .A(B[5]), .Y(n4) );
  CLKINVX1 U10 ( .A(B[6]), .Y(n3) );
  CLKINVX1 U11 ( .A(B[7]), .Y(n2) );
  CLKINVX1 U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module interpolation_DW_mult_uns_4 ( a, b, product );
  input [3:0] a;
  input [11:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134;

  ADDFXL U3 ( .A(n13), .B(n15), .CI(n3), .CO(n2), .S(product[10]) );
  ADDFXL U4 ( .A(n18), .B(n16), .CI(n4), .CO(n3), .S(product[9]) );
  ADDFXL U5 ( .A(n19), .B(n23), .CI(n5), .CO(n4), .S(product[8]) );
  ADDFXL U6 ( .A(n24), .B(n26), .CI(n6), .CO(n5), .S(product[7]) );
  ADDFXL U7 ( .A(n27), .B(n29), .CI(n7), .CO(n6), .S(product[6]) );
  ADDFXL U11 ( .A(n11), .B(n56), .CI(n39), .CO(n10), .S(product[2]) );
  ADDHXL U12 ( .A(n65), .B(n73), .CO(n11), .S(product[1]) );
  ADDFXL U13 ( .A(n48), .B(n41), .CI(n14), .CO(n12), .S(n13) );
  CMPR42X1 U14 ( .A(n123), .B(n42), .C(n49), .D(n57), .ICI(n17), .S(n16), 
        .ICO(n14), .CO(n15) );
  CMPR42X1 U15 ( .A(n58), .B(n50), .C(n66), .D(n21), .ICI(n22), .S(n19), .ICO(
        n17), .CO(n18) );
  CMPR42X1 U17 ( .A(n51), .B(n43), .C(n59), .D(n67), .ICI(n25), .S(n24), .ICO(
        n22), .CO(n23) );
  CMPR42X1 U18 ( .A(n52), .B(n44), .C(n60), .D(n68), .ICI(n28), .S(n27), .ICO(
        n25), .CO(n26) );
  CMPR42X1 U19 ( .A(n53), .B(n45), .C(n61), .D(n69), .ICI(n31), .S(n30), .ICO(
        n28), .CO(n29) );
  CMPR42X1 U20 ( .A(n54), .B(n46), .C(n62), .D(n70), .ICI(n36), .S(n33), .ICO(
        n31), .CO(n32) );
  ADDFXL U21 ( .A(n63), .B(n71), .CI(n38), .CO(n34), .S(n35) );
  ADDHXL U22 ( .A(n55), .B(n47), .CO(n36), .S(n37) );
  ADDHXL U23 ( .A(n72), .B(n64), .CO(n38), .S(n39) );
  ADDFXL U75 ( .A(n33), .B(n34), .CI(n9), .CO(n8), .S(product[4]) );
  ADDFXL U76 ( .A(n30), .B(n32), .CI(n8), .CO(n7), .S(product[5]) );
  ADDFXL U77 ( .A(n35), .B(n37), .CI(n10), .CO(n9), .S(product[3]) );
  NOR2XL U78 ( .A(n132), .B(n124), .Y(n70) );
  NOR2XL U79 ( .A(n125), .B(n131), .Y(n62) );
  NOR2XL U80 ( .A(n132), .B(n122), .Y(n69) );
  NOR2XL U81 ( .A(n124), .B(n131), .Y(n61) );
  NOR2XL U82 ( .A(n125), .B(n130), .Y(n53) );
  NOR2XL U83 ( .A(n132), .B(n121), .Y(n68) );
  NOR2XL U84 ( .A(n122), .B(n131), .Y(n60) );
  NOR2XL U85 ( .A(n124), .B(n130), .Y(n52) );
  NOR2XL U86 ( .A(n132), .B(n120), .Y(n67) );
  NOR2XL U87 ( .A(n121), .B(n131), .Y(n59) );
  NOR2XL U88 ( .A(n122), .B(n130), .Y(n51) );
  CLKINVX2 U89 ( .A(a[3]), .Y(n129) );
  NAND2XL U90 ( .A(a[0]), .B(b[8]), .Y(n66) );
  NOR2XL U91 ( .A(n120), .B(n131), .Y(n58) );
  NOR2XL U92 ( .A(n121), .B(n130), .Y(n50) );
  NAND2XL U93 ( .A(a[1]), .B(b[8]), .Y(n57) );
  NOR2XL U94 ( .A(n120), .B(n130), .Y(n49) );
  NAND2XL U95 ( .A(a[2]), .B(b[8]), .Y(n48) );
  NOR2XL U96 ( .A(n132), .B(n128), .Y(product[0]) );
  CLKINVX2 U97 ( .A(a[1]), .Y(n131) );
  CLKINVX2 U98 ( .A(a[2]), .Y(n130) );
  CLKINVX2 U99 ( .A(a[0]), .Y(n132) );
  CLKINVX1 U100 ( .A(n21), .Y(n123) );
  NOR2X1 U101 ( .A(n129), .B(n128), .Y(n47) );
  CLKINVX1 U102 ( .A(b[3]), .Y(n125) );
  CLKINVX1 U103 ( .A(b[2]), .Y(n126) );
  CLKINVX1 U104 ( .A(b[1]), .Y(n127) );
  CLKINVX1 U105 ( .A(b[4]), .Y(n124) );
  CLKINVX1 U106 ( .A(b[5]), .Y(n122) );
  CLKINVX1 U107 ( .A(b[6]), .Y(n121) );
  CLKINVX1 U108 ( .A(b[7]), .Y(n120) );
  XOR2X1 U109 ( .A(n133), .B(n134), .Y(product[11]) );
  CLKINVX1 U110 ( .A(b[0]), .Y(n128) );
  NAND2XL U111 ( .A(b[8]), .B(a[3]), .Y(n133) );
  NOR2XL U112 ( .A(n129), .B(n120), .Y(n41) );
  NOR2XL U113 ( .A(n129), .B(n121), .Y(n42) );
  NAND2XL U114 ( .A(b[5]), .B(a[3]), .Y(n21) );
  NOR2XL U115 ( .A(n129), .B(n124), .Y(n43) );
  NOR2XL U116 ( .A(n129), .B(n125), .Y(n44) );
  NOR2XL U117 ( .A(n129), .B(n126), .Y(n45) );
  XOR2X1 U118 ( .A(n2), .B(n12), .Y(n134) );
  NOR2X1 U119 ( .A(n132), .B(n127), .Y(n73) );
  NOR2X1 U120 ( .A(n132), .B(n126), .Y(n72) );
  NOR2X1 U121 ( .A(n132), .B(n125), .Y(n71) );
  NOR2X1 U122 ( .A(n128), .B(n131), .Y(n65) );
  NOR2X1 U123 ( .A(n127), .B(n131), .Y(n64) );
  NOR2X1 U124 ( .A(n126), .B(n131), .Y(n63) );
  NOR2X1 U125 ( .A(n128), .B(n130), .Y(n56) );
  NOR2X1 U126 ( .A(n127), .B(n130), .Y(n55) );
  NOR2X1 U127 ( .A(n126), .B(n130), .Y(n54) );
  NOR2X1 U128 ( .A(n129), .B(n127), .Y(n46) );
endmodule


module interpolation_DW01_add_18_DW01_add_10 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [11:1] carry;

  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(n1), .CO(carry[6]), .S(SUM[5]) );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFXL U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFXL U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFXL U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFXL U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  XOR3X1 U1_11 ( .A(A[11]), .B(B[11]), .C(carry[11]), .Y(SUM[11]) );
  AND2X2 U1 ( .A(B[4]), .B(A[4]), .Y(n1) );
  XOR2XL U2 ( .A(B[4]), .B(A[4]), .Y(SUM[4]) );
  CLKBUFX3 U3 ( .A(B[0]), .Y(SUM[0]) );
  CLKBUFX3 U4 ( .A(B[1]), .Y(SUM[1]) );
  CLKBUFX3 U5 ( .A(B[2]), .Y(SUM[2]) );
  CLKBUFX3 U6 ( .A(B[3]), .Y(SUM[3]) );
endmodule


module interpolation_DW_div_uns_7 ( a, b, quotient, remainder, divide_by_0 );
  input [8:0] a;
  input [4:0] b;
  output [8:0] quotient;
  output [4:0] remainder;
  output divide_by_0;
  wire   n31, n32, n33, n34, \u_div/SumTmp[0][0] , \u_div/SumTmp[1][0] ,
         \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] , \u_div/SumTmp[1][3] ,
         \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] , \u_div/SumTmp[2][2] ,
         \u_div/SumTmp[2][3] , \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] ,
         \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] , \u_div/SumTmp[4][0] ,
         \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] , \u_div/SumTmp[4][3] ,
         \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] , \u_div/CryTmp[0][3] ,
         \u_div/CryTmp[0][4] , \u_div/CryTmp[1][1] , \u_div/CryTmp[1][2] ,
         \u_div/CryTmp[1][3] , \u_div/CryTmp[1][4] , \u_div/CryTmp[2][1] ,
         \u_div/CryTmp[2][2] , \u_div/CryTmp[2][3] , \u_div/CryTmp[2][4] ,
         \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] ,
         \u_div/CryTmp[3][4] , \u_div/CryTmp[4][1] , \u_div/CryTmp[4][2] ,
         \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] , \u_div/PartRem[1][1] ,
         \u_div/PartRem[1][2] , \u_div/PartRem[1][3] , \u_div/PartRem[1][4] ,
         \u_div/PartRem[1][5] , \u_div/PartRem[2][4] , \u_div/PartRem[2][5] ,
         \u_div/PartRem[3][4] , \u_div/PartRem[3][5] , \u_div/PartRem[4][4] ,
         \u_div/PartRem[4][5] , \u_div/PartRem[5][4] , \u_div/PartRem[6][1] ,
         \u_div/PartRem[7][1] , \u_div/PartRem[8][1] , \u_div/BInv[3] , n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30;
  assign \u_div/CryTmp[0][1]  = a[0];
  assign \u_div/CryTmp[1][1]  = a[1];
  assign \u_div/CryTmp[2][1]  = a[2];
  assign \u_div/CryTmp[3][1]  = a[3];
  assign \u_div/CryTmp[4][1]  = a[4];
  assign \u_div/PartRem[6][1]  = a[6];
  assign \u_div/PartRem[7][1]  = a[7];
  assign \u_div/PartRem[8][1]  = a[8];
  assign \u_div/BInv[3]  = b[4];

  CLKMX2X2 U1 ( .A(\u_div/CryTmp[2][1] ), .B(\u_div/SumTmp[2][0] ), .S0(n32), 
        .Y(n1) );
  CLKMX2X2 U2 ( .A(n13), .B(\u_div/SumTmp[3][1] ), .S0(n31), .Y(n2) );
  CLKMX2X2 U3 ( .A(n12), .B(\u_div/SumTmp[2][1] ), .S0(n32), .Y(n3) );
  CLKMX2X2 U4 ( .A(a[5]), .B(\u_div/SumTmp[4][1] ), .S0(n21), .Y(n4) );
  CLKMX2X2 U5 ( .A(n4), .B(\u_div/SumTmp[3][2] ), .S0(n31), .Y(n5) );
  CLKMX2X2 U6 ( .A(n2), .B(\u_div/SumTmp[2][2] ), .S0(n32), .Y(n6) );
  CLKMX2X2 U7 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[4][2] ), .S0(n21), 
        .Y(n7) );
  XOR2X1 U8 ( .A(\u_div/PartRem[1][3] ), .B(\u_div/CryTmp[0][3] ), .Y(n8) );
  XOR2X1 U9 ( .A(\u_div/PartRem[1][2] ), .B(\u_div/CryTmp[0][2] ), .Y(n9) );
  XOR2X1 U10 ( .A(\u_div/PartRem[1][1] ), .B(\u_div/CryTmp[0][1] ), .Y(n10) );
  XNOR2X1 U11 ( .A(\u_div/PartRem[1][4] ), .B(\u_div/CryTmp[0][4] ), .Y(n11)
         );
  OR2X1 U12 ( .A(\u_div/PartRem[4][5] ), .B(n14), .Y(n31) );
  OR2XL U13 ( .A(a[5]), .B(\u_div/CryTmp[4][1] ), .Y(\u_div/CryTmp[4][2] ) );
  OR2XL U14 ( .A(n13), .B(\u_div/CryTmp[3][1] ), .Y(\u_div/CryTmp[3][2] ) );
  MXI2X1 U15 ( .A(\u_div/SumTmp[3][0] ), .B(\u_div/CryTmp[3][1] ), .S0(n31), 
        .Y(n12) );
  INVXL U16 ( .A(\u_div/CryTmp[3][1] ), .Y(\u_div/SumTmp[3][0] ) );
  MXI2X1 U17 ( .A(\u_div/SumTmp[4][0] ), .B(\u_div/CryTmp[4][1] ), .S0(n21), 
        .Y(n13) );
  INVXL U18 ( .A(\u_div/CryTmp[4][1] ), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2XL U19 ( .A(n13), .B(\u_div/CryTmp[3][1] ), .Y(\u_div/SumTmp[3][1] ) );
  XNOR2XL U20 ( .A(a[5]), .B(\u_div/CryTmp[4][1] ), .Y(\u_div/SumTmp[4][1] )
         );
  INVXL U21 ( .A(\u_div/PartRem[8][1] ), .Y(n23) );
  AND2X2 U22 ( .A(\u_div/CryTmp[3][4] ), .B(\u_div/PartRem[4][4] ), .Y(n14) );
  AND2X2 U23 ( .A(\u_div/CryTmp[2][4] ), .B(\u_div/PartRem[3][4] ), .Y(n15) );
  AND2X2 U24 ( .A(\u_div/CryTmp[1][4] ), .B(\u_div/PartRem[2][4] ), .Y(n16) );
  AND2X2 U25 ( .A(\u_div/CryTmp[0][4] ), .B(\u_div/PartRem[1][4] ), .Y(n17) );
  OR2X1 U26 ( .A(\u_div/PartRem[2][5] ), .B(n16), .Y(n33) );
  MXI2X1 U27 ( .A(n25), .B(n20), .S0(n32), .Y(\u_div/PartRem[2][5] ) );
  OR2X1 U28 ( .A(\u_div/PartRem[1][5] ), .B(n17), .Y(n34) );
  MXI2X1 U29 ( .A(n26), .B(n18), .S0(n33), .Y(\u_div/PartRem[1][5] ) );
  CLKINVX1 U30 ( .A(n27), .Y(\u_div/PartRem[1][4] ) );
  CLKINVX1 U31 ( .A(n25), .Y(\u_div/PartRem[3][4] ) );
  CLKINVX1 U32 ( .A(n26), .Y(\u_div/PartRem[2][4] ) );
  XNOR2X1 U33 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/CryTmp[1][4] ), .Y(n18)
         );
  XNOR2X1 U34 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/CryTmp[3][4] ), .Y(n19)
         );
  XNOR2X1 U35 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/CryTmp[2][4] ), .Y(n20)
         );
  MXI2X1 U36 ( .A(n27), .B(n11), .S0(n34), .Y(remainder[4]) );
  AND2X2 U37 ( .A(\u_div/CryTmp[4][4] ), .B(\u_div/PartRem[5][4] ), .Y(n21) );
  OR2X1 U38 ( .A(n7), .B(\u_div/CryTmp[3][3] ), .Y(\u_div/CryTmp[3][4] ) );
  OR2X1 U39 ( .A(n5), .B(\u_div/CryTmp[2][3] ), .Y(\u_div/CryTmp[2][4] ) );
  OR2X1 U40 ( .A(n6), .B(\u_div/CryTmp[1][3] ), .Y(\u_div/CryTmp[1][4] ) );
  OR2X1 U41 ( .A(\u_div/PartRem[1][3] ), .B(\u_div/CryTmp[0][3] ), .Y(
        \u_div/CryTmp[0][4] ) );
  OR2X1 U42 ( .A(\u_div/PartRem[3][5] ), .B(n15), .Y(n32) );
  MXI2X1 U43 ( .A(n24), .B(n19), .S0(n31), .Y(\u_div/PartRem[3][5] ) );
  MXI2X1 U44 ( .A(n28), .B(n8), .S0(n34), .Y(remainder[3]) );
  CLKINVX1 U45 ( .A(n28), .Y(\u_div/PartRem[1][3] ) );
  MXI2X1 U46 ( .A(n6), .B(\u_div/SumTmp[1][3] ), .S0(n33), .Y(n27) );
  XNOR2X1 U47 ( .A(n6), .B(\u_div/CryTmp[1][3] ), .Y(\u_div/SumTmp[1][3] ) );
  MXI2X1 U48 ( .A(n7), .B(\u_div/SumTmp[3][3] ), .S0(n31), .Y(n25) );
  XNOR2X1 U49 ( .A(n7), .B(\u_div/CryTmp[3][3] ), .Y(\u_div/SumTmp[3][3] ) );
  MXI2X1 U50 ( .A(n5), .B(\u_div/SumTmp[2][3] ), .S0(n32), .Y(n26) );
  XNOR2X1 U51 ( .A(n5), .B(\u_div/CryTmp[2][3] ), .Y(\u_div/SumTmp[2][3] ) );
  CLKINVX1 U52 ( .A(n24), .Y(\u_div/PartRem[4][4] ) );
  XNOR2X1 U53 ( .A(\u_div/PartRem[5][4] ), .B(\u_div/CryTmp[4][4] ), .Y(n22)
         );
  MXI2X1 U54 ( .A(n23), .B(n22), .S0(n21), .Y(\u_div/PartRem[4][5] ) );
  CLKINVX1 U55 ( .A(n30), .Y(\u_div/PartRem[1][1] ) );
  OR2X1 U56 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/CryTmp[4][2] ), .Y(
        \u_div/CryTmp[4][3] ) );
  OR2X1 U57 ( .A(n3), .B(\u_div/CryTmp[1][2] ), .Y(\u_div/CryTmp[1][3] ) );
  OR2X1 U58 ( .A(\u_div/PartRem[1][2] ), .B(\u_div/CryTmp[0][2] ), .Y(
        \u_div/CryTmp[0][3] ) );
  OR2X1 U59 ( .A(n4), .B(\u_div/CryTmp[3][2] ), .Y(\u_div/CryTmp[3][3] ) );
  OR2X1 U60 ( .A(n2), .B(\u_div/CryTmp[2][2] ), .Y(\u_div/CryTmp[2][3] ) );
  OR2X1 U61 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/CryTmp[4][3] ), .Y(
        \u_div/CryTmp[4][4] ) );
  MXI2X1 U62 ( .A(n29), .B(n9), .S0(n34), .Y(remainder[2]) );
  CLKINVX1 U63 ( .A(n29), .Y(\u_div/PartRem[1][2] ) );
  MXI2X1 U64 ( .A(n3), .B(\u_div/SumTmp[1][2] ), .S0(n33), .Y(n28) );
  XNOR2X1 U65 ( .A(n3), .B(\u_div/CryTmp[1][2] ), .Y(\u_div/SumTmp[1][2] ) );
  XNOR2X1 U66 ( .A(n4), .B(\u_div/CryTmp[3][2] ), .Y(\u_div/SumTmp[3][2] ) );
  XNOR2X1 U67 ( .A(n2), .B(\u_div/CryTmp[2][2] ), .Y(\u_div/SumTmp[2][2] ) );
  XNOR2X1 U68 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/CryTmp[4][2] ), .Y(
        \u_div/SumTmp[4][2] ) );
  CLKINVX1 U69 ( .A(n23), .Y(\u_div/PartRem[5][4] ) );
  MXI2X1 U70 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[4][3] ), .S0(n21), 
        .Y(n24) );
  XNOR2X1 U71 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/CryTmp[4][3] ), .Y(
        \u_div/SumTmp[4][3] ) );
  MXI2X1 U72 ( .A(\u_div/CryTmp[1][1] ), .B(\u_div/SumTmp[1][0] ), .S0(n33), 
        .Y(n30) );
  CLKINVX1 U73 ( .A(\u_div/CryTmp[1][1] ), .Y(\u_div/SumTmp[1][0] ) );
  CLKINVX1 U74 ( .A(\u_div/CryTmp[2][1] ), .Y(\u_div/SumTmp[2][0] ) );
  OR2X1 U75 ( .A(n1), .B(\u_div/CryTmp[1][1] ), .Y(\u_div/CryTmp[1][2] ) );
  MXI2X1 U76 ( .A(n30), .B(n10), .S0(n34), .Y(remainder[1]) );
  OR2X1 U77 ( .A(n12), .B(\u_div/CryTmp[2][1] ), .Y(\u_div/CryTmp[2][2] ) );
  OR2X1 U78 ( .A(\u_div/PartRem[1][1] ), .B(\u_div/CryTmp[0][1] ), .Y(
        \u_div/CryTmp[0][2] ) );
  CLKMX2X2 U79 ( .A(\u_div/CryTmp[0][1] ), .B(\u_div/SumTmp[0][0] ), .S0(n34), 
        .Y(remainder[0]) );
  MXI2X1 U80 ( .A(n1), .B(\u_div/SumTmp[1][1] ), .S0(n33), .Y(n29) );
  XNOR2X1 U81 ( .A(n1), .B(\u_div/CryTmp[1][1] ), .Y(\u_div/SumTmp[1][1] ) );
  XNOR2X1 U82 ( .A(n12), .B(\u_div/CryTmp[2][1] ), .Y(\u_div/SumTmp[2][1] ) );
  CLKINVX1 U83 ( .A(\u_div/CryTmp[0][1] ), .Y(\u_div/SumTmp[0][0] ) );
endmodule


module interpolation_DW_div_uns_13 ( a, b, quotient, remainder, divide_by_0 );
  input [8:0] a;
  input [4:0] b;
  output [8:0] quotient;
  output [4:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[3][0] ,
         \u_div/SumTmp[3][1] , \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] ,
         \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] ,
         \u_div/SumTmp[4][3] , \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] ,
         \u_div/CryTmp[0][4] , \u_div/CryTmp[1][1] , \u_div/CryTmp[1][2] ,
         \u_div/CryTmp[1][3] , \u_div/CryTmp[1][4] , \u_div/CryTmp[2][1] ,
         \u_div/CryTmp[2][2] , \u_div/CryTmp[2][3] , \u_div/CryTmp[2][4] ,
         \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] ,
         \u_div/CryTmp[3][4] , \u_div/CryTmp[4][1] , \u_div/CryTmp[4][2] ,
         \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] , \u_div/PartRem[1][1] ,
         \u_div/PartRem[1][2] , \u_div/PartRem[1][4] , \u_div/PartRem[1][5] ,
         \u_div/PartRem[2][1] , \u_div/PartRem[2][2] , \u_div/PartRem[2][3] ,
         \u_div/PartRem[2][4] , \u_div/PartRem[2][5] , \u_div/PartRem[3][4] ,
         \u_div/PartRem[4][4] , \u_div/PartRem[4][5] , \u_div/PartRem[5][3] ,
         \u_div/PartRem[5][4] , \u_div/PartRem[6][1] , \u_div/PartRem[7][1] ,
         \u_div/PartRem[8][1] , \u_div/BInv[3] , n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31;
  assign \u_div/CryTmp[0][1]  = a[0];
  assign \u_div/CryTmp[1][1]  = a[1];
  assign \u_div/CryTmp[2][1]  = a[2];
  assign \u_div/CryTmp[3][1]  = a[3];
  assign \u_div/CryTmp[4][1]  = a[4];
  assign \u_div/PartRem[6][1]  = a[6];
  assign \u_div/PartRem[7][1]  = a[7];
  assign \u_div/PartRem[8][1]  = a[8];
  assign \u_div/BInv[3]  = b[4];

  CLKINVX1 U1 ( .A(n25), .Y(\u_div/PartRem[5][3] ) );
  CLKINVX1 U2 ( .A(\u_div/PartRem[7][1] ), .Y(n25) );
  NAND2X1 U3 ( .A(n31), .B(n11), .Y(\u_div/CryTmp[4][3] ) );
  NOR2X1 U4 ( .A(\u_div/CryTmp[4][1] ), .B(\u_div/PartRem[6][1] ), .Y(n11) );
  CLKINVX1 U5 ( .A(\u_div/PartRem[8][1] ), .Y(n23) );
  AND2X2 U6 ( .A(\u_div/CryTmp[4][4] ), .B(\u_div/PartRem[5][4] ), .Y(
        quotient[4]) );
  NAND2X1 U7 ( .A(\u_div/CryTmp[2][4] ), .B(\u_div/PartRem[3][4] ), .Y(n1) );
  CLKMX2X2 U8 ( .A(\u_div/CryTmp[4][1] ), .B(\u_div/SumTmp[4][0] ), .S0(
        quotient[4]), .Y(n2) );
  CLKMX2X2 U9 ( .A(\u_div/CryTmp[3][1] ), .B(\u_div/SumTmp[3][0] ), .S0(
        quotient[3]), .Y(n3) );
  AND2X2 U10 ( .A(\u_div/PartRem[1][4] ), .B(\u_div/CryTmp[0][4] ), .Y(n4) );
  CLKMX2X2 U11 ( .A(n29), .B(n12), .S0(quotient[1]), .Y(n5) );
  CLKMX2X2 U12 ( .A(n2), .B(\u_div/SumTmp[3][1] ), .S0(quotient[3]), .Y(n6) );
  CLKMX2X2 U13 ( .A(a[5]), .B(\u_div/SumTmp[4][1] ), .S0(quotient[4]), .Y(n7)
         );
  CLKMX2X2 U14 ( .A(n7), .B(\u_div/SumTmp[3][2] ), .S0(quotient[3]), .Y(n8) );
  CLKMX2X2 U15 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(n9) );
  CLKMX2X2 U16 ( .A(n24), .B(n18), .S0(quotient[3]), .Y(n10) );
  OR2X1 U17 ( .A(a[5]), .B(\u_div/CryTmp[4][1] ), .Y(\u_div/CryTmp[4][2] ) );
  CLKINVX1 U18 ( .A(a[5]), .Y(n31) );
  CLKINVX1 U19 ( .A(n30), .Y(\u_div/PartRem[2][1] ) );
  OR2X1 U20 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/CryTmp[1][1] ), .Y(
        \u_div/CryTmp[1][2] ) );
  OR2X2 U21 ( .A(\u_div/PartRem[2][5] ), .B(n14), .Y(quotient[1]) );
  OR2X1 U22 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/CryTmp[4][3] ), .Y(
        \u_div/CryTmp[4][4] ) );
  XOR2XL U23 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/CryTmp[1][2] ), .Y(n12) );
  XOR2XL U24 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/CryTmp[1][1] ), .Y(n13) );
  AND2X2 U25 ( .A(\u_div/CryTmp[1][4] ), .B(\u_div/PartRem[2][4] ), .Y(n14) );
  OR2X1 U26 ( .A(n8), .B(\u_div/CryTmp[2][3] ), .Y(\u_div/CryTmp[2][4] ) );
  OR2X1 U27 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/CryTmp[1][3] ), .Y(
        \u_div/CryTmp[1][4] ) );
  OR2X1 U28 ( .A(n9), .B(\u_div/CryTmp[3][3] ), .Y(\u_div/CryTmp[3][4] ) );
  OR2X2 U29 ( .A(\u_div/PartRem[4][5] ), .B(n15), .Y(quotient[3]) );
  OR2X1 U30 ( .A(n6), .B(\u_div/CryTmp[2][2] ), .Y(\u_div/CryTmp[2][3] ) );
  OR2X1 U31 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/CryTmp[1][2] ), .Y(
        \u_div/CryTmp[1][3] ) );
  OR2X1 U32 ( .A(n7), .B(\u_div/CryTmp[3][2] ), .Y(\u_div/CryTmp[3][3] ) );
  OR2X1 U33 ( .A(n2), .B(\u_div/CryTmp[3][1] ), .Y(\u_div/CryTmp[3][2] ) );
  MXI2XL U34 ( .A(n26), .B(n17), .S0(quotient[2]), .Y(\u_div/PartRem[2][5] )
         );
  XNOR2XL U35 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/CryTmp[1][4] ), .Y(n16)
         );
  XNOR2XL U36 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/CryTmp[3][4] ), .Y(n18)
         );
  XNOR2XL U37 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/CryTmp[2][4] ), .Y(n17)
         );
  MXI2XL U38 ( .A(n9), .B(\u_div/SumTmp[3][3] ), .S0(quotient[3]), .Y(n26) );
  XNOR2XL U39 ( .A(n9), .B(\u_div/CryTmp[3][3] ), .Y(\u_div/SumTmp[3][3] ) );
  MXI2XL U40 ( .A(n8), .B(\u_div/SumTmp[2][3] ), .S0(quotient[2]), .Y(n27) );
  XNOR2XL U41 ( .A(n8), .B(\u_div/CryTmp[2][3] ), .Y(\u_div/SumTmp[2][3] ) );
  XOR2XL U42 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/CryTmp[1][3] ), .Y(n20) );
  XNOR2XL U43 ( .A(\u_div/PartRem[5][4] ), .B(\u_div/CryTmp[4][4] ), .Y(n21)
         );
  MXI2XL U44 ( .A(n23), .B(n21), .S0(quotient[4]), .Y(\u_div/PartRem[4][5] )
         );
  MXI2XL U45 ( .A(n6), .B(\u_div/SumTmp[2][2] ), .S0(quotient[2]), .Y(n28) );
  XNOR2XL U46 ( .A(n6), .B(\u_div/CryTmp[2][2] ), .Y(\u_div/SumTmp[2][2] ) );
  MXI2XL U47 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(n24) );
  XNOR2XL U48 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/CryTmp[4][3] ), .Y(
        \u_div/SumTmp[4][3] ) );
  INVXL U49 ( .A(\u_div/CryTmp[3][1] ), .Y(\u_div/SumTmp[3][0] ) );
  INVXL U50 ( .A(\u_div/CryTmp[4][1] ), .Y(\u_div/SumTmp[4][0] ) );
  MXI2XL U51 ( .A(n3), .B(\u_div/SumTmp[2][1] ), .S0(quotient[2]), .Y(n29) );
  XNOR2XL U52 ( .A(n3), .B(\u_div/CryTmp[2][1] ), .Y(\u_div/SumTmp[2][1] ) );
  OR2X1 U53 ( .A(\u_div/PartRem[1][5] ), .B(n4), .Y(quotient[0]) );
  MXI2X1 U54 ( .A(n27), .B(n16), .S0(quotient[1]), .Y(\u_div/PartRem[1][5] )
         );
  AND2X2 U55 ( .A(\u_div/CryTmp[3][4] ), .B(\u_div/PartRem[4][4] ), .Y(n15) );
  CLKINVX1 U56 ( .A(n27), .Y(\u_div/PartRem[2][4] ) );
  CLKINVX1 U57 ( .A(n26), .Y(\u_div/PartRem[3][4] ) );
  NAND2X2 U58 ( .A(n10), .B(n1), .Y(quotient[2]) );
  MXI2X1 U59 ( .A(n28), .B(n20), .S0(quotient[1]), .Y(\u_div/PartRem[1][4] )
         );
  NAND2X1 U60 ( .A(n5), .B(n22), .Y(\u_div/CryTmp[0][4] ) );
  CLKINVX1 U61 ( .A(n28), .Y(\u_div/PartRem[2][3] ) );
  CLKINVX1 U62 ( .A(n24), .Y(\u_div/PartRem[4][4] ) );
  NOR2X1 U63 ( .A(\u_div/PartRem[1][2] ), .B(\u_div/CryTmp[0][2] ), .Y(n22) );
  CLKINVX1 U64 ( .A(n29), .Y(\u_div/PartRem[2][2] ) );
  XNOR2X1 U65 ( .A(n7), .B(\u_div/CryTmp[3][2] ), .Y(\u_div/SumTmp[3][2] ) );
  XNOR2X1 U66 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/CryTmp[4][2] ), .Y(
        \u_div/SumTmp[4][2] ) );
  CLKINVX1 U67 ( .A(n23), .Y(\u_div/PartRem[5][4] ) );
  MXI2X1 U68 ( .A(\u_div/CryTmp[2][1] ), .B(\u_div/SumTmp[2][0] ), .S0(
        quotient[2]), .Y(n30) );
  CLKINVX1 U69 ( .A(\u_div/CryTmp[2][1] ), .Y(\u_div/SumTmp[2][0] ) );
  OR2X1 U70 ( .A(\u_div/PartRem[1][1] ), .B(\u_div/CryTmp[0][1] ), .Y(
        \u_div/CryTmp[0][2] ) );
  MXI2X1 U71 ( .A(\u_div/SumTmp[1][0] ), .B(\u_div/CryTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][1] ) );
  OR2X1 U72 ( .A(n3), .B(\u_div/CryTmp[2][1] ), .Y(\u_div/CryTmp[2][2] ) );
  MXI2X1 U73 ( .A(n30), .B(n13), .S0(quotient[1]), .Y(\u_div/PartRem[1][2] )
         );
  XNOR2X1 U74 ( .A(n2), .B(\u_div/CryTmp[3][1] ), .Y(\u_div/SumTmp[3][1] ) );
  XNOR2X1 U75 ( .A(a[5]), .B(\u_div/CryTmp[4][1] ), .Y(\u_div/SumTmp[4][1] )
         );
  CLKINVX1 U76 ( .A(\u_div/CryTmp[1][1] ), .Y(\u_div/SumTmp[1][0] ) );
endmodule


module interpolation ( clk, RST, START, H0, V0, SW, SH, REN, R_DATA, ADDR, 
        O_DATA, O_VALID );
  input [5:0] H0;
  input [5:0] V0;
  input [3:0] SW;
  input [3:0] SH;
  input [7:0] R_DATA;
  output [11:0] ADDR;
  output [7:0] O_DATA;
  input clk, RST, START;
  output REN, O_VALID;
  wire   N0, N1, N2, N3, N4, N40, N41, N42, N43, N44, N45, N46, N47, N48, N49,
         N50, N51, N52, N56, N57, N58, N59, N92, N93, N94, N95, N96, N97, N98,
         N99, N100, N101, N102, N103, N173, N180, N181, N182, N183, N184, N185,
         N192, N193, N194, N195, N196, N197, N198, N199, N200, N201, N202,
         N203, N217, N218, N219, N220, N221, N222, N223, N224, N225, N226,
         N227, N228, N270, N271, N272, N273, N274, N275, N276, N277, N291,
         N298, N299, N300, N301, N302, N303, N304, N305, N306, N307, N308,
         N309, N336, N337, N338, N339, N340, N341, N356, N364, N365, N366,
         N367, N368, N369, N370, N371, N372, N373, N374, N375, N413, N414,
         N415, N416, N417, N418, N446, N447, N448, N449, N450, N451, N485,
         N486, N487, N488, N489, N490, N674, N675, N676, N677, N678, N679,
         N680, N681, N682, N683, N684, N685, N686, N687, N688, N689, N690,
         N691, N692, N693, N694, N695, N696, N697, N698, N699, N700, N701,
         N702, N724, N725, N726, N727, N736, N746, N747, N748, N749, N750,
         N751, N752, N753, N754, N755, N756, N757, N758, N759, N760, N761,
         N762, N763, N764, N765, N766, N767, N768, N769, N770, N771, N772,
         N773, N774, N796, N797, N798, N799, N808, N875, N876, N877, N878,
         N879, N880, N881, N882, N883, N884, N885, N886, N887, N888, N889,
         N890, N912, N913, N914, N915, N916, N917, N918, N919, N920, N921,
         N922, N923, N924, N947, N948, N949, N950, N951, N952, N953, N954,
         N955, N956, N957, N958, N959, N960, N961, N962, N980, N981, N982,
         N983, N984, N985, N986, N987, N996, N997, N998, N999, N1000, N1001,
         N1002, N1003, N1004, n162, n165, n166, n167, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n243, n245, n246, n248, n249, n250, n251, n252,
         n253, n254, n256, n257, n258, n260, n270, n271, n272, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n291, n292, n293, n294, n295, n296, n299,
         n300, n301, n302, n304, n305, n306, n307, n308, n310, n311, n312,
         n313, n314, n315, n316, n317, n318, n319, n320, n321, n323, n324,
         n325, n326, n327, n328, n329, n331, n332, n333, n334, n335, n337,
         n338, n339, n341, n342, n344, n345, n346, n347, n349, n350, n351,
         n352, n353, n354, n356, n357, n358, n359, n360, n361, n362, n363,
         n364, n365, n366, n367, n368, n369, n370, n371, n372, n373, n374,
         n375, n376, n377, n378, n379, n380, n381, n382, n383, n384, n385,
         n386, n387, n388, n389, n390, n391, n392, n393, n394, n395, n396,
         n397, n398, n399, n400, n401, n402, n403, n404, n405, n406, n407,
         n408, n409, n410, n411, n412, n413, n414, n415, n416, n417, n418,
         n419, n420, n421, n422, n423, n424, n425, n426, n427, n428, n429,
         n430, n431, n432, n433, n434, n435, n436, n437, n438, n439, n440,
         n441, n442, n443, n444, n445, n446, n447, n449, N329, N328, N327,
         N326, N325, N324, N297, N296, N295, N294, N293, N292, N979, N978,
         N977, N976, N975, N974, N973, N972, N971, N970, N969, N968, N967,
         N966, N965, N964, N963, N946, N945, N944, N943, N942, N941, N940,
         N939, N938, N937, N936, N935, N934, N933, N932, N931, N930, N929,
         N928, N927, N926, N874, N873, N872, N871, N870, N869, N868, N867,
         N866, N865, N864, N863, N862, N861, N860, N859, N858, N857, N856,
         N855, N854, N911, N910, N909, N908, N907, N906, N905, N904, N903,
         N902, N901, N900, N899, N898, N897, N896, N895, N894, N893, N892,
         N891, \mult_64/n51 , \mult_64/n50 , \mult_64/n49 , \mult_64/n44 ,
         \mult_64/n43 , \mult_64/n42 , \mult_64/n37 , \mult_64/n36 ,
         \mult_64/n31 , \mult_64/n26 , \mult_64/n25 , \mult_64/n24 ,
         \mult_64/n22 , \mult_64/n7 , \mult_64/n6 , n450, n451, n452, n453,
         n454, n455, n456, n457, n458, n459, n460, n461, n462, n463, n464,
         n465, n466, n467, n468, n469, n470, n471, n472, n473, n474, n475,
         n476, n477, n478, n479, n480, n481, n482, n483, n484, n485, n486,
         n487, n488, n489, n490, n491, n492, n493, n494, n495, n496, n497,
         n498, n499, n500, n501, n502, n503, n504, n505, n506, n507, n508,
         n509, n510, n511, n512, n513, n514, n515, n516, n517, n518, n519,
         n520, n521, n522;
  wire   [8:0] counter_r;
  wire   [7:0] data_ul_r;
  wire   [7:0] data_ur_r;
  wire   [7:0] data_ll_r;
  wire   [7:0] data_lr_r;
  wire   [7:4] width_r;
  wire   [7:4] height_r;
  wire   [5:0] v0_r;
  wire   [11:1] \add_0_root_add_107_2/carry ;
  wire   [7:1] \r756/carry ;
  wire   [6:1] \r751/carry ;
  wire   [6:1] \r742/carry ;
  wire   [11:1] \add_0_root_add_113_3/carry ;
  wire   [11:1] \add_149_4/carry ;
  wire   [11:1] \add_155_5/carry ;
  wire   [11:1] \add_141_4/carry ;
  wire   [11:1] \add_152_4/carry ;
  wire   [11:1] \add_144_4/carry ;
  wire   [11:1] \add_136_3/carry ;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29, 
        SYNOPSYS_UNCONNECTED__30, SYNOPSYS_UNCONNECTED__31, 
        SYNOPSYS_UNCONNECTED__32, SYNOPSYS_UNCONNECTED__33, 
        SYNOPSYS_UNCONNECTED__34, SYNOPSYS_UNCONNECTED__35, 
        SYNOPSYS_UNCONNECTED__36, SYNOPSYS_UNCONNECTED__37, 
        SYNOPSYS_UNCONNECTED__38, SYNOPSYS_UNCONNECTED__39, 
        SYNOPSYS_UNCONNECTED__40, SYNOPSYS_UNCONNECTED__41, 
        SYNOPSYS_UNCONNECTED__42, SYNOPSYS_UNCONNECTED__43, 
        SYNOPSYS_UNCONNECTED__44;
  assign N92 = H0[0];
  assign N93 = H0[1];
  assign N94 = H0[2];
  assign N95 = H0[3];
  assign N96 = H0[4];
  assign N97 = H0[5];
  assign N98 = V0[0];
  assign N99 = V0[1];
  assign N100 = V0[2];
  assign N101 = V0[3];
  assign N102 = V0[4];
  assign N103 = V0[5];

  OAI211X2 U155 ( .A0(n520), .A1(n301), .B0(n464), .C0(n515), .Y(n281) );
  OAI211X2 U164 ( .A0(n352), .A1(n306), .B0(n307), .C0(n308), .Y(n305) );
  OAI211X2 U176 ( .A0(n353), .A1(n501), .B0(n307), .C0(n313), .Y(n312) );
  interpolation_DW01_inc_0_DW01_inc_1 add_282 ( .A({counter_r[8:7], n455, n459, 
        counter_r[4:0]}), .SUM({N1004, N1003, N1002, N1001, N1000, N999, N998, 
        N997, N996}) );
  interpolation_DW01_add_2 r769 ( .A({data_ul_r, 1'b0, 1'b0, 1'b0, 1'b0}), .B(
        {N766, N765, N764, N763, N762, N761, N760, N759, N758, N757, N756, 
        N755}), .CI(1'b0), .SUM({N774, N773, N772, N771, N770, N769, N768, 
        N767, N799, N798, N797, N796}) );
  interpolation_DW_mult_uns_0 r768 ( .a({N43, N42, N41, N40}), .b({N754, N754, 
        N754, N754, N753, N752, N751, N750, N749, N748, N747, N746}), 
        .product({SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, N766, N765, N764, 
        N763, N762, N761, N760, N759, N758, N757, N756, N755}) );
  interpolation_DW01_sub_0 r767 ( .A({1'b0, data_ur_r}), .B({1'b0, data_ul_r}), 
        .CI(1'b0), .DIFF({N754, N753, N752, N751, N750, N749, N748, N747, N746}) );
  interpolation_DW01_add_3 r765 ( .A({data_ul_r, 1'b0, 1'b0, 1'b0, 1'b0}), .B(
        {N694, N693, N692, N691, N690, N689, N688, N687, N686, N685, N684, 
        N683}), .CI(1'b0), .SUM({N702, N701, N700, N699, N698, N697, N696, 
        N695, N727, N726, N725, N724}) );
  interpolation_DW_mult_uns_1 r764 ( .a({N59, N58, N57, N56}), .b({N682, N682, 
        N682, N682, N681, N680, N679, N678, N677, N676, N675, N674}), 
        .product({SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, N694, N693, N692, 
        N691, N690, N689, N688, N687, N686, N685, N684, N683}) );
  interpolation_DW01_sub_1 r763 ( .A({1'b0, data_ll_r}), .B({1'b0, data_ul_r}), 
        .CI(1'b0), .DIFF({N682, N681, N680, N679, N678, N677, N676, N675, N674}) );
  interpolation_DW01_add_24_DW01_add_16 r754 ( .A(v0_r), .B({1'b0, 1'b0, N277, 
        N276, N275, N274}), .CI(1'b1), .SUM({N329, N328, N327, N326, N325, 
        N324}) );
  interpolation_DW01_add_29_DW01_add_21 r752 ( .A(v0_r), .B({1'b0, 1'b0, N277, 
        N276, N275, N274}), .CI(1'b0), .SUM({N297, N296, N295, N294, N293, 
        N292}) );
  interpolation_DW01_sub_5 sub_265 ( .A({1'b0, N962, N961, N960, N959, N958, 
        N957, N956, N955}), .B({1'b0, N890, N889, N888, N887, N886, N885, N884, 
        N883}), .CI(1'b0), .DIFF({N971, N970, N969, N968, N967, N966, N965, 
        N964, N963}) );
  interpolation_DW_mult_uns_8 mult_265 ( .a({N43, N42, N41, N40}), .b({N971, 
        N971, N971, N971, N970, N969, N968, N967, N966, N965, N964, N963}), 
        .product({SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, N979, N978, N977, 
        N976, N975, N974, N973, N972, SYNOPSYS_UNCONNECTED__12, 
        SYNOPSYS_UNCONNECTED__13, SYNOPSYS_UNCONNECTED__14, 
        SYNOPSYS_UNCONNECTED__15}) );
  interpolation_DW01_add_30_DW01_add_22 add_267_2 ( .A({N890, N889, N888, N887, 
        N886, N885, N884, N883}), .B({N979, N978, N977, N976, N975, N974, N973, 
        N972}), .CI(1'b0), .SUM({N987, N986, N985, N984, N983, N982, N981, 
        N980}) );
  interpolation_DW_mult_uns_2 mult_125 ( .a({1'b0, 1'b0, 1'b0, N52, N51, N50, 
        N49, N48}), .b(height_r), .product({SYNOPSYS_UNCONNECTED__16, 
        SYNOPSYS_UNCONNECTED__17, SYNOPSYS_UNCONNECTED__18, 
        SYNOPSYS_UNCONNECTED__19, N277, N276, N275, N274, N273, N272, N271, 
        N270}) );
  interpolation_DW_mult_uns_7 r734 ( .a({N4, N3, N2, N1, N0}), .b(width_r), 
        .product({SYNOPSYS_UNCONNECTED__20, N47, N46, N45, N44, N43, N42, N41, 
        N40}) );
  interpolation_DW01_sub_4 sub_258_2 ( .A({1'b0, data_lr_r}), .B({1'b0, 
        data_ur_r}), .CI(1'b0), .DIFF({N934, N933, N932, N931, N930, N929, 
        N928, N927, N926}) );
  interpolation_DW_mult_uns_6 mult_258_2 ( .a({N59, n462, N57, n457}), .b({
        N934, N934, N934, N934, N933, N932, N931, N930, N929, N928, N927, N926}), .product({SYNOPSYS_UNCONNECTED__21, SYNOPSYS_UNCONNECTED__22, 
        SYNOPSYS_UNCONNECTED__23, SYNOPSYS_UNCONNECTED__24, N946, N945, N944, 
        N943, N942, N941, N940, N939, N938, N937, N936, N935}) );
  interpolation_DW01_add_20_DW01_add_12 add_258_2 ( .A({data_ur_r, 1'b0, 1'b0, 
        1'b0, 1'b0}), .B({N946, N945, N944, N943, N942, N941, N940, N939, N938, 
        N937, N936, N935}), .CI(1'b0), .SUM({N954, N953, N952, N951, N950, 
        N949, N948, N947, SYNOPSYS_UNCONNECTED__25, SYNOPSYS_UNCONNECTED__26, 
        SYNOPSYS_UNCONNECTED__27, SYNOPSYS_UNCONNECTED__28}) );
  interpolation_DW01_sub_3 sub_251_2 ( .A({1'b0, data_ll_r}), .B({1'b0, 
        data_ul_r}), .CI(1'b0), .DIFF({N862, N861, N860, N859, N858, N857, 
        N856, N855, N854}) );
  interpolation_DW_mult_uns_5 mult_251_2 ( .a({N59, n461, N57, n458}), .b({
        N862, N862, N862, N862, N861, N860, N859, N858, N857, N856, N855, N854}), .product({SYNOPSYS_UNCONNECTED__29, SYNOPSYS_UNCONNECTED__30, 
        SYNOPSYS_UNCONNECTED__31, SYNOPSYS_UNCONNECTED__32, N874, N873, N872, 
        N871, N870, N869, N868, N867, N866, N865, N864, N863}) );
  interpolation_DW01_add_19_DW01_add_11 add_251_2 ( .A({data_ul_r, 1'b0, 1'b0, 
        1'b0, 1'b0}), .B({N874, N873, N872, N871, N870, N869, N868, N867, N866, 
        N865, N864, N863}), .CI(1'b0), .SUM({N882, N881, N880, N879, N878, 
        N877, N876, N875, SYNOPSYS_UNCONNECTED__33, SYNOPSYS_UNCONNECTED__34, 
        SYNOPSYS_UNCONNECTED__35, SYNOPSYS_UNCONNECTED__36}) );
  interpolation_DW01_add_17_DW01_add_9 r744 ( .A(v0_r), .B({1'b0, 1'b0, 
        height_r}), .CI(1'b0), .SUM({N203, N202, N201, N200, N199, N198}) );
  interpolation_DW01_sub_2 sub_258 ( .A({1'b0, data_lr_r}), .B({1'b0, 
        data_ur_r}), .CI(1'b0), .DIFF({N899, N898, N897, N896, N895, N894, 
        N893, N892, N891}) );
  interpolation_DW_mult_uns_4 mult_258 ( .a({N59, n462, N57, n457}), .b({N899, 
        N899, N899, N899, N898, N897, N896, N895, N894, N893, N892, N891}), 
        .product({SYNOPSYS_UNCONNECTED__37, SYNOPSYS_UNCONNECTED__38, 
        SYNOPSYS_UNCONNECTED__39, SYNOPSYS_UNCONNECTED__40, N911, N910, N909, 
        N908, N907, N906, N905, N904, N903, N902, N901, N900}) );
  interpolation_DW01_add_18_DW01_add_10 add_258 ( .A({data_ur_r, 1'b0, 1'b0, 
        1'b0, 1'b0}), .B({N911, N910, N909, N908, N907, N906, N905, N904, N903, 
        N902, N901, N900}), .CI(1'b0), .SUM({N923, N922, N921, N920, N919, 
        N918, N917, N916, N915, N914, N913, N912}) );
  ADDFXL \mult_64/U7  ( .A(\mult_64/n7 ), .B(\mult_64/n37 ), .CI(\mult_64/n26 ), .CO(\mult_64/n6 ), .S(N58) );
  interpolation_DW_div_uns_7 r733 ( .a({counter_r[8:7], n455, n459, 
        counter_r[4:0]}), .b({1'b1, 1'b0, 1'b0, 1'b0, 1'b1}), .remainder({N4, 
        N3, N2, N1, N0}) );
  interpolation_DW_div_uns_13 r735 ( .a({counter_r[8:7], n455, n459, 
        counter_r[4:0]}), .b({1'b1, 1'b0, 1'b0, 1'b0, 1'b1}), .quotient({
        SYNOPSYS_UNCONNECTED__41, SYNOPSYS_UNCONNECTED__42, 
        SYNOPSYS_UNCONNECTED__43, SYNOPSYS_UNCONNECTED__44, N52, N51, N50, N49, 
        N48}) );
  DFFRX1 \v0_r_reg[5]  ( .D(n427), .CK(clk), .RN(n476), .Q(v0_r[5]) );
  DFFSX1 ren_r_reg ( .D(n421), .CK(clk), .SN(n478), .Q(REN), .QN(n345) );
  DFFRX1 valid_r_reg ( .D(n441), .CK(clk), .RN(n475), .Q(O_VALID), .QN(n350)
         );
  DFFRX2 \v0_r_reg[4]  ( .D(n426), .CK(clk), .RN(n476), .Q(v0_r[4]) );
  DFFRX1 \o_data_r_reg[6]  ( .D(n396), .CK(clk), .RN(n479), .Q(O_DATA[6]) );
  DFFRX1 \o_data_r_reg[5]  ( .D(n395), .CK(clk), .RN(n479), .Q(O_DATA[5]) );
  DFFRX1 \o_data_r_reg[4]  ( .D(n394), .CK(clk), .RN(n479), .Q(O_DATA[4]) );
  DFFRX1 \o_data_r_reg[3]  ( .D(n393), .CK(clk), .RN(n479), .Q(O_DATA[3]) );
  DFFRX1 \o_data_r_reg[2]  ( .D(n392), .CK(clk), .RN(n479), .Q(O_DATA[2]) );
  DFFRX1 \o_data_r_reg[1]  ( .D(n391), .CK(clk), .RN(n479), .Q(O_DATA[1]) );
  DFFRX1 \o_data_r_reg[0]  ( .D(n390), .CK(clk), .RN(n479), .Q(O_DATA[0]) );
  DFFRX1 \o_data_r_reg[7]  ( .D(n389), .CK(clk), .RN(n479), .Q(O_DATA[7]) );
  DFFRX1 \addr_r_reg[0]  ( .D(n376), .CK(clk), .RN(n480), .Q(ADDR[0]) );
  DFFRX1 \addr_r_reg[1]  ( .D(n375), .CK(clk), .RN(n481), .Q(ADDR[1]) );
  DFFRX1 \addr_r_reg[2]  ( .D(n374), .CK(clk), .RN(n481), .Q(ADDR[2]) );
  DFFRX1 \addr_r_reg[3]  ( .D(n373), .CK(clk), .RN(n481), .Q(ADDR[3]) );
  DFFRX1 \addr_r_reg[4]  ( .D(n372), .CK(clk), .RN(n481), .Q(ADDR[4]) );
  DFFRX1 \addr_r_reg[5]  ( .D(n371), .CK(clk), .RN(n481), .Q(ADDR[5]) );
  DFFRX1 \addr_r_reg[6]  ( .D(n370), .CK(clk), .RN(n481), .Q(ADDR[6]) );
  DFFRX1 \addr_r_reg[7]  ( .D(n369), .CK(clk), .RN(n481), .Q(ADDR[7]) );
  DFFRX1 \addr_r_reg[8]  ( .D(n368), .CK(clk), .RN(n481), .Q(ADDR[8]) );
  DFFRX1 \addr_r_reg[9]  ( .D(n367), .CK(clk), .RN(n481), .Q(ADDR[9]) );
  DFFRX1 \addr_r_reg[10]  ( .D(n366), .CK(clk), .RN(n481), .Q(ADDR[10]) );
  DFFRX1 \addr_r_reg[11]  ( .D(n365), .CK(clk), .RN(n481), .Q(ADDR[11]) );
  DFFRX1 \state_r_reg[2]  ( .D(n443), .CK(clk), .RN(n475), .Q(n358), .QN(n454)
         );
  DFFRX2 \cycle_r_reg[1]  ( .D(n440), .CK(clk), .RN(n475), .QN(n352) );
  DFFRX2 \v0_r_reg[0]  ( .D(n422), .CK(clk), .RN(n477), .Q(v0_r[0]) );
  DFFRX2 \h0_r_reg[5]  ( .D(n433), .CK(clk), .RN(n476), .Q(N197) );
  DFFRX2 \h0_r_reg[4]  ( .D(n432), .CK(clk), .RN(n476), .Q(N196) );
  DFFRX2 \h0_r_reg[0]  ( .D(n428), .CK(clk), .RN(n476), .Q(N192) );
  DFFRX1 \width_r_reg[6]  ( .D(n379), .CK(clk), .RN(n480), .Q(width_r[6]) );
  DFFRX1 \width_r_reg[4]  ( .D(n377), .CK(clk), .RN(n480), .Q(width_r[4]) );
  DFFRX1 \width_r_reg[5]  ( .D(n378), .CK(clk), .RN(n480), .Q(width_r[5]) );
  DFFRX1 \data_ll_r_reg[7]  ( .D(n404), .CK(clk), .RN(n478), .Q(data_ll_r[7])
         );
  DFFRX2 \data_ul_r_reg[7]  ( .D(n420), .CK(clk), .RN(n477), .Q(data_ul_r[7])
         );
  DFFRX1 \data_lr_r_reg[7]  ( .D(n388), .CK(clk), .RN(n479), .Q(data_lr_r[7])
         );
  DFFRX1 \data_ll_r_reg[6]  ( .D(n403), .CK(clk), .RN(n478), .Q(data_ll_r[6])
         );
  DFFRX2 \data_ul_r_reg[6]  ( .D(n419), .CK(clk), .RN(n477), .Q(data_ul_r[6])
         );
  DFFRX1 \data_lr_r_reg[6]  ( .D(n387), .CK(clk), .RN(n480), .Q(data_lr_r[6])
         );
  DFFRX1 \data_ll_r_reg[5]  ( .D(n402), .CK(clk), .RN(n478), .Q(data_ll_r[5])
         );
  DFFRX2 \data_ul_r_reg[5]  ( .D(n418), .CK(clk), .RN(n477), .Q(data_ul_r[5])
         );
  DFFRX1 \data_lr_r_reg[5]  ( .D(n386), .CK(clk), .RN(n480), .Q(data_lr_r[5])
         );
  DFFRX1 \data_ll_r_reg[4]  ( .D(n401), .CK(clk), .RN(n478), .Q(data_ll_r[4])
         );
  DFFRX2 \data_ul_r_reg[4]  ( .D(n417), .CK(clk), .RN(n477), .Q(data_ul_r[4])
         );
  DFFRX1 \data_lr_r_reg[4]  ( .D(n385), .CK(clk), .RN(n480), .Q(data_lr_r[4])
         );
  DFFRX1 \data_ll_r_reg[3]  ( .D(n400), .CK(clk), .RN(n478), .Q(data_ll_r[3])
         );
  DFFRX1 \data_lr_r_reg[3]  ( .D(n384), .CK(clk), .RN(n480), .Q(data_lr_r[3])
         );
  DFFRX2 \data_ul_r_reg[3]  ( .D(n416), .CK(clk), .RN(n477), .Q(data_ul_r[3])
         );
  DFFRX1 \data_ll_r_reg[2]  ( .D(n399), .CK(clk), .RN(n479), .Q(data_ll_r[2])
         );
  DFFRX1 \data_lr_r_reg[2]  ( .D(n383), .CK(clk), .RN(n480), .Q(data_lr_r[2])
         );
  DFFRX2 \data_ul_r_reg[2]  ( .D(n415), .CK(clk), .RN(n477), .Q(data_ul_r[2])
         );
  DFFRX1 \data_ll_r_reg[1]  ( .D(n398), .CK(clk), .RN(n479), .Q(data_ll_r[1])
         );
  DFFRX1 \data_lr_r_reg[1]  ( .D(n382), .CK(clk), .RN(n480), .Q(data_lr_r[1])
         );
  DFFRX2 \data_ul_r_reg[1]  ( .D(n414), .CK(clk), .RN(n477), .Q(data_ul_r[1])
         );
  DFFRX2 \counter_r_reg[0]  ( .D(n449), .CK(clk), .RN(n475), .Q(counter_r[0]), 
        .QN(n360) );
  DFFRX1 \v0_r_reg[3]  ( .D(n425), .CK(clk), .RN(n476), .Q(v0_r[3]) );
  DFFRX1 \cycle_r_reg[0]  ( .D(n444), .CK(clk), .RN(n475), .QN(n353) );
  DFFRX1 \v0_r_reg[2]  ( .D(n424), .CK(clk), .RN(n477), .Q(v0_r[2]) );
  DFFRX1 \v0_r_reg[1]  ( .D(n423), .CK(clk), .RN(n477), .Q(v0_r[1]) );
  DFFRX1 \h0_r_reg[3]  ( .D(n431), .CK(clk), .RN(n476), .Q(N195) );
  DFFRX1 \h0_r_reg[2]  ( .D(n430), .CK(clk), .RN(n476), .Q(N194) );
  DFFRX1 \h0_r_reg[1]  ( .D(n429), .CK(clk), .RN(n476), .Q(N193) );
  DFFRX1 \width_r_reg[7]  ( .D(n380), .CK(clk), .RN(n480), .Q(width_r[7]) );
  DFFRX1 \data_ur_r_reg[7]  ( .D(n412), .CK(clk), .RN(n477), .Q(data_ur_r[7])
         );
  DFFRX1 \data_ur_r_reg[6]  ( .D(n411), .CK(clk), .RN(n478), .Q(data_ur_r[6])
         );
  DFFRX1 \data_ur_r_reg[5]  ( .D(n410), .CK(clk), .RN(n478), .Q(data_ur_r[5])
         );
  DFFRX1 \data_ur_r_reg[4]  ( .D(n409), .CK(clk), .RN(n478), .Q(data_ur_r[4])
         );
  DFFRX1 \data_ur_r_reg[3]  ( .D(n408), .CK(clk), .RN(n478), .Q(data_ur_r[3])
         );
  DFFRX1 \data_ll_r_reg[0]  ( .D(n397), .CK(clk), .RN(n479), .Q(data_ll_r[0])
         );
  DFFRX1 \data_ur_r_reg[2]  ( .D(n407), .CK(clk), .RN(n478), .Q(data_ur_r[2])
         );
  DFFRX1 \data_lr_r_reg[0]  ( .D(n381), .CK(clk), .RN(n480), .Q(data_lr_r[0])
         );
  DFFRX1 \data_ur_r_reg[1]  ( .D(n406), .CK(clk), .RN(n478), .Q(data_ur_r[1])
         );
  DFFRX1 \height_r_reg[7]  ( .D(n364), .CK(clk), .RN(n481), .Q(height_r[7]) );
  DFFRX1 \height_r_reg[6]  ( .D(n363), .CK(clk), .RN(n480), .Q(height_r[6]), 
        .QN(n452) );
  DFFRX1 \height_r_reg[5]  ( .D(n362), .CK(clk), .RN(n481), .Q(height_r[5]), 
        .QN(n453) );
  DFFRX1 \height_r_reg[4]  ( .D(n361), .CK(clk), .RN(n503), .Q(height_r[4]), 
        .QN(n451) );
  DFFRX1 \state_r_reg[0]  ( .D(n447), .CK(clk), .RN(n475), .Q(n359), .QN(n450)
         );
  DFFRX1 \counter_r_reg[8]  ( .D(n445), .CK(clk), .RN(n475), .Q(counter_r[8]), 
        .QN(n356) );
  DFFRX1 \counter_r_reg[7]  ( .D(n439), .CK(clk), .RN(n475), .Q(counter_r[7]), 
        .QN(n349) );
  DFFRX2 \counter_r_reg[1]  ( .D(n446), .CK(clk), .RN(n475), .Q(counter_r[1]), 
        .QN(n351) );
  DFFRX2 \counter_r_reg[4]  ( .D(n436), .CK(clk), .RN(n476), .Q(counter_r[4]), 
        .QN(n354) );
  DFFRX2 \counter_r_reg[3]  ( .D(n435), .CK(clk), .RN(n476), .Q(counter_r[3]), 
        .QN(n347) );
  DFFRX2 \counter_r_reg[2]  ( .D(n434), .CK(clk), .RN(n476), .Q(counter_r[2]), 
        .QN(n346) );
  DFFRX2 \data_ul_r_reg[0]  ( .D(n413), .CK(clk), .RN(n477), .Q(data_ul_r[0])
         );
  DFFRX2 \data_ur_r_reg[0]  ( .D(n405), .CK(clk), .RN(n478), .Q(data_ur_r[0])
         );
  DFFRX1 \state_r_reg[1]  ( .D(n442), .CK(clk), .RN(n475), .Q(n357) );
  DFFRHQX2 \counter_r_reg[5]  ( .D(n437), .CK(clk), .RN(n475), .Q(n459) );
  DFFRHQX2 \counter_r_reg[6]  ( .D(n438), .CK(clk), .RN(n475), .Q(n455) );
  NOR2X1 U306 ( .A(n453), .B(n485), .Y(\mult_64/n44 ) );
  CLKINVX1 U307 ( .A(N48), .Y(n485) );
  NOR3X1 U308 ( .A(n359), .B(n357), .C(n454), .Y(n301) );
  OR2X1 U309 ( .A(n463), .B(N875), .Y(N883) );
  XOR3X1 U310 ( .A(\mult_64/n7 ), .B(\mult_64/n37 ), .C(\mult_64/n26 ), .Y(
        n461) );
  XOR3X1 U311 ( .A(\mult_64/n7 ), .B(\mult_64/n37 ), .C(\mult_64/n26 ), .Y(
        n462) );
  ADDHX1 U312 ( .A(\mult_64/n50 ), .B(\mult_64/n43 ), .CO(\mult_64/n25 ), .S(
        \mult_64/n26 ) );
  ADDHX2 U313 ( .A(\mult_64/n44 ), .B(\mult_64/n51 ), .CO(\mult_64/n7 ), .S(
        N57) );
  INVXL U314 ( .A(n455), .Y(n456) );
  NOR2X1 U315 ( .A(n451), .B(n485), .Y(n457) );
  NOR2X1 U316 ( .A(n451), .B(n485), .Y(n458) );
  NOR2XL U317 ( .A(n451), .B(n485), .Y(N56) );
  INVX1 U318 ( .A(n459), .Y(n460) );
  OR2X1 U319 ( .A(n463), .B(N876), .Y(N884) );
  NAND3BX1 U320 ( .AN(n495), .B(N922), .C(N923), .Y(n497) );
  NOR3X2 U321 ( .A(n498), .B(n497), .C(n496), .Y(N924) );
  OR2X1 U322 ( .A(N924), .B(N947), .Y(N955) );
  INVXL U323 ( .A(N50), .Y(n486) );
  OR2XL U324 ( .A(n463), .B(N877), .Y(N885) );
  OR2XL U325 ( .A(n463), .B(N878), .Y(N886) );
  OR2XL U326 ( .A(n463), .B(N879), .Y(N887) );
  OR2XL U327 ( .A(n463), .B(N880), .Y(N888) );
  OR2XL U328 ( .A(n463), .B(N881), .Y(N889) );
  NOR2XL U329 ( .A(n452), .B(n484), .Y(\mult_64/n36 ) );
  CLKINVX1 U330 ( .A(n301), .Y(n519) );
  OR2XL U331 ( .A(N924), .B(N954), .Y(N962) );
  NOR2BXL U332 ( .AN(height_r[7]), .B(n485), .Y(\mult_64/n31 ) );
  OR2XL U333 ( .A(n463), .B(N882), .Y(N890) );
  ADDFXL U334 ( .A(N195), .B(N47), .CI(\r756/carry [3]), .CO(\r756/carry [4]), 
        .S(N367) );
  NOR3X1 U335 ( .A(n358), .B(n357), .C(n359), .Y(n249) );
  NOR3X1 U336 ( .A(n358), .B(n357), .C(n450), .Y(n248) );
  NAND2X1 U337 ( .A(n352), .B(n353), .Y(n239) );
  NAND3X1 U338 ( .A(n359), .B(n454), .C(n357), .Y(n318) );
  NOR3X1 U339 ( .A(n450), .B(n357), .C(n454), .Y(n325) );
  CLKINVX1 U340 ( .A(R_DATA[0]), .Y(n514) );
  CLKINVX1 U341 ( .A(R_DATA[1]), .Y(n513) );
  CLKINVX1 U342 ( .A(R_DATA[2]), .Y(n512) );
  CLKINVX1 U343 ( .A(R_DATA[3]), .Y(n511) );
  CLKINVX1 U344 ( .A(R_DATA[4]), .Y(n510) );
  CLKINVX1 U345 ( .A(R_DATA[5]), .Y(n509) );
  CLKINVX1 U346 ( .A(R_DATA[6]), .Y(n508) );
  CLKINVX1 U347 ( .A(R_DATA[7]), .Y(n507) );
  CLKINVX1 U348 ( .A(RST), .Y(n503) );
  CLKINVX1 U349 ( .A(n272), .Y(n499) );
  CLKINVX1 U350 ( .A(N49), .Y(n484) );
  NAND2X1 U351 ( .A(n299), .B(n500), .Y(n272) );
  CLKINVX1 U352 ( .A(n306), .Y(n500) );
  CLKINVX1 U353 ( .A(n299), .Y(n501) );
  NAND2X1 U354 ( .A(n334), .B(n241), .Y(n327) );
  NOR2X1 U355 ( .A(n502), .B(n334), .Y(n306) );
  CLKINVX1 U356 ( .A(n241), .Y(n502) );
  NAND2X1 U357 ( .A(n334), .B(n502), .Y(n299) );
  NAND2X1 U358 ( .A(n516), .B(n317), .Y(n300) );
  CLKINVX1 U359 ( .A(N51), .Y(n483) );
  NOR4X1 U360 ( .A(N41), .B(N40), .C(N43), .D(N42), .Y(n241) );
  NAND2X1 U361 ( .A(n274), .B(n499), .Y(n324) );
  NOR4X1 U362 ( .A(N57), .B(n458), .C(N59), .D(n461), .Y(n334) );
  CLKBUFX3 U363 ( .A(n279), .Y(n466) );
  NOR2X1 U364 ( .A(n519), .B(n500), .Y(n279) );
  NOR2X2 U365 ( .A(n519), .B(n272), .Y(n278) );
  NAND4BX2 U366 ( .AN(n243), .B(n516), .C(n520), .D(n270), .Y(n260) );
  NOR2BX1 U367 ( .AN(n271), .B(n272), .Y(n270) );
  NOR3BX1 U368 ( .AN(n235), .B(n236), .C(n237), .Y(n230) );
  NOR2X1 U369 ( .A(n502), .B(n240), .Y(n236) );
  NAND2BX1 U370 ( .AN(n327), .B(n243), .Y(n317) );
  CLKBUFX3 U371 ( .A(n280), .Y(n465) );
  NOR2X1 U372 ( .A(n299), .B(n519), .Y(n280) );
  NAND2X2 U373 ( .A(n520), .B(n300), .Y(n282) );
  NOR2BX1 U374 ( .AN(n240), .B(n241), .Y(n237) );
  NAND3X2 U375 ( .A(n316), .B(n317), .C(n307), .Y(n315) );
  CLKINVX1 U376 ( .A(n319), .Y(n516) );
  CLKINVX1 U377 ( .A(n274), .Y(n515) );
  CLKBUFX3 U378 ( .A(n231), .Y(n469) );
  NOR2BX1 U379 ( .AN(n246), .B(n517), .Y(n231) );
  AND2X2 U380 ( .A(n469), .B(n243), .Y(n183) );
  CLKBUFX3 U381 ( .A(n521), .Y(n482) );
  CLKBUFX3 U382 ( .A(n184), .Y(n467) );
  NOR2BX1 U383 ( .AN(n246), .B(n482), .Y(n184) );
  INVX3 U384 ( .A(n337), .Y(n518) );
  NAND2X1 U385 ( .A(n328), .B(n329), .Y(n442) );
  CLKBUFX3 U386 ( .A(n503), .Y(n481) );
  CLKBUFX3 U387 ( .A(n503), .Y(n480) );
  CLKBUFX3 U388 ( .A(n476), .Y(n479) );
  CLKBUFX3 U389 ( .A(n503), .Y(n478) );
  CLKBUFX3 U390 ( .A(n503), .Y(n477) );
  CLKBUFX3 U391 ( .A(n503), .Y(n476) );
  CLKBUFX3 U392 ( .A(n477), .Y(n475) );
  OR2X1 U393 ( .A(N924), .B(N949), .Y(N957) );
  OR2X1 U394 ( .A(N924), .B(N948), .Y(N956) );
  OR2X1 U395 ( .A(N924), .B(N952), .Y(N960) );
  OR2X1 U396 ( .A(N924), .B(N950), .Y(N958) );
  OR2X1 U397 ( .A(N924), .B(N951), .Y(N959) );
  CLKBUFX3 U398 ( .A(N736), .Y(n463) );
  NOR3X1 U399 ( .A(n490), .B(n489), .C(n488), .Y(N736) );
  NAND3BX1 U400 ( .AN(n487), .B(N701), .C(N702), .Y(n489) );
  OR2X1 U401 ( .A(N924), .B(N953), .Y(N961) );
  XOR3X1 U402 ( .A(\mult_64/n42 ), .B(\mult_64/n49 ), .C(\mult_64/n25 ), .Y(
        \mult_64/n22 ) );
  XOR2X1 U403 ( .A(\mult_64/n36 ), .B(\mult_64/n31 ), .Y(\mult_64/n24 ) );
  AOI22X2 U404 ( .A0(N808), .A1(n465), .B0(n463), .B1(n466), .Y(n276) );
  AOI222XL U405 ( .A0(N418), .A1(n175), .B0(N451), .B1(n176), .C0(N490), .C1(
        n177), .Y(n174) );
  AOI222XL U406 ( .A0(N417), .A1(n175), .B0(N450), .B1(n176), .C0(N489), .C1(
        n177), .Y(n189) );
  AOI222XL U407 ( .A0(N416), .A1(n175), .B0(N449), .B1(n176), .C0(N488), .C1(
        n177), .Y(n193) );
  AOI222XL U408 ( .A0(N415), .A1(n175), .B0(N448), .B1(n176), .C0(N487), .C1(
        n177), .Y(n197) );
  AOI222XL U409 ( .A0(N414), .A1(n175), .B0(N447), .B1(n176), .C0(N486), .C1(
        n177), .Y(n201) );
  AOI222XL U410 ( .A0(N413), .A1(n175), .B0(N446), .B1(n176), .C0(N485), .C1(
        n177), .Y(n205) );
  AOI222XL U411 ( .A0(N303), .A1(n175), .B0(N369), .B1(n176), .C0(N369), .C1(
        n177), .Y(n209) );
  AOI222XL U412 ( .A0(N302), .A1(n175), .B0(N368), .B1(n176), .C0(N368), .C1(
        n177), .Y(n213) );
  CLKBUFX3 U413 ( .A(n302), .Y(n464) );
  NAND4X1 U414 ( .A(n520), .B(n243), .C(n327), .D(n333), .Y(n302) );
  OAI22XL U415 ( .A0(n251), .A1(n335), .B0(n450), .B1(n329), .Y(n447) );
  AOI211X1 U416 ( .A0(n325), .A1(n245), .B0(n339), .C0(n250), .Y(n335) );
  OAI211X1 U417 ( .A0(n271), .A1(n324), .B0(n341), .C0(n482), .Y(n339) );
  OAI21XL U418 ( .A0(n243), .A1(n319), .B0(n520), .Y(n341) );
  AOI222XL U419 ( .A0(N301), .A1(n175), .B0(N367), .B1(n176), .C0(N367), .C1(
        n177), .Y(n217) );
  AOI222XL U420 ( .A0(N300), .A1(n175), .B0(N366), .B1(n176), .C0(N366), .C1(
        n177), .Y(n221) );
  AOI221XL U421 ( .A0(n272), .A1(n274), .B0(n300), .B1(n520), .C0(n301), .Y(
        n331) );
  AOI222XL U422 ( .A0(N298), .A1(n175), .B0(N364), .B1(n176), .C0(N364), .C1(
        n177), .Y(n229) );
  AND3X2 U423 ( .A(n230), .B(n469), .C(n232), .Y(n177) );
  NAND3X2 U424 ( .A(n499), .B(n232), .C(n274), .Y(n258) );
  AND3X2 U425 ( .A(n469), .B(n233), .C(n230), .Y(n176) );
  AND3X2 U426 ( .A(n230), .B(n469), .C(n234), .Y(n175) );
  AOI222XL U427 ( .A0(N299), .A1(n175), .B0(N365), .B1(n176), .C0(N365), .C1(
        n177), .Y(n225) );
  NAND2X2 U428 ( .A(n274), .B(n314), .Y(n311) );
  AO21X1 U429 ( .A0(n500), .A1(n233), .B0(n501), .Y(n314) );
  OAI211X1 U430 ( .A0(n522), .A1(n515), .B0(n329), .C0(n331), .Y(n443) );
  CLKINVX1 U431 ( .A(n232), .Y(n522) );
  NAND2X2 U432 ( .A(n274), .B(n310), .Y(n304) );
  AO21X1 U433 ( .A0(n299), .A1(n234), .B0(n306), .Y(n310) );
  CLKBUFX3 U434 ( .A(n179), .Y(n473) );
  AND4X1 U435 ( .A(n237), .B(n469), .C(n235), .D(n239), .Y(n179) );
  CLKBUFX3 U436 ( .A(n178), .Y(n472) );
  AND4X1 U437 ( .A(n236), .B(n469), .C(n235), .D(n239), .Y(n178) );
  AOI21X1 U438 ( .A0(n520), .A1(n326), .B0(n301), .Y(n321) );
  OAI21XL U439 ( .A0(n239), .A1(n327), .B0(n516), .Y(n326) );
  NOR4X1 U440 ( .A(N271), .B(N270), .C(N273), .D(N272), .Y(n240) );
  NOR2X2 U441 ( .A(n318), .B(n316), .Y(n274) );
  AND2X2 U442 ( .A(n245), .B(n238), .Y(n235) );
  NAND2X1 U443 ( .A(n235), .B(n333), .Y(n319) );
  NAND2X1 U444 ( .A(n516), .B(n239), .Y(n316) );
  NOR2BX2 U445 ( .AN(n235), .B(n239), .Y(n243) );
  NOR2X1 U446 ( .A(n250), .B(n251), .Y(n246) );
  CLKBUFX3 U447 ( .A(n182), .Y(n471) );
  NOR3BXL U448 ( .AN(n469), .B(counter_r[8]), .C(n238), .Y(n182) );
  CLKBUFX3 U449 ( .A(n181), .Y(n470) );
  NOR2BX1 U450 ( .AN(n469), .B(n245), .Y(n181) );
  CLKINVX1 U451 ( .A(n249), .Y(n521) );
  OAI211X1 U452 ( .A0(n333), .A1(n517), .B0(n519), .C0(n338), .Y(n250) );
  CLKINVX1 U453 ( .A(n248), .Y(n517) );
  INVX3 U454 ( .A(n318), .Y(n520) );
  CLKBUFX3 U455 ( .A(n185), .Y(n468) );
  OAI21XL U456 ( .A0(n248), .A1(n249), .B0(n246), .Y(n185) );
  NOR2X1 U457 ( .A(n318), .B(n319), .Y(n307) );
  NAND2X1 U458 ( .A(n166), .B(n506), .Y(n169) );
  NAND2X1 U459 ( .A(n253), .B(n505), .Y(n256) );
  INVX3 U460 ( .A(n162), .Y(n504) );
  NOR2X1 U461 ( .A(n249), .B(n325), .Y(n337) );
  NOR2X1 U462 ( .A(n234), .B(n233), .Y(n271) );
  NAND4X1 U463 ( .A(n328), .B(n337), .C(n519), .D(n318), .Y(n329) );
  NOR2BX1 U464 ( .AN(n338), .B(n248), .Y(n328) );
  AND2X2 U465 ( .A(n325), .B(n245), .Y(n323) );
  NAND3X1 U466 ( .A(n275), .B(n276), .C(n277), .Y(n389) );
  AOI2BB2X1 U467 ( .B0(n281), .B1(O_DATA[7]), .A0N(n507), .A1N(n282), .Y(n275)
         );
  AOI222XL U468 ( .A0(N987), .A1(n278), .B0(N702), .B1(n466), .C0(N774), .C1(
        n465), .Y(n277) );
  NAND3X1 U469 ( .A(n295), .B(n276), .C(n296), .Y(n396) );
  AOI2BB2X1 U470 ( .B0(n281), .B1(O_DATA[6]), .A0N(n508), .A1N(n282), .Y(n295)
         );
  AOI222XL U471 ( .A0(N986), .A1(n278), .B0(N701), .B1(n466), .C0(N773), .C1(
        n465), .Y(n296) );
  NAND3X1 U472 ( .A(n293), .B(n276), .C(n294), .Y(n395) );
  AOI2BB2X1 U473 ( .B0(n281), .B1(O_DATA[5]), .A0N(n509), .A1N(n282), .Y(n293)
         );
  AOI222XL U474 ( .A0(N985), .A1(n278), .B0(N700), .B1(n466), .C0(N772), .C1(
        n465), .Y(n294) );
  NAND3X1 U475 ( .A(n291), .B(n276), .C(n292), .Y(n394) );
  AOI2BB2X1 U476 ( .B0(n281), .B1(O_DATA[4]), .A0N(n510), .A1N(n282), .Y(n291)
         );
  AOI222XL U477 ( .A0(N984), .A1(n278), .B0(N699), .B1(n466), .C0(N771), .C1(
        n465), .Y(n292) );
  NAND3X1 U478 ( .A(n289), .B(n276), .C(n290), .Y(n393) );
  AOI2BB2XL U479 ( .B0(n281), .B1(O_DATA[3]), .A0N(n511), .A1N(n282), .Y(n289)
         );
  AOI222XL U480 ( .A0(N983), .A1(n278), .B0(N698), .B1(n466), .C0(N770), .C1(
        n465), .Y(n290) );
  NAND3X1 U481 ( .A(n287), .B(n276), .C(n288), .Y(n392) );
  AOI2BB2XL U482 ( .B0(n281), .B1(O_DATA[2]), .A0N(n512), .A1N(n282), .Y(n287)
         );
  AOI222XL U483 ( .A0(N982), .A1(n278), .B0(N697), .B1(n466), .C0(N769), .C1(
        n465), .Y(n288) );
  NAND3X1 U484 ( .A(n285), .B(n276), .C(n286), .Y(n391) );
  AOI2BB2XL U485 ( .B0(n281), .B1(O_DATA[1]), .A0N(n513), .A1N(n282), .Y(n285)
         );
  AOI222XL U486 ( .A0(N981), .A1(n278), .B0(N696), .B1(n466), .C0(N768), .C1(
        n465), .Y(n286) );
  NAND3X1 U487 ( .A(n283), .B(n276), .C(n284), .Y(n390) );
  AOI2BB2XL U488 ( .B0(n281), .B1(O_DATA[0]), .A0N(n514), .A1N(n282), .Y(n283)
         );
  AOI222XL U489 ( .A0(N980), .A1(n278), .B0(N695), .B1(n466), .C0(N767), .C1(
        n465), .Y(n284) );
  NAND4X1 U490 ( .A(n171), .B(n172), .C(n173), .D(n174), .Y(n365) );
  AOI22X1 U491 ( .A0(N103), .A1(n467), .B0(n468), .B1(ADDR[11]), .Y(n171) );
  AOI222XL U492 ( .A0(N341), .A1(n472), .B0(N375), .B1(n473), .C0(N203), .C1(
        n474), .Y(n173) );
  AOI222XL U493 ( .A0(N228), .A1(n470), .B0(N185), .B1(n471), .C0(N309), .C1(
        n183), .Y(n172) );
  ADDFXL U494 ( .A(N194), .B(N46), .CI(\r756/carry [2]), .CO(\r756/carry [3]), 
        .S(N366) );
  ADDFXL U495 ( .A(N195), .B(N47), .CI(\r751/carry [3]), .CO(\r751/carry [4]), 
        .S(N301) );
  ADDFXL U496 ( .A(N194), .B(N46), .CI(\r751/carry [2]), .CO(\r751/carry [3]), 
        .S(N300) );
  NAND4X1 U497 ( .A(n186), .B(n187), .C(n188), .D(n189), .Y(n366) );
  AOI22X1 U498 ( .A0(N102), .A1(n467), .B0(n468), .B1(ADDR[10]), .Y(n186) );
  AOI222XL U499 ( .A0(N340), .A1(n472), .B0(N374), .B1(n473), .C0(N202), .C1(
        n474), .Y(n188) );
  AOI222XL U500 ( .A0(N227), .A1(n470), .B0(N184), .B1(n471), .C0(N308), .C1(
        n183), .Y(n187) );
  ADDFXL U501 ( .A(N193), .B(N45), .CI(\r756/carry [1]), .CO(\r756/carry [2]), 
        .S(N365) );
  ADDFXL U502 ( .A(N193), .B(N45), .CI(\r751/carry [1]), .CO(\r751/carry [2]), 
        .S(N299) );
  NAND4X1 U503 ( .A(n190), .B(n191), .C(n192), .D(n193), .Y(n367) );
  AOI22X1 U504 ( .A0(N101), .A1(n467), .B0(n468), .B1(ADDR[9]), .Y(n190) );
  AOI222XL U505 ( .A0(N339), .A1(n472), .B0(N373), .B1(n473), .C0(N201), .C1(
        n474), .Y(n192) );
  AOI222XL U506 ( .A0(N226), .A1(n470), .B0(N183), .B1(n471), .C0(N307), .C1(
        n183), .Y(n191) );
  NAND4X1 U507 ( .A(n194), .B(n195), .C(n196), .D(n197), .Y(n368) );
  AOI22X1 U508 ( .A0(N100), .A1(n467), .B0(n468), .B1(ADDR[8]), .Y(n194) );
  AOI222XL U509 ( .A0(N338), .A1(n472), .B0(N372), .B1(n473), .C0(N200), .C1(
        n474), .Y(n196) );
  AOI222XL U510 ( .A0(N225), .A1(n470), .B0(N182), .B1(n471), .C0(N306), .C1(
        n183), .Y(n195) );
  NAND4X1 U511 ( .A(n198), .B(n199), .C(n200), .D(n201), .Y(n369) );
  AOI22X1 U512 ( .A0(N99), .A1(n467), .B0(n468), .B1(ADDR[7]), .Y(n198) );
  AOI222XL U513 ( .A0(N337), .A1(n472), .B0(N371), .B1(n473), .C0(N199), .C1(
        n474), .Y(n200) );
  AOI222XL U514 ( .A0(N224), .A1(n470), .B0(N181), .B1(n471), .C0(N305), .C1(
        n183), .Y(n199) );
  NAND4X1 U515 ( .A(n202), .B(n203), .C(n204), .D(n205), .Y(n370) );
  AOI22X1 U516 ( .A0(N98), .A1(n467), .B0(n468), .B1(ADDR[6]), .Y(n202) );
  AOI222XL U517 ( .A0(N336), .A1(n472), .B0(N370), .B1(n473), .C0(N198), .C1(
        n474), .Y(n204) );
  AOI222XL U518 ( .A0(N223), .A1(n470), .B0(N180), .B1(n471), .C0(N304), .C1(
        n183), .Y(n203) );
  NAND4X1 U519 ( .A(n206), .B(n207), .C(n208), .D(n209), .Y(n371) );
  AOI22X1 U520 ( .A0(N97), .A1(n467), .B0(n468), .B1(ADDR[5]), .Y(n206) );
  AOI222XL U521 ( .A0(N303), .A1(n472), .B0(N369), .B1(n473), .C0(N197), .C1(
        n474), .Y(n208) );
  AOI222XL U522 ( .A0(N222), .A1(n470), .B0(N222), .B1(n471), .C0(N303), .C1(
        n183), .Y(n207) );
  NAND4X1 U523 ( .A(n210), .B(n211), .C(n212), .D(n213), .Y(n372) );
  AOI22X1 U524 ( .A0(N96), .A1(n467), .B0(n468), .B1(ADDR[4]), .Y(n210) );
  AOI222XL U525 ( .A0(N302), .A1(n472), .B0(N368), .B1(n473), .C0(N196), .C1(
        n474), .Y(n212) );
  AOI222XL U526 ( .A0(N221), .A1(n470), .B0(N221), .B1(n471), .C0(N302), .C1(
        n183), .Y(n211) );
  NOR2X1 U527 ( .A(n243), .B(n306), .Y(n313) );
  OAI2BB2XL U528 ( .B0(n514), .B1(n311), .A0N(data_ur_r[0]), .A1N(n312), .Y(
        n405) );
  OAI2BB2XL U529 ( .B0(n513), .B1(n311), .A0N(data_ur_r[1]), .A1N(n312), .Y(
        n406) );
  OAI2BB2XL U530 ( .B0(n512), .B1(n311), .A0N(data_ur_r[2]), .A1N(n312), .Y(
        n407) );
  OAI2BB2XL U531 ( .B0(n511), .B1(n311), .A0N(data_ur_r[3]), .A1N(n312), .Y(
        n408) );
  OAI2BB2XL U532 ( .B0(n510), .B1(n311), .A0N(data_ur_r[4]), .A1N(n312), .Y(
        n409) );
  OAI2BB2XL U533 ( .B0(n509), .B1(n311), .A0N(data_ur_r[5]), .A1N(n312), .Y(
        n410) );
  OAI2BB2XL U534 ( .B0(n508), .B1(n311), .A0N(data_ur_r[6]), .A1N(n312), .Y(
        n411) );
  OAI2BB2XL U535 ( .B0(n507), .B1(n311), .A0N(data_ur_r[7]), .A1N(n312), .Y(
        n412) );
  NOR2X1 U536 ( .A(n243), .B(n501), .Y(n308) );
  OAI2BB2XL U537 ( .B0(n514), .B1(n304), .A0N(data_ll_r[0]), .A1N(n305), .Y(
        n397) );
  OAI2BB2XL U538 ( .B0(n513), .B1(n304), .A0N(data_ll_r[1]), .A1N(n305), .Y(
        n398) );
  OAI2BB2XL U539 ( .B0(n512), .B1(n304), .A0N(data_ll_r[2]), .A1N(n305), .Y(
        n399) );
  OAI2BB2XL U540 ( .B0(n511), .B1(n304), .A0N(data_ll_r[3]), .A1N(n305), .Y(
        n400) );
  OAI2BB2XL U541 ( .B0(n510), .B1(n304), .A0N(data_ll_r[4]), .A1N(n305), .Y(
        n401) );
  OAI2BB2XL U542 ( .B0(n509), .B1(n304), .A0N(data_ll_r[5]), .A1N(n305), .Y(
        n402) );
  OAI2BB2XL U543 ( .B0(n508), .B1(n304), .A0N(data_ll_r[6]), .A1N(n305), .Y(
        n403) );
  OAI2BB2XL U544 ( .B0(n507), .B1(n304), .A0N(data_ll_r[7]), .A1N(n305), .Y(
        n404) );
  NAND4X1 U545 ( .A(n214), .B(n215), .C(n216), .D(n217), .Y(n373) );
  AOI22X1 U546 ( .A0(N95), .A1(n467), .B0(n468), .B1(ADDR[3]), .Y(n214) );
  AOI222XL U547 ( .A0(N301), .A1(n472), .B0(N367), .B1(n473), .C0(N195), .C1(
        n474), .Y(n216) );
  AOI222XL U548 ( .A0(N220), .A1(n470), .B0(N220), .B1(n471), .C0(N301), .C1(
        n183), .Y(n215) );
  NAND4X1 U549 ( .A(n218), .B(n219), .C(n220), .D(n221), .Y(n374) );
  AOI22X1 U550 ( .A0(N94), .A1(n467), .B0(n468), .B1(ADDR[2]), .Y(n218) );
  AOI222XL U551 ( .A0(N300), .A1(n472), .B0(N366), .B1(n473), .C0(N194), .C1(
        n474), .Y(n220) );
  AOI222XL U552 ( .A0(N219), .A1(n470), .B0(N219), .B1(n471), .C0(N300), .C1(
        n183), .Y(n219) );
  OAI2BB2XL U553 ( .B0(n258), .B1(n514), .A0N(data_lr_r[0]), .A1N(n260), .Y(
        n381) );
  OAI2BB2XL U554 ( .B0(n258), .B1(n513), .A0N(data_lr_r[1]), .A1N(n260), .Y(
        n382) );
  OAI2BB2XL U555 ( .B0(n258), .B1(n512), .A0N(data_lr_r[2]), .A1N(n260), .Y(
        n383) );
  OAI2BB2XL U556 ( .B0(n258), .B1(n511), .A0N(data_lr_r[3]), .A1N(n260), .Y(
        n384) );
  OAI2BB2XL U557 ( .B0(n258), .B1(n510), .A0N(data_lr_r[4]), .A1N(n260), .Y(
        n385) );
  OAI2BB2XL U558 ( .B0(n258), .B1(n509), .A0N(data_lr_r[5]), .A1N(n260), .Y(
        n386) );
  OAI2BB2XL U559 ( .B0(n258), .B1(n508), .A0N(data_lr_r[6]), .A1N(n260), .Y(
        n387) );
  OAI2BB2XL U560 ( .B0(n258), .B1(n507), .A0N(data_lr_r[7]), .A1N(n260), .Y(
        n388) );
  OAI221XL U561 ( .A0(n352), .A1(n324), .B0(n353), .B1(n332), .C0(n464), .Y(
        n444) );
  OA21XL U562 ( .A0(n520), .A1(n518), .B0(n331), .Y(n332) );
  NAND4X1 U563 ( .A(n226), .B(n227), .C(n228), .D(n229), .Y(n376) );
  AOI22X1 U564 ( .A0(N92), .A1(n467), .B0(n468), .B1(ADDR[0]), .Y(n226) );
  AOI222XL U565 ( .A0(N217), .A1(n470), .B0(N217), .B1(n471), .C0(N298), .C1(
        n183), .Y(n227) );
  AOI222XL U566 ( .A0(N298), .A1(n472), .B0(N364), .B1(n473), .C0(N192), .C1(
        n474), .Y(n228) );
  NAND4X1 U567 ( .A(n222), .B(n223), .C(n224), .D(n225), .Y(n375) );
  AOI22X1 U568 ( .A0(N93), .A1(n467), .B0(n468), .B1(ADDR[1]), .Y(n222) );
  AOI222XL U569 ( .A0(N299), .A1(n472), .B0(N365), .B1(n473), .C0(N193), .C1(
        n474), .Y(n224) );
  AOI222XL U570 ( .A0(N218), .A1(n470), .B0(N218), .B1(n471), .C0(N299), .C1(
        n183), .Y(n223) );
  OAI21XL U571 ( .A0(n352), .A1(n518), .B0(n324), .Y(n440) );
  OAI2BB2XL U572 ( .B0(n464), .B1(n514), .A0N(data_ul_r[0]), .A1N(n315), .Y(
        n413) );
  OAI2BB2XL U573 ( .B0(n464), .B1(n513), .A0N(data_ul_r[1]), .A1N(n315), .Y(
        n414) );
  OAI2BB2XL U574 ( .B0(n464), .B1(n512), .A0N(data_ul_r[2]), .A1N(n315), .Y(
        n415) );
  OAI2BB2XL U575 ( .B0(n464), .B1(n511), .A0N(data_ul_r[3]), .A1N(n315), .Y(
        n416) );
  OAI2BB2XL U576 ( .B0(n464), .B1(n510), .A0N(data_ul_r[4]), .A1N(n315), .Y(
        n417) );
  OAI2BB2XL U577 ( .B0(n464), .B1(n509), .A0N(data_ul_r[5]), .A1N(n315), .Y(
        n418) );
  OAI2BB2XL U578 ( .B0(n464), .B1(n508), .A0N(data_ul_r[6]), .A1N(n315), .Y(
        n419) );
  OAI2BB2XL U579 ( .B0(n464), .B1(n507), .A0N(data_ul_r[7]), .A1N(n315), .Y(
        n420) );
  OAI21XL U580 ( .A0(n350), .A1(n325), .B0(n321), .Y(n441) );
  OAI21XL U581 ( .A0(n345), .A1(n320), .B0(n321), .Y(n421) );
  AOI21X1 U582 ( .A0(n482), .A1(n517), .B0(n251), .Y(n320) );
  ADDFXL U583 ( .A(N195), .B(width_r[7]), .CI(\r742/carry [3]), .CO(
        \r742/carry [4]), .S(N220) );
  ADDFXL U584 ( .A(N194), .B(width_r[6]), .CI(\r742/carry [2]), .CO(
        \r742/carry [3]), .S(N219) );
  ADDFXL U585 ( .A(N193), .B(width_r[5]), .CI(\r742/carry [1]), .CO(
        \r742/carry [2]), .S(N218) );
  NAND3BX1 U586 ( .AN(n354), .B(n342), .C(n460), .Y(n238) );
  AND4X1 U587 ( .A(n347), .B(n456), .C(n346), .D(n344), .Y(n342) );
  AND3X2 U588 ( .A(n349), .B(n360), .C(n351), .Y(n344) );
  NAND4BX1 U589 ( .AN(n460), .B(n354), .C(n342), .D(counter_r[8]), .Y(n245) );
  NAND4X1 U590 ( .A(n356), .B(n354), .C(n460), .D(n342), .Y(n333) );
  NOR2X1 U591 ( .A(n482), .B(START), .Y(n251) );
  CLKBUFX3 U592 ( .A(n180), .Y(n474) );
  NOR3BXL U593 ( .AN(n469), .B(n356), .C(n238), .Y(n180) );
  NAND3X1 U594 ( .A(n450), .B(n454), .C(n357), .Y(n338) );
  OAI2BB2XL U595 ( .B0(n356), .B1(n518), .A0N(N1004), .A1N(n323), .Y(n445) );
  NOR2X1 U596 ( .A(SH[1]), .B(SH[0]), .Y(n166) );
  NOR2X1 U597 ( .A(SW[1]), .B(SW[0]), .Y(n253) );
  AO22X1 U598 ( .A0(height_r[7]), .A1(n482), .B0(n504), .B1(n170), .Y(n364) );
  XNOR2X1 U599 ( .A(SH[3]), .B(n169), .Y(n170) );
  AO22X1 U600 ( .A0(width_r[7]), .A1(n482), .B0(n504), .B1(n257), .Y(n380) );
  XNOR2X1 U601 ( .A(SW[3]), .B(n256), .Y(n257) );
  AO22X1 U602 ( .A0(height_r[6]), .A1(n482), .B0(n504), .B1(n167), .Y(n363) );
  OAI21XL U603 ( .A0(n166), .A1(n506), .B0(n169), .Y(n167) );
  AO22X1 U604 ( .A0(width_r[6]), .A1(n482), .B0(n504), .B1(n254), .Y(n379) );
  OAI21XL U605 ( .A0(n253), .A1(n505), .B0(n256), .Y(n254) );
  CLKINVX1 U606 ( .A(SH[2]), .Y(n506) );
  CLKINVX1 U607 ( .A(SW[2]), .Y(n505) );
  NAND2X1 U608 ( .A(START), .B(n249), .Y(n162) );
  AO22X1 U609 ( .A0(height_r[5]), .A1(n482), .B0(n504), .B1(n165), .Y(n362) );
  AO21X1 U610 ( .A0(SH[0]), .A1(SH[1]), .B0(n166), .Y(n165) );
  AO22X1 U611 ( .A0(width_r[5]), .A1(n482), .B0(n504), .B1(n252), .Y(n378) );
  AO21X1 U612 ( .A0(SW[0]), .A1(SW[1]), .B0(n253), .Y(n252) );
  AO22X1 U613 ( .A0(v0_r[0]), .A1(n482), .B0(N98), .B1(n504), .Y(n422) );
  AO22X1 U614 ( .A0(v0_r[1]), .A1(n482), .B0(N99), .B1(n504), .Y(n423) );
  AO22X1 U615 ( .A0(v0_r[2]), .A1(n482), .B0(N100), .B1(n504), .Y(n424) );
  AO22X1 U616 ( .A0(v0_r[3]), .A1(n482), .B0(N101), .B1(n504), .Y(n425) );
  AO22X1 U617 ( .A0(v0_r[4]), .A1(n482), .B0(N102), .B1(n504), .Y(n426) );
  AO22X1 U618 ( .A0(v0_r[5]), .A1(n482), .B0(N103), .B1(n504), .Y(n427) );
  AO22X1 U619 ( .A0(N192), .A1(n482), .B0(N92), .B1(n504), .Y(n428) );
  AO22X1 U620 ( .A0(N193), .A1(n482), .B0(N93), .B1(n504), .Y(n429) );
  AO22X1 U621 ( .A0(N194), .A1(n482), .B0(N94), .B1(n504), .Y(n430) );
  AO22X1 U622 ( .A0(N195), .A1(n521), .B0(N95), .B1(n504), .Y(n431) );
  AO22X1 U623 ( .A0(N196), .A1(n482), .B0(N96), .B1(n504), .Y(n432) );
  AO22X1 U624 ( .A0(N197), .A1(n482), .B0(N97), .B1(n504), .Y(n433) );
  OAI2BB2XL U625 ( .B0(n349), .B1(n518), .A0N(N1003), .A1N(n323), .Y(n439) );
  OAI2BB2XL U626 ( .B0(n162), .B1(SH[0]), .A0N(height_r[4]), .A1N(n521), .Y(
        n361) );
  OAI2BB2XL U627 ( .B0(n162), .B1(SW[0]), .A0N(width_r[4]), .A1N(n521), .Y(
        n377) );
  OAI2BB2XL U628 ( .B0(n456), .B1(n518), .A0N(N1002), .A1N(n323), .Y(n438) );
  OAI2BB2XL U629 ( .B0(n460), .B1(n518), .A0N(N1001), .A1N(n323), .Y(n437) );
  NOR2BX1 U630 ( .AN(n352), .B(n353), .Y(n234) );
  NOR2BX1 U631 ( .AN(n353), .B(n352), .Y(n233) );
  OAI2BB2XL U632 ( .B0(n354), .B1(n518), .A0N(N1000), .A1N(n323), .Y(n436) );
  OAI2BB2XL U633 ( .B0(n346), .B1(n518), .A0N(N998), .A1N(n323), .Y(n434) );
  OAI2BB2XL U634 ( .B0(n347), .B1(n518), .A0N(N999), .A1N(n323), .Y(n435) );
  OAI2BB2XL U635 ( .B0(n351), .B1(n518), .A0N(N997), .A1N(n323), .Y(n446) );
  OAI2BB2XL U636 ( .B0(n360), .B1(n518), .A0N(N996), .A1N(n323), .Y(n449) );
  NOR2X1 U637 ( .A(n353), .B(n352), .Y(n232) );
  XOR3X2 U638 ( .A(\mult_64/n22 ), .B(\mult_64/n24 ), .C(\mult_64/n6 ), .Y(N59) );
  XOR2X1 U639 ( .A(N329), .B(\add_155_5/carry [11]), .Y(N490) );
  XOR2X1 U640 ( .A(N297), .B(\add_152_4/carry [11]), .Y(N451) );
  XOR2X1 U641 ( .A(N329), .B(\add_149_4/carry [11]), .Y(N418) );
  XOR2X1 U642 ( .A(N297), .B(\add_144_4/carry [11]), .Y(N375) );
  XOR2X1 U643 ( .A(N329), .B(\add_141_4/carry [11]), .Y(N341) );
  XOR2X1 U644 ( .A(N297), .B(\add_136_3/carry [11]), .Y(N309) );
  XOR2X1 U645 ( .A(v0_r[5]), .B(\add_0_root_add_107_2/carry [11]), .Y(N185) );
  XOR2X1 U646 ( .A(N203), .B(\add_0_root_add_113_3/carry [11]), .Y(N228) );
  AND2X1 U647 ( .A(\add_155_5/carry [10]), .B(N328), .Y(\add_155_5/carry [11])
         );
  XOR2X1 U648 ( .A(N328), .B(\add_155_5/carry [10]), .Y(N489) );
  AND2X1 U649 ( .A(\add_152_4/carry [10]), .B(N296), .Y(\add_152_4/carry [11])
         );
  XOR2X1 U650 ( .A(N296), .B(\add_152_4/carry [10]), .Y(N450) );
  AND2X1 U651 ( .A(\add_149_4/carry [10]), .B(N328), .Y(\add_149_4/carry [11])
         );
  XOR2X1 U652 ( .A(N328), .B(\add_149_4/carry [10]), .Y(N417) );
  AND2X1 U653 ( .A(\add_144_4/carry [10]), .B(N296), .Y(\add_144_4/carry [11])
         );
  XOR2X1 U654 ( .A(N296), .B(\add_144_4/carry [10]), .Y(N374) );
  AND2X1 U655 ( .A(\add_141_4/carry [10]), .B(N328), .Y(\add_141_4/carry [11])
         );
  XOR2X1 U656 ( .A(N328), .B(\add_141_4/carry [10]), .Y(N340) );
  AND2X1 U657 ( .A(\add_136_3/carry [10]), .B(N296), .Y(\add_136_3/carry [11])
         );
  XOR2X1 U658 ( .A(N296), .B(\add_136_3/carry [10]), .Y(N308) );
  AND2X1 U659 ( .A(\add_0_root_add_107_2/carry [10]), .B(v0_r[4]), .Y(
        \add_0_root_add_107_2/carry [11]) );
  XOR2X1 U660 ( .A(v0_r[4]), .B(\add_0_root_add_107_2/carry [10]), .Y(N184) );
  AND2X1 U661 ( .A(\add_0_root_add_113_3/carry [10]), .B(N202), .Y(
        \add_0_root_add_113_3/carry [11]) );
  XOR2X1 U662 ( .A(N202), .B(\add_0_root_add_113_3/carry [10]), .Y(N227) );
  AND2X1 U663 ( .A(\add_155_5/carry [9]), .B(N327), .Y(\add_155_5/carry [10])
         );
  XOR2X1 U664 ( .A(N327), .B(\add_155_5/carry [9]), .Y(N488) );
  AND2X1 U665 ( .A(\add_152_4/carry [9]), .B(N295), .Y(\add_152_4/carry [10])
         );
  XOR2X1 U666 ( .A(N295), .B(\add_152_4/carry [9]), .Y(N449) );
  AND2X1 U667 ( .A(\add_149_4/carry [9]), .B(N327), .Y(\add_149_4/carry [10])
         );
  XOR2X1 U668 ( .A(N327), .B(\add_149_4/carry [9]), .Y(N416) );
  AND2X1 U669 ( .A(\add_144_4/carry [9]), .B(N295), .Y(\add_144_4/carry [10])
         );
  XOR2X1 U670 ( .A(N295), .B(\add_144_4/carry [9]), .Y(N373) );
  AND2X1 U671 ( .A(\add_141_4/carry [9]), .B(N327), .Y(\add_141_4/carry [10])
         );
  XOR2X1 U672 ( .A(N327), .B(\add_141_4/carry [9]), .Y(N339) );
  AND2X1 U673 ( .A(\add_136_3/carry [9]), .B(N295), .Y(\add_136_3/carry [10])
         );
  XOR2X1 U674 ( .A(N295), .B(\add_136_3/carry [9]), .Y(N307) );
  AND2X1 U675 ( .A(\add_0_root_add_107_2/carry [9]), .B(v0_r[3]), .Y(
        \add_0_root_add_107_2/carry [10]) );
  XOR2X1 U676 ( .A(v0_r[3]), .B(\add_0_root_add_107_2/carry [9]), .Y(N183) );
  AND2X1 U677 ( .A(\add_0_root_add_113_3/carry [9]), .B(N201), .Y(
        \add_0_root_add_113_3/carry [10]) );
  XOR2X1 U678 ( .A(N201), .B(\add_0_root_add_113_3/carry [9]), .Y(N226) );
  AND2X1 U679 ( .A(\add_155_5/carry [8]), .B(N326), .Y(\add_155_5/carry [9])
         );
  XOR2X1 U680 ( .A(N326), .B(\add_155_5/carry [8]), .Y(N487) );
  AND2X1 U681 ( .A(\add_152_4/carry [8]), .B(N294), .Y(\add_152_4/carry [9])
         );
  XOR2X1 U682 ( .A(N294), .B(\add_152_4/carry [8]), .Y(N448) );
  AND2X1 U683 ( .A(\add_149_4/carry [8]), .B(N326), .Y(\add_149_4/carry [9])
         );
  XOR2X1 U684 ( .A(N326), .B(\add_149_4/carry [8]), .Y(N415) );
  AND2X1 U685 ( .A(\add_144_4/carry [8]), .B(N294), .Y(\add_144_4/carry [9])
         );
  XOR2X1 U686 ( .A(N294), .B(\add_144_4/carry [8]), .Y(N372) );
  AND2X1 U687 ( .A(\add_141_4/carry [8]), .B(N326), .Y(\add_141_4/carry [9])
         );
  XOR2X1 U688 ( .A(N326), .B(\add_141_4/carry [8]), .Y(N338) );
  AND2X1 U689 ( .A(\add_136_3/carry [8]), .B(N294), .Y(\add_136_3/carry [9])
         );
  XOR2X1 U690 ( .A(N294), .B(\add_136_3/carry [8]), .Y(N306) );
  AND2X1 U691 ( .A(\add_0_root_add_107_2/carry [8]), .B(v0_r[2]), .Y(
        \add_0_root_add_107_2/carry [9]) );
  XOR2X1 U692 ( .A(v0_r[2]), .B(\add_0_root_add_107_2/carry [8]), .Y(N182) );
  AND2X1 U693 ( .A(\add_0_root_add_113_3/carry [8]), .B(N200), .Y(
        \add_0_root_add_113_3/carry [9]) );
  XOR2X1 U694 ( .A(N200), .B(\add_0_root_add_113_3/carry [8]), .Y(N225) );
  AND2X1 U695 ( .A(\add_155_5/carry [7]), .B(N325), .Y(\add_155_5/carry [8])
         );
  XOR2X1 U696 ( .A(N325), .B(\add_155_5/carry [7]), .Y(N486) );
  AND2X1 U697 ( .A(\add_152_4/carry [7]), .B(N293), .Y(\add_152_4/carry [8])
         );
  XOR2X1 U698 ( .A(N293), .B(\add_152_4/carry [7]), .Y(N447) );
  AND2X1 U699 ( .A(\add_149_4/carry [7]), .B(N325), .Y(\add_149_4/carry [8])
         );
  XOR2X1 U700 ( .A(N325), .B(\add_149_4/carry [7]), .Y(N414) );
  AND2X1 U701 ( .A(\add_144_4/carry [7]), .B(N293), .Y(\add_144_4/carry [8])
         );
  XOR2X1 U702 ( .A(N293), .B(\add_144_4/carry [7]), .Y(N371) );
  AND2X1 U703 ( .A(\add_141_4/carry [7]), .B(N325), .Y(\add_141_4/carry [8])
         );
  XOR2X1 U704 ( .A(N325), .B(\add_141_4/carry [7]), .Y(N337) );
  AND2X1 U705 ( .A(\add_136_3/carry [7]), .B(N293), .Y(\add_136_3/carry [8])
         );
  XOR2X1 U706 ( .A(N293), .B(\add_136_3/carry [7]), .Y(N305) );
  AND2X1 U707 ( .A(\add_0_root_add_107_2/carry [7]), .B(v0_r[1]), .Y(
        \add_0_root_add_107_2/carry [8]) );
  XOR2X1 U708 ( .A(v0_r[1]), .B(\add_0_root_add_107_2/carry [7]), .Y(N181) );
  AND2X1 U709 ( .A(\add_0_root_add_113_3/carry [7]), .B(N199), .Y(
        \add_0_root_add_113_3/carry [8]) );
  XOR2X1 U710 ( .A(N199), .B(\add_0_root_add_113_3/carry [7]), .Y(N224) );
  AND2X1 U711 ( .A(N356), .B(N324), .Y(\add_155_5/carry [7]) );
  XOR2X1 U712 ( .A(N324), .B(N356), .Y(N485) );
  AND2X1 U713 ( .A(N356), .B(N292), .Y(\add_152_4/carry [7]) );
  XOR2X1 U714 ( .A(N292), .B(N356), .Y(N446) );
  AND2X1 U715 ( .A(N291), .B(N324), .Y(\add_149_4/carry [7]) );
  XOR2X1 U716 ( .A(N324), .B(N291), .Y(N413) );
  AND2X1 U717 ( .A(N356), .B(N292), .Y(\add_144_4/carry [7]) );
  XOR2X1 U718 ( .A(N292), .B(N356), .Y(N370) );
  AND2X1 U719 ( .A(N291), .B(N324), .Y(\add_141_4/carry [7]) );
  XOR2X1 U720 ( .A(N324), .B(N291), .Y(N336) );
  AND2X1 U721 ( .A(N291), .B(N292), .Y(\add_136_3/carry [7]) );
  XOR2X1 U722 ( .A(N292), .B(N291), .Y(N304) );
  AND2X1 U723 ( .A(v0_r[0]), .B(N173), .Y(\add_0_root_add_107_2/carry [7]) );
  XOR2X1 U724 ( .A(N173), .B(v0_r[0]), .Y(N180) );
  AND2X1 U725 ( .A(N198), .B(N173), .Y(\add_0_root_add_113_3/carry [7]) );
  XOR2X1 U726 ( .A(N173), .B(N198), .Y(N223) );
  AND2X1 U727 ( .A(N197), .B(\r756/carry [5]), .Y(N356) );
  XOR2X1 U728 ( .A(N197), .B(\r756/carry [5]), .Y(N369) );
  AND2X1 U729 ( .A(N197), .B(\r751/carry [5]), .Y(N291) );
  XOR2X1 U730 ( .A(N197), .B(\r751/carry [5]), .Y(N303) );
  AND2X1 U731 ( .A(N197), .B(\r742/carry [5]), .Y(N173) );
  XOR2X1 U732 ( .A(N197), .B(\r742/carry [5]), .Y(N222) );
  AND2X1 U733 ( .A(\r756/carry [4]), .B(N196), .Y(\r756/carry [5]) );
  XOR2X1 U734 ( .A(N196), .B(\r756/carry [4]), .Y(N368) );
  AND2X1 U735 ( .A(\r751/carry [4]), .B(N196), .Y(\r751/carry [5]) );
  XOR2X1 U736 ( .A(N196), .B(\r751/carry [4]), .Y(N302) );
  AND2X1 U737 ( .A(\r742/carry [4]), .B(N196), .Y(\r742/carry [5]) );
  XOR2X1 U738 ( .A(N196), .B(\r742/carry [4]), .Y(N221) );
  OR2X1 U739 ( .A(N44), .B(N192), .Y(\r756/carry [1]) );
  XNOR2X1 U740 ( .A(N192), .B(N44), .Y(N364) );
  AND2X1 U741 ( .A(N192), .B(N44), .Y(\r751/carry [1]) );
  XOR2X1 U742 ( .A(N44), .B(N192), .Y(N298) );
  AND2X1 U743 ( .A(N192), .B(width_r[4]), .Y(\r742/carry [1]) );
  XOR2X1 U744 ( .A(width_r[4]), .B(N192), .Y(N217) );
  NOR2X1 U745 ( .A(n452), .B(n485), .Y(\mult_64/n37 ) );
  NOR2X1 U746 ( .A(n453), .B(n486), .Y(\mult_64/n42 ) );
  NOR2X1 U747 ( .A(n453), .B(n484), .Y(\mult_64/n43 ) );
  NOR2X1 U748 ( .A(n451), .B(n483), .Y(\mult_64/n49 ) );
  NOR2X1 U749 ( .A(n451), .B(n486), .Y(\mult_64/n50 ) );
  NOR2X1 U750 ( .A(n451), .B(n484), .Y(\mult_64/n51 ) );
  NAND4X1 U751 ( .A(N700), .B(N699), .C(N698), .D(N697), .Y(n490) );
  NOR4X1 U752 ( .A(N727), .B(N726), .C(N725), .D(N724), .Y(n487) );
  NAND2X1 U753 ( .A(N696), .B(N695), .Y(n488) );
  NAND4X1 U754 ( .A(N772), .B(N771), .C(N770), .D(N769), .Y(n494) );
  NOR4X1 U755 ( .A(N799), .B(N798), .C(N797), .D(N796), .Y(n491) );
  NAND3BX1 U756 ( .AN(n491), .B(N773), .C(N774), .Y(n493) );
  NAND2X1 U757 ( .A(N768), .B(N767), .Y(n492) );
  NOR3X1 U758 ( .A(n494), .B(n493), .C(n492), .Y(N808) );
  NAND4X1 U759 ( .A(N921), .B(N920), .C(N919), .D(N918), .Y(n498) );
  NOR4X1 U760 ( .A(N915), .B(N914), .C(N913), .D(N912), .Y(n495) );
  NAND2X1 U761 ( .A(N917), .B(N916), .Y(n496) );
endmodule

