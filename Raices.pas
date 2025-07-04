Program Raices;

var
    a, b, c: integer;
    cant: integer;
    raiz1, raiz2: real;

procedure raices(a,b,c : integer; var cant : integer; var raiz1, raiz2 : real);
var
    disc, raizdisc : real;
begin
    disc := sqr(b)-4*a*c;

    if (disc = 0) then {única solucion}
    begin
        cant:=1;
        raiz1 := -b/(2*a);
    end
    else if (disc > 0) then {dos raices reales distintas}
    begin
        cant:= 2;
        raizdisc := sqrt(disc);
        raiz1 := (-b + raizdisc)/(2*a);
        raiz2 := (-b - raizdisc)/(2*a);
    end
    else {raices imaginarias}
    begin
        cant:= 0;
    end
end;

begin
    writeln('Ingrese los coeficientes a, b y c:');
    readln(a, b, c);

    raices(a, b, c, cant, raiz1, raiz2);

    case cant of
        0: writeln('No hay raices reales');
        1: writeln('Una raiz real: ', raiz1:0:2);
        2: begin
            writeln('Dos raices reales:');
            writeln('Raiz 1: ', raiz1:0:2);
            writeln('Raiz 2: ', raiz2:0:2);
        end;
    end;
    readln()
end.