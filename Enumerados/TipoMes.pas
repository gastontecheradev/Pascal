Program Mes;

type
    TipoMes = (enero, febrero, marzo, abril, mayo, junio, julio, agosto, setiembre, octubre, noviembre, diciembre);
    TipoMesRango = 1..12;
var
    mesIngresado: TipoMes;
    entrada: integer;

procedure mostrarMes(mes: tipoMes);
begin
    case mes of
       enero: writeln('Enero');
       febrero: writeln('Febrero');
       marzo: writeln('Marzo');
       abril: writeln('Abril');
       mayo: writeln('Mayo');
       junio: writeln('Junio');
       julio: writeln('Julio');
       agosto: writeln('Agosto');
       setiembre: writeln('Setiembre');
       octubre: writeln('Octubre');
       noviembre: writeln('Noviembre');
       diciembre: writeln('Diciembre');
    end
end;

begin
    repeat
        writeln('Ingrese un mes entre 1 y 12: ');
        readln(entrada);
        if (entrada < 1) or (entrada > 12) then
            writeln('Número de mes incorrecto. Intente nuevamente.');
    until (entrada >= 1) and (entrada <= 12);

    mesIngresado := TipoMes(entrada - 1);
    mostrarMes(mesIngresado);
end.