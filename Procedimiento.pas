Program Procedimiento;
var
    primero, segundo, tercero: Integer;

Procedure corrimiento(a, b, c: Integer);
begin
    primero := c;
    segundo := a;
    tercero := b;
end;

{ Programa principal }
begin
    writeln('Ingrese tres números');
    readln(primero, segundo, tercero);

    corrimiento(primero, segundo, tercero);

    writeln(primero, segundo, tercero);
    readln
end.
