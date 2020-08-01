module digi_clock(clk_inbuilt,D_M1,D_M2,D_H1,D_H2,set,reset);
  input clk_inbuilt;
  output reg [6:0] D_M2,D_M1,D_H1,D_H2;
  reg [1:0] H1;
  reg [1:0] H2;
  reg [2:0] M1;
  reg [3:0] M2;
  input reset;
  input [3:0] set;
  reg clk_1hz,clk_m1,clk_m2,clk_h1,clk_h2;
  initial
    begin
      M1=0;
      M2=0;
      H1=0;
      H2=0;
    end
  reg[27:0] counter1, counter2,counter3,counter4,counter5;
  always @(posedge clk_inbuilt,reset)
    begin
      if(reset)
        begin
          clk_1hz<=0;
          counter1<=0;
        end
      else
        begin counter1<=counter1+1;
          if(counter1==27'd5000000)
            begin
              counter1<=0;
              clk_1hz<=~clk_1hz;
            end
        end
    end

    always @(posedge clk_1hz,reset)
    begin
      if(reset)
        begin
          clk_m2<=0;
          counter2<=0;
        end
      else
       begin 
            if(!set[0])
            begin
               counter2<=counter2+1;
             if(counter2==27'd30)
               begin
                counter2<=0;
                clk_m2<=~clk_m2;
               end
           end
           else
            begin
               clkm_2<=~clk_m2;
               counter2<=0;
            end
        end
    end

    always @(posedge clk_1hz,reset)
    begin
      if(reset)
        begin
          clk_m1<=0;
          counter4<=0;
        end
      else
       begin 
            if(!set[1])
            begin
               counter4<=counter4+1;
             if(counter4==27'd300)
               begin
                counter4<=0;
                clk_m1<=~clk_m1;
               end
           end
           else
            begin
               clkm_1<=~clk_m1;
               counter4<=0;
            end
        end
    end

always @(posedge clk_1hz,reset)
    begin
      if(reset)
        begin
          clk_h2<=0;
          counter3<=0;
        end
      else
        begin 
            if(!set[2])
            begin
               counter3<=counter3+1;
             if(counter3==27'd1800)
               begin
                counter3<=0;
                clk_h2<=~clk_h2;
               end
           end
           else
            begin
               clkh_2<=~clk_h2;
               counter3<=0;
            end
        end
    end


    always @(posedge clk_1hz,reset)
    begin
      if(reset)
        begin
          clk_h1<=0;
          counter5<=0;
        end
      else
        begin 
            if(!set[3])
            begin
               counter5<=counter5+1;
             if(counter5==27'd18000)
               begin
                counter5<=0;
                clk_h1<=~clk_h1;
               end
           end
           else
            begin
               clkh_1<=~clk_h1;
               counter5<=0;
            end
        end
    end

  always @ (posedge clk_m2)
    begin
        if(M2==4'b1001)
	  M2<=0;
        else
	  M2<=M2+1;
    end

  always @ (posedge clk_m1)
    begin
      if(M1==3'b101)
        M1<=0;
      else
        M1<=M1+1;
    end

  always @ (posedge clk_h2)
    begin
      if(H2==2'b11)
        H2<=0;
      else
        H2<=H2+1;
    end

  always @ (posedge clk_h1)
    begin
      if(H1==2'b10)
        H1<=0;
      else
        H1<=H1+1;
    end


  always @ (M2)
    begin
      case(M2)
          4'b0000: D_M2=7'b1111110;
          4'b0001: D_M2=7'b0110000;
          4'b0010: D_M2=7'b1101101;
          4'b0011: D_M2=7'b1111001;
          4'b0100: D_M2=7'b0110011;
          4'b0101: D_M2=7'b1011011;
          4'b0110: D_M2=7'b1011111;
          4'b0111: D_M2=7'b1110000;
          4'b1000: D_M2=7'b1111111;
          4'b1001: D_M2=7'b1111011;
          default: D_M2=7'b0000000;
        endcase
    end
  always @ (M1)
    begin
      case(M1)
          3'b000: D_M1=7'b1111110;
          3'b001: D_M1=7'b0110000;
          3'b010: D_M1=7'b1101101;
          3'b011: D_M1=7'b1111001;
          3'b100: D_M1=7'b0110011;
          3'b101: D_M1=7'b1011011;
          default: D_M1=7'b0000000;
        endcase
    end
  always @ (H2)
    begin
      case(H2)
          2'b00: D_H2=7'b1111110;
          2'b01: D_H2=7'b0110000;
          2'b10: D_H2=7'b1101101;
          2'b11: D_H2=7'b1111001;
          default: D_H2=7'b0000000;
        endcase
    end
  always @ (H1)
    begin
      case(H1)
          2'b00: D_H1=7'b1111110;
          2'b01: D_H1=7'b0110000;
          2'b10: D_H1=7'b1101101;
          default: D_H1=7'b0000000;
        endcase
    end



endmodule
