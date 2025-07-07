procedure leerMes(var mes: TipoMes);
var numeroMes: TipoMesRango;
begin
    writeln('Ingrese un mes entre 1 y 12: ');
    readln(numeroMes);
    mes:= TipoMes(numeroMes - 1)
end;