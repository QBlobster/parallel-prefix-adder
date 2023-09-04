module adder32
#
(
    parameter DATA_WIDTH = 31
)
(
    input [DATA_WIDTH:0]a, b,
    input cin,
    output [DATA_WIDTH:0]s,
    output cout
);

wire h0;
wire [(DATA_WIDTH+1)/2:0]h,t,c,sc,x,y,z;
wire [DATA_WIDTH:0]g,p,s0,s1;

assign g = a & b;
assign p = a ^ b;
       
assign t[0] = (a[0] | b[0]) & (a[1] | b[1]), //T1:0
       t[1] = (a[2] | b[2]) & (a[3] | b[3]), //T3:2
       t[2] = (a[4] | b[4]) & (a[5] | b[5]), //T5:4
       t[3] = (a[6] | b[6]) & (a[7] | b[7]), //T7:6
       t[4] = (a[8] | b[8]) & (a[9] | b[9]), //T9:8
       t[5] = (a[10] | b[10]) & (a[11] | b[11]), //T11:10
       t[6] = (a[12] | b[12]) & (a[13] | b[13]), //T13:12
       t[7] = (a[14] | b[14]) & (a[15] | b[15]), //T15:14
       t[8] = (a[16] | b[16]) & (a[17] | b[17]), //T17:16
       t[9] = (a[18] | b[18]) & (a[19] | b[19]), //T19:18
       t[10] = (a[20] | b[20]) & (a[21] | b[21]), //T21:20
       t[11] = (a[22] | b[22]) & (a[23] | b[23]), //T23:22
       t[12] = (a[24] | b[24]) & (a[25] | b[25]), //T25:24
       t[13] = (a[26] | b[26]) & (a[27] | b[27]), //T27:26
       t[14] = (a[28] | b[28]) & (a[29] | b[29]), //T29:28
       h0 = g[0] | cin,
       h[0] = g[2] | g[1], //H2:1
       h[1] = g[4] | g[3], //H4:3
       h[2] = g[6] | g[5], //H6:5
       h[3] = g[8] | g[7], //H8:7
       h[4] = g[10] | g[9], //H10:9
       h[5] = g[12] | g[11], //H12:11
       h[6] = g[14] | g[13], //H14:13
       h[7] = g[16] | g[15], //H16:15
       h[8] = g[18] | g[17], //H18:17
       h[9] = g[20] | g[19], //H20:19
       h[10] = g[22] | g[21], //H22:21
       h[11] = g[24] | g[23], //H24:23
       h[12] = g[26] | g[25], //H26:25
       h[13] = g[28] | g[27], //H28:27
       h[14] = g[30] | g[29]; //H30:29
       
assign sc[0] = (p[1] == 0) ? ~(g[1]) : ~(a[0] | b[0]),
       sc[1] = (p[3] == 0) ? ~(g[3]) : ~(a[2] | b[2]),
       sc[2] = (p[5] == 0) ? ~(g[5]) : ~(a[4] | b[4]),
       sc[3] = (p[7] == 0) ? ~(g[7]) : ~(a[6] | b[6]),
       sc[4] = (p[9] == 0) ? ~(g[9]) : ~(a[8] | b[8]),
       sc[5] = (p[11] == 0) ? ~(g[11]) : ~(a[10] | b[10]),
       sc[6] = (p[13] == 0) ? ~(g[13]) : ~(a[12] | b[12]),
       sc[7] = (p[15] == 0) ? ~(g[15]) : ~(a[14] | b[14]),
       sc[8] = (p[17] == 0) ? ~(g[17]) : ~(a[16] | b[16]),
       sc[9] = (p[19] == 0) ? ~(g[19]) : ~(a[18] | b[18]),
       sc[10] = (p[21] == 0) ? ~(g[21]) : ~(a[20] | b[20]),
       sc[11] = (p[23] == 0) ? ~(g[23]) : ~(a[22] | b[22]),
       sc[12] = (p[25] == 0) ? ~(g[25]) : ~(a[24] | b[24]),
       sc[13] = (p[27] == 0) ? ~(g[27]) : ~(a[26] | b[26]),
       sc[14] = (p[29] == 0) ? ~(g[29]) : ~(a[28] | b[28]),
       sc[15] = (p[31] == 0) ? ~(g[31]) : ~(a[30] | b[30]);
assign x[0] = ~(~cin),
       x[1] = ~(~h0),
       x[2] = ~(~h[0] & (~t[0] | ~h0)),
       x[3] = ~(~h[1] & (~t[1] | ~h[0])),
       x[4] = ~(~h[2] & (~t[2] | ~h[1])),
       x[5] = ~(~h[3] & (~t[3] | ~h[2])),
       x[6] = ~(~h[4] & (~t[4] | ~h[3])),
       x[7] = ~(~h[5] & (~t[5] | ~h[4])),
       x[8] = ~(~h[6] & (~t[6] | ~h[5])),
       x[9] = ~(~h[7] & (~t[7] | ~h[6])),
       x[10] = ~(~h[8] & (~t[8] | ~h[7])),
       x[11] = ~(~h[9] & (~t[9] | ~h[8])),
       x[12] = ~(~h[10] & (~t[10] | ~h[9])),
       x[13] = ~(~h[11] & (~t[11] | ~h[10])),
       x[14] = ~(~h[12] & (~t[12] | ~h[11])),
       x[15] = ~(~h[13] & (~t[13] | ~h[12])),
       x[16] = ~(~h[14] & (~t[14] | ~h[13]));
assign y[0] = ~x[0],
       y[1] = ~x[1],
       y[2] = ~x[2],
       y[3] = ~(x[3] | (~(~t[1] | ~t[0]) & x[1])),
       y[4] = ~(x[4] | (~(~t[2] | ~t[1]) & x[2])),
       y[5] = ~(x[5] | (~(~t[3] | ~t[2]) & x[3])),
       y[6] = ~(x[6] | (~(~t[4] | ~t[3]) & x[4])),
       y[7] = ~(x[7] | (~(~t[5] | ~t[4]) & x[5])),
       y[8] = ~(x[8] | (~(~t[6] | ~t[5]) & x[6])),
       y[9] = ~(x[9] | (~(~t[7] | ~t[6]) & x[7])),
       y[10] = ~(x[10] | (~(~t[8] | ~t[7]) & x[8])),
       y[11] = ~(x[11] | (~(~t[9] | ~t[8]) & x[9])),
       y[12] = ~(x[12] | (~(~t[10] | ~t[9]) & x[10])),
       y[13] = ~(x[13] | (~(~t[11] | ~t[10]) & x[11])),
       y[14] = ~(x[14] | (~(~t[12] | ~t[11]) & x[12])),
       y[15] = ~(x[15] | (~(~t[13] | ~t[12]) & x[13])),
       y[16] = ~(x[16] | (~(~t[14] | ~t[13]) & x[14]));
assign z[0] = ~y[0],
       z[1] = ~y[1],
       z[2] = ~y[2],
       z[3] = ~y[3],
       z[4] = ~y[4],
       z[5] = ~(y[5] & (y[1] | ~t[3] | ~t[2] | ~t[1] | ~t[0]) ),
       z[6] = ~(y[6] & (y[2] | ~t[4] | ~t[3] | ~t[2] | ~t[1]) ),
       z[7] = ~(y[7] & (y[3] | ~t[5] | ~t[4] | ~t[3] | ~t[2]) ),
       z[8] = ~(y[8] & (y[4] | ~t[6] | ~t[5] | ~t[4] | ~t[3]) ),
       z[9] = ~(y[9] & (y[5] | ~t[7] | ~t[6] | ~t[5] | ~t[4]) ),
       z[10] = ~(y[10] & (y[6] | ~t[8] | ~t[7] | ~t[6] | ~t[5]) ),
       z[11] = ~(y[11] & (y[7] | ~t[9] | ~t[8] | ~t[7] | ~t[6]) ),
       z[12] = ~(y[12] & (y[8] | ~t[10] | ~t[9] | ~t[8] | ~t[7]) ),
       z[13] = ~(y[13] & (y[9] | ~t[11] | ~t[10] | ~t[9] | ~t[8]) ),
       z[14] = ~(y[14] & (y[10] | ~t[12] | ~t[11] | ~t[10] | ~t[9]) ),
       z[15] = ~(y[15] & (y[11] | ~t[13] | ~t[12] | ~t[11] | ~t[10]) ),
       z[16] = ~(y[16] & (y[12] | ~t[14] | ~t[13] | ~t[12] | ~t[11]) );
assign c[0] = ~(~z[0]),
       c[1] = ~(~z[1]),
       c[2] = ~(~z[2]),
       c[3] = ~(~z[3]),
       c[4] = ~(~z[4]),
       c[5] = ~(~z[5]),
       c[6] = ~(~z[6]),
       c[7] = ~(~z[7]),
       c[8] = ~(~z[8]),
       c[9] = ~( ~(z[9] | ( ~((~t[7] | ~t[6] | ~t[5] | ~t[4]) | (~t[3] | ~t[2] | ~t[1] | ~t[0])) & z[1] ) ) ),
       c[10] = ~( ~(z[10] | ( ~((~t[8] | ~t[7] | ~t[6] | ~t[5]) | (~t[4] | ~t[3] | ~t[2] | ~t[1])) & z[2] ) ) ),
       c[11] = ~( ~(z[11] | ( ~((~t[9] | ~t[8] | ~t[7] | ~t[6]) | (~t[5] | ~t[4] | ~t[3] | ~t[2])) & z[3] ) ) ),
       c[12] = ~( ~(z[12] | ( ~((~t[10] | ~t[9] | ~t[8] | ~t[7]) | (~t[6] | ~t[5] | ~t[4] | ~t[3])) & z[4] ) ) ),
       c[13] = ~( ~(z[13] | ( ~((~t[11] | ~t[10] | ~t[9] | ~t[8]) | (~t[7] | ~t[6] | ~t[5] | ~t[4])) & z[5] ) ) ),
       c[14] = ~( ~(z[14] | ( ~((~t[12] | ~t[11] | ~t[10] | ~t[9]) | (~t[8] | ~t[7] | ~t[6] | ~t[5])) & z[6] ) ) ),
       c[15] = ~( ~(z[15] | ( ~((~t[13] | ~t[12] | ~t[11] | ~t[10]) | (~t[9] | ~t[8] | ~t[7] | ~t[6])) & z[7] ) ) ),
       c[16] = ~( ~(z[16] | ( ~((~t[14] | ~t[13] | ~t[12] | ~t[11]) | (~t[10] | ~t[9] | ~t[8] | ~t[7])) & z[8] ) ) );
assign s0[0] = p[0],
       s1[0] = ~p[0],
       s0[1] = p[1],
       s1[1] = p[1] ^ (a[0] | b[0]),
       s0[2] = p[2] ^ g[1],
       s1[2] = p[2] ^ (~sc[0]),
       s0[3] = p[3],
       s1[3] = p[3] ^ (a[2] | b[2]),
       s0[4] = p[4] ^ g[3],
       s1[4] = p[4] ^ (~sc[1]),
       s0[5] = p[5],
       s1[5] = p[5] ^ (a[4] | b[4]),
       s0[6] = p[6] ^ g[5],
       s1[6] = p[6] ^ (~sc[2]),
       s0[7] = p[7],
       s1[7] = p[7] ^ (a[6] | b[6]),
       s0[8] = p[8] ^ g[7],
       s1[8] = p[8] ^ (~sc[3]),
       s0[9] = p[9],
       s1[9] = p[9] ^ (a[8] | b[8]),
       s0[10] = p[10] ^ g[9],
       s1[10] = p[10] ^ (~sc[4]),
       s0[11] = p[11],
       s1[11] = p[11] ^ (a[10] | b[10]),
       s0[12] = p[12] ^ g[11],
       s1[12] = p[12] ^ (~sc[5]),
       s0[13] = p[13],
       s1[13] = p[13] ^ (a[12] | b[12]),
       s0[14] = p[14] ^ g[13],
       s1[14] = p[14] ^ (~sc[6]),
       s0[15] = p[15],
       s1[15] = p[15] ^ (a[14] | b[14]),
       s0[16] = p[16] ^ g[15],
       s1[16] = p[16] ^ (~sc[7]),
       s0[17] = p[17],
       s1[17] = p[17] ^ (a[16] | b[16]),
       s0[18] = p[18] ^ g[17],
       s1[18] = p[18] ^ (~sc[8]),
       s0[19] = p[19],
       s1[19] = p[19] ^ (a[18] | b[18]),
       s0[20] = p[20] ^ g[19],
       s1[20] = p[20] ^ (~sc[9]),
       s0[21] = p[21],
       s1[21] = p[21] ^ (a[20] | b[20]),
       s0[22] = p[22] ^ g[21],
       s1[22] = p[22] ^ (~sc[10]),
       s0[23] = p[23],
       s1[23] = p[23] ^ (a[22] | b[22]),
       s0[24] = p[24] ^ g[23],
       s1[24] = p[24] ^ (~sc[11]),
       s0[25] = p[25],
       s1[25] = p[25] ^ (a[24] | b[24]),
       s0[26] = p[26] ^ g[25],
       s1[26] = p[26] ^ (~sc[12]),
       s0[27] = p[27],
       s1[27] = p[27] ^ (a[26] | b[26]),
       s0[28] = p[28] ^ g[27],
       s1[28] = p[28] ^ (~sc[13]),
       s0[29] = p[29],
       s1[29] = p[29] ^ (a[28] | b[28]),
       s0[30] = p[30] ^ g[29],
       s1[30] = p[30] ^ (~sc[14]),
       s0[31] = p[31],
       s1[31] = p[31] ^ (a[30] | b[30]);
       // s0[32] = p[32] ^ g[31],
       // s1[32] = p[32] ^ (~sc[15]);

assign s[0] = (c[0] == 0) ? s0[0] : s1[0],
       s[1] = (c[1] == 0) ? s0[1] : s1[1],
       s[2] = (c[1] == 0) ? s0[2] : s1[2],
       s[3] = (c[2] == 0) ? s0[3] : s1[3],
       s[4] = (c[2] == 0) ? s0[4] : s1[4],
       s[5] = (c[3] == 0) ? s0[5] : s1[5],
       s[6] = (c[3] == 0) ? s0[6] : s1[6],
       s[7] = (c[4] == 0) ? s0[7] : s1[7],
       s[8] = (c[4] == 0) ? s0[8] : s1[8],
       s[9] = (c[5] == 0) ? s0[9] : s1[9],
       s[10] = (c[5] == 0) ? s0[10] : s1[10],
       s[11] = (c[6] == 0) ? s0[11] : s1[11],
       s[12] = (c[6] == 0) ? s0[12] : s1[12],
       s[13] = (c[7] == 0) ? s0[13] : s1[13],
       s[14] = (c[7] == 0) ? s0[14] : s1[14],
       s[15] = (c[8] == 0) ? s0[15] : s1[15],
       s[16] = (c[8] == 0) ? s0[16] : s1[16],
       s[17] = (c[9] == 0) ? s0[17] : s1[17],
       s[18] = (c[9] == 0) ? s0[18] : s1[18],
       s[19] = (c[10] == 0) ? s0[19] : s1[19],
       s[20] = (c[10] == 0) ? s0[20] : s1[20],
       s[21] = (c[11] == 0) ? s0[21] : s1[21],
       s[22] = (c[11] == 0) ? s0[22] : s1[22],
       s[23] = (c[12] == 0) ? s0[23] : s1[23],
       s[24] = (c[12] == 0) ? s0[24] : s1[24],
       s[25] = (c[13] == 0) ? s0[25] : s1[25],
       s[26] = (c[13] == 0) ? s0[26] : s1[26],
       s[27] = (c[14] == 0) ? s0[27] : s1[27],
       s[28] = (c[14] == 0) ? s0[28] : s1[28],
       s[29] = (c[15] == 0) ? s0[29] : s1[29],
       s[30] = (c[15] == 0) ? s0[30] : s1[30],
       s[31] = (c[16] == 0) ? s0[31] : s1[31];
       // s[32] = (c[16] == 0) ? s0[32] : s1[32];

endmodule