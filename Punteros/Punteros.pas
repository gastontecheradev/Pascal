Program Punteros;

type
    PunteroInt = ^integer;
    PunteroChar = ^char;

var
    apun1, apun2: PunteroInt;
    apun3, apun4: PunteroChar;
begin
new(apun3);
new(apun1);
apun3^ := 'Z';
apun2 := NIL;
apun4 := NIL;
if (apun3 <> NIL) and (apun2 = NIL) then
writeln ('A');



if apun3^ = 'Z' then
writeln ('Z')
else
writeln ('X')

end.