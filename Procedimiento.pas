Program Procedimiento;
var
    primero, segundo, tercero: Integer;

Procedure corrimiento(var a, b, c: Integer);
var temp: Integer;
begin
    temp := a;
    a := b;
    b := c;
    c := temp;
end;

{ Programa principal }
begin
    writeln('Ingrese tres números');
    readln(primero, segundo, tercero);

    corrimiento(primero, segundo, tercero);

    writeln(primero, segundo, tercero);
    readln
end.
