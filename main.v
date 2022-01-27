module morsecoder(dot ,dash ,lg ,wg ,clk ,dout ,dvalid ,error);
input dot ,dash ,lg ,wg ,clk;
output reg dvalid ,error;
reg [7:0] present_state;
output reg [7:0]dout;
localparam start=8'd0 ,A=8'd65 ,B=8'd66, C=8'd67 ,D=8'd68 ,E=8'd69 ,F=8'd70 ,G=8'd71 ,H=8'd72 ,I=8'd73;
localparam T=8'd84, J=8'd74, K=8'd75, L=8'd76, M=8'd77, N=8'd78, O=8'd79, P=8'd80, Q=8'd81, R=8'd82, S=8'd83, U=8'd85;
localparam ZERO=8'd48, ONE=8'd49, TWO=8'd50, THREE=8'd51, FOUR=8'd52, FIVE=8'd53, SIX=8'd54, SEVEN=8'd55, EIGHT=8'd56, NINE=8'd57, EQUAL=8'd61;
initial begin
  present_state=start; 
end 

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
        A:
        begin
            if(dot==1'b1)
                present_state=R;
            else if(dash==1'b1)
                present_state=W;
        end
        W:
        begin
            if(dot==1'b1)
                present_state=P;
            else if(dash==1'b1)
                present_state=J;
        end
        R:
        begin
            if(dot==1'b1)
                present_state=L;
        end
        J:
        begin
            if(dash==1'b1)
                present_state=ONE;
        end
        I:
        begin
            if(dot==1'b1)
                present_state=S;
            else if(dash==1'b1)
                present_state=U;
        end
        S:
        begin
            if(dot==1'b1)
                present_state=H;
            else if(dash==1'b1)
                present_state=V;
        end
        U:
        begin
            if(dot==1'b1)
                present_state=F;
        end
        H:
        begin
            if(dot==1'b1)
                present_state=FIVE;
            else if(dash==1'b1)
                present_state=FOUR;
        end
        V:
        begin
            if(dash==1'b1)
                present_state=THREE;
        end
        T:
        begin
            if(dot==1'b1)
                present_state=N;
            else if(dash==1'b1)
                present_state=M;
        end
        M:
        begin
            if(dot==1'b1)
                present_state=G;
            else if(dash==1'b1)
                present_state=O;
        end
        G:
        begin
            if(dot==1'b1)
                present_state=Z;
            else if(dash==1'b1)
                present_state=Q;
        end
        N:
        begin
            if(dot==1'b1)
                present_state=D;
            else if(dash==1'b1)
                present_state=K;
        end
        D:
        begin
            if(dot==1'b1)
                present_state=B;
            else if(dash==1'b1)
                present_state=X;
        end
        B:
        begin
            if(dot==1'b1)
                present_state=SIX;
            else if(dash==1'b1)
                present_state=EQUAL;
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

