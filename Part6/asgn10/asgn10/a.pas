program exProcedure;
var
   x,y,sum: integer;
   A: double;
procedure SumAvg(P1,P2:integer; var Avg:double);
var s:integer;
begin
s:=P1+P2;
sum:=s;
Avg:=sum/2;
end;
begin
x:=5;
y:=7;
SumAvg(x,y,A);
end. 
