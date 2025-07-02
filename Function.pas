program Pr7Ej4;
var tum, num, temp : integer;

procedure proc(a, b : integer; var c : integer);
var aux : integer;
begin
    aux := a * b;
    aux := aux + 1;
    c := aux + a;
    writeLn(a, b, c, aux)
end;

{ Programa principal }
begin
    tum := 1;
    num := 2;
    proc(tum, num, temp);
    writeLn(temp);
    tum := 0;
    num := 1;
    proc(tum, num, temp);
    writeLn(temp);
    readLn
end.