Program Conjuntos;

type
    animal = (perro, gato, pez, ave);
var
    mascotasPermitidas: set of animal;
    animalIngresado: animal; 

begin
    mascotasPermitidas := [perro, gato, pez];

    write('Ingrese el animal: perro, gato, pez o ave: ');
    read(animalIngresado);

    if animalIngresado in mascotasPermitidas then
        writeln('Pecera permitida')
    else
        writeln('No se permite pez');
end.