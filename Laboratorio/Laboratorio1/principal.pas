program Anagramas;

{ Con esta directiva queda incluido el archivo definiciones.pas }
{$INCLUDE definiciones.pas}
{ Con esta directiva queda incluido el archivo tarea1.pas }
{$INCLUDE tarea1.pas}

var
    num1, num2 : Natural;
	opcion, digito, c0, c1, c2, c3, c4, c5, c6, c7, c8, c9 : Integer;
begin
	repeat
		writeln('--------------------------------');
		writeln('Ingrese Opcion');
		writeln('--------------------------------');
		writeln('0=Fin');
		writeln('1=Extraer ultimo digito');
		writeln('2=Chequear histograma');
		writeln('3=Chequear anagramas');
		writeln('--------------------------------');
		readln(opcion);

		case opcion of
			0 : writeln('Ejecucion finalizada.');

			{ Extraer ultimo digito }
			1:	begin
					writeln('Ingrese un numero: ');
					readln(num1);
					siguienteDigito(num1, digito);
					writeln('Ultimo digito: ', digito:0);
					writeln('Numero sin el ultimo digito: ', num1:0)
				end;
			
			{ Chequear histograma }
			2:	begin
					writeln('Ingrese la cantidad de ocurrencias de cada uno de los siguentes digitos');
					writeln('0 1 2 3 4 5 6 7 8 9:');
					readln(c0, c1, c2, c3, c4, c5, c6, c7, c8, c9);
					writeln('Ingrese el numero a evaluar: ');
					readln(num1);

					if esHistogramaDe(c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, num1) then
						writeln('Es histograma.')
					else
						writeln('No es histograma.')

				end;

			{ Chequear anagramas }
			3:	begin
					writeln('Ingrese dos numeros: ');
					readln(num1, num2);

					if SonAnagramas(num1, num2) then
						writeln('Son anagramas.')
					else
						writeln('No son anagramas.')
				end;
			
			else writeln ('Opcion inexistente.')
		end;
	until opcion = 0;
end.
