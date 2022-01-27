module morsecoder(dot ,dash ,lg ,wg ,clk ,valid,clr ,dout ,dvalid ,error);
input dot ,dash ,lg ,wg ,clk ,valid ,clr;
output reg dvalid ,error;
reg [7:0] present_state;
output reg [7:0]dout;
localparam start=8'd0 ,A=8'd65 ,B=8'd66, C=8'd67 ,D=8'd68 ,E=8'd69 ,F=8'd70 ,G=8'd71 ,H=8'd72 ,I=8'd73;
localparam T=8'd84, J=8'd74, K=8'd75, L=8'd76, M=8'd77, N=8'd78, O=8'd79, P=8'd80, Q=8'd81, R=8'd82, S=8'd83, U=8'd85 ,V=8'd86 ,W=8'd87 ,X=8'd88 ,Y=8'd89 ,Z=8'd90;
localparam ZERO=8'd48, ONE=8'd49, TWO=8'd50, THREE=8'd51, FOUR=8'd52, FIVE=8'd53, SIX=8'd54, SEVEN=8'd55, EIGHT=8'd56, NINE=8'd57, EQUAL=8'd61 ,SLASH=8'd47 ,PLUS=8'd43;
localparam Udash=8'd91 ,Rdash=8'd92 ,Odash=8'd93 ,Odot=8'd94 ,INVALID=8'd1;
initial begin
    present_state=start; 
end 

always @(posedge clk) 
begin
    if(valid==1'b1)
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
            else if(dash==1'b1)
                present_state=Rdash;
        end
        Rdash:
        begin
            if(dot==1'b1)
                present_state=PLUS;
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
            else if(dash==1'b1)
                present_state=Udash;
        end
        Udash:
        begin
            if(dash==1'b1)
                present_state=TWO;
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
        K:
        begin
            if(dot==1'b1)
                present_state=C;
            else if(dash==1'b1)
                present_state=Y;
        end
        X:
        begin
            if(dot==1'b1)
                present_state=SLASH;
            
        end
        Z:
        begin
            if(dot==1'b1)
                present_state=SEVEN;
            
        end
        O:
        begin
            if(dot==1'b1)
                present_state=Odot;
            else if(dash==1'b1)
                present_state=Odash;
        end
        Odot:
        begin
            if(dot==1'b1)
                present_state=EIGHT;
            
        end
        Odash:
        begin
            if(dot==1'b1)
                present_state= NINE;
            else if(dash==1'b1)
                present_state=ZERO;
        end
        default:error=1'b1;
        endcase
    end
end 
always @(posedge lg,posedge clk) 
begin
    if(error==1'b0)
        begin
            dout=present_state;
            dvalid=1'b1;
            present_state=start;
        end
    else if(error==1'b0)
        begin
            dvalid=1'b0;
            present_state=start;
        end
end 
always @(posedge wg ,posedge clk)
begin
    dout=8'd32;
    dvalid=1'b1;
    present_state=start;
end
always @(posedge clr) 
begin
    present_state=start;
end
endmodule 


