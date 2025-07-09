Program ArrayConTope;

const N = 5;

type
    ConjuntoNumeros = record
        datos: array[1..N] of integer;
        tope: 0..N;
    end;

var
    numeros: ConjuntoNumeros;
    i: integer;

begin
    numeros.datos[1] := 10;
    numeros.datos[2] := 5;
    numeros.datos[3] := 8;
    numeros.tope := 3;

    for i := 1 to numeros.tope do
        begin
            writeln('Dato ', i, ': ', numeros.datos[i]);
        end;
    readln
end.