program HelloWorld;
type onedimensional = array[0..5] of integer;
type twodimensional = array[0..5,10..12] of integer;
var sum:integer;
var oned : onedimensional;
var twod : twodimensional;
begin
oned[2]:=5;
twod[3,11]:=22;
sum:=oned[2]+twod[3,11];// at this point sum should equal 27;
end.