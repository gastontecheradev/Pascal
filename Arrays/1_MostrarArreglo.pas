Program MostrarArreglo;
const
    N = 5;
var
    a: array[1..N] of integer;
    i: integer;
begin
    writeln('Ingrese 5 numeros:');

    for i := 1 to N do
        read(a[i]);

    for i:= 1 to N do
        write(a[i], ' ');
    readln
end.