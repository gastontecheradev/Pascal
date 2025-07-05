Program IndiceMenor;
const N = 5;
var
    a: array[1..N] of integer;
    i, menor, indice: integer;

begin
writeln('Ingrese 5 numeros: ');

for i:= 1 to N do
    read(a[i]);

menor:= a[1];
indice:= 1;

for i:= 1 to N do
    if a[i] < menor then
    begin
        menor:= a[i];
        indice:= i;
    end;

writeln('El menor valor del array es: ', menor);
writeln('Su indice se encuentra en la posicion: ', indice)
end.