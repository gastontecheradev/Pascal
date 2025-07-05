Program SumaElementos;
const
    N = 5;
var
    a: array[1..N] of integer;
    i, suma: integer;

begin
writeln('Ingrese 5 numeros');
for i:= 1 to N do
    read(a[i]);

suma:= 0;

for i:= 1 to N do
    suma:= suma + a[i];

write('El resultado de la suma es: ', suma);

readln
end.