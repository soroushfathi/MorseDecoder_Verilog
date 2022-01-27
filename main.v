/*module test(dout);
output [7:0]dout;
reg dot ,dash ,lg ,wg ,clk ,dvalid ,error;
morsecoder UUT (.dot(dot) ,.dash(dash) ,.lg(lg) ,.wg(wg) ,.clk(clk) ,.dout(dout) ,.dvalid(dvalid) ,.error(error));
initial begin
    clk=0;
     forever #10 clk = ~clk;
end
initial begin 
 lg=1'b0;
 #10;
 dot=1'b1;
 #50;
 lg=1'b1;
end
endmodule*/
module morsecoder(dot ,dash ,lg ,wg ,clk ,dout ,dvalid ,error);
input dot ,dash ,lg ,wg ,clk;
output reg dvalid ,error;
reg [7:0] present_state;
output reg [7:0]dout;
localparam start=8'd0 ,A=8'd65 ,B=8'd66, C=8'd67 ,D=8'd68 ,E=8'd69 ,F=8'd70 ,G=8'd71 ,H=8'd72 ,I=8'd73;
localparam T=8'd84, J=8'd74, K=8'd75, L=8'd76, M=8'd77, N=8'd78, O=8'd79, P=8'd80, Q=8'd81, R=8'd82, S=8'd83;
localparam U=8'd85, J=8'd74,;
initial begin
  present_state=start; 
end 
/*initial begin 
 present_state=start;
 lg <=1'b0;
 #10;
 dot=1'b1;
 #50;
 lg=1'b1;
end */
always @(posedge clk) 
begin
    case (present_state)
        start:
        begin
        if(dot==1'b1)
            present_state=E;
        else if(dash==1'b1)
            present_state=T;
        end 
        E:
        begin
        if(dot==1'b1)
            present_state=I;
        else if(dash==1'b1)
            present_state=A;
        end
        default:error=1'b1;
    endcase
end 
always @(posedge lg) 
begin
    dout[0]=present_state[0];
    dout[1]=present_state[1];
    dout[2]=present_state[2];
    dout[3]=present_state[3];
    dout[4]=present_state[4];
    dout[5]=present_state[5];
    dout[6]=present_state[6];
    dout[7]=1'b0;
end 

endmodule 

