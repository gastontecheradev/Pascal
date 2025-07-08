Program Enumerados;

type
    Semaforo = (rojo, amarillo, verde);
var
    luz: Semaforo;
begin
    write('Ingrese uno de los siguientes: rojo, amarillo, verde');
    read(luz);

    case luz of
        rojo: writeln('Detenerse');
        amarillo: writeln('Precaución');
        verde: writeln('Avanzar');
    end;
end.