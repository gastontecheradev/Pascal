Program Programa;

type
    vocal = (a, e, i, o, u);
var
    letra : vocal;
    uncar : char;

begin
letra := a;
writeLn('Ingrese el caracter');
while letra <= u do
begin
    read (uncar);
    writeLn ('El caracter leido es: ',
    uncar);
    letra := succ (letra)
end
end.