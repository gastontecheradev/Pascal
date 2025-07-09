Program Registros;

type Alumno = record
        edad: integer;
        nota: integer;
    end;

var
    a: Alumno;

begin
    a.edad:= 20;
    a.nota:= 9;

    writeln('Edad: ', a.edad);
    writeln('Nota: ', a.nota);
end.