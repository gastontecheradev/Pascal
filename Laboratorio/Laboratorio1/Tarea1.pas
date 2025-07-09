{ Extrae el último dígito de un número y lo actualiza eliminando ese dígito }
procedure siguienteDigito(var num: Natural; var digito: integer);
begin
    digito := num mod 10; // Extrae el último dígito
    num := num div 10; // Elimina el dígito del número
end;

{ Verifica si un número tiene exactamente las ocurrencias de dígitos indicadas }
function esHistogramaDe(
    c0, c1, c2, c3, c4, c5, c6, c7, c8, c9: integer;
    num: Natural
): boolean;
var
    h0, h1, h2, h3, h4, h5, h6, h7, h8, h9: integer;
    dig: integer;
begin
    { Inicializa conteos }
    h0 := 0; h1 := 0; h2 := 0; h3 := 0; h4 := 0;
    h5 := 0; h6 := 0; h7 := 0; h8 := 0; h9 := 0;

    { Recorre los dígitos usando siguienteDigito }
    while (num > 0) do
    begin
        siguienteDigito(num, dig);
        case dig of
            0: h0 := h0 + 1;
            1: h1 := h1 + 1;
            2: h2 := h2 + 1;
            3: h3 := h3 + 1;
            4: h4 := h4 + 1;
            5: h5 := h5 + 1;
            6: h6 := h6 + 1;
            7: h7 := h7 + 1;
            8: h8 := h8 + 1;
            9: h9 := h9 + 1;
        end;
        { Si en algún dígito excede la cantidad esperada, no puede ser histograma }
        if ((h0 > c0) or (h1 > c1) or (h2 > c2) or (h3 > c3) or (h4 > c4) or
            (h5 > c5) or (h6 > c6) or (h7 > c7) or (h8 > c8) or (h9 > c9)) then
        begin
            esHistogramaDe := false;
            exit;
        end;
    end;

    { Verifica la coincidencia exacta al recorrer todos los dígitos }
    esHistogramaDe :=
        (h0 = c0) and (h1 = c1) and (h2 = c2) and (h3 = c3) and (h4 = c4) and
        (h5 = c5) and (h6 = c6) and (h7 = c7) and (h8 = c8) and (h9 = c9);
end;

{ Verifica si dos números son anagramas }
function sonAnagramas(num1, num2: Natural): boolean;
var
    c0, c1, c2, c3, c4, c5, c6, c7, c8, c9: integer;
    temp: Natural;
    dig: integer;
begin
    { Construye el histograma de num1 extrayendo dígitos }
    c0 := 0; c1 := 0; c2 := 0; c3 := 0; c4 := 0;
    c5 := 0; c6 := 0; c7 := 0; c8 := 0; c9 := 0;
    temp := num1;
    while (temp > 0) do
    begin
        siguienteDigito(temp, dig);
        case dig of
            0: c0 := c0 + 1;
            1: c1 := c1 + 1;
            2: c2 := c2 + 1;
            3: c3 := c3 + 1;
            4: c4 := c4 + 1;
            5: c5 := c5 + 1;
            6: c6 := c6 + 1;
            7: c7 := c7 + 1;
            8: c8 := c8 + 1;
            9: c9 := c9 + 1;
        end;
    end;

    { Reutiliza esHistogramaDe para chequear si num2 encaja en el mismo histograma }
    sonAnagramas := esHistogramaDe(c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, num2);
end;
