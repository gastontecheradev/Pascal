Program MayorValor;
const
    N = 5;
var
    a: array[1..N] of integer;
    i, mayor: integer;

begin
writeln('Ingrese 5 numeros:');

for i:= 1 to N do
    read(a[i]);

mayor:= a[1];

for i:= 2 to N do
    if a[i] > mayor then
        mayor:= a[i];

writeln('El mayor valor del arreglo es :', mayor);

readln
end.