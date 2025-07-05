Program Arrays;
const
    N = 5 ; {valor mayor estricto a 1}
var
    arreglo: array [1..N] of integer;
    i, menor, indice: integer;

begin
indice := 1;
for i := 2 to N do
    if arreglo[i] < indice then
        indice := i
end.