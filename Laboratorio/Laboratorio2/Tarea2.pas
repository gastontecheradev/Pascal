procedure calcularHistograma(pal : Palabra; var hist : Histograma);
{ Retorna en `hist` el histograma de `pal`, la cantidad de ocurrencias
  de cada letra.  Se inicializa el arreglo antes de contar. }
var
  c : Letra;
  i : integer;
begin
  {1. Inicializar todos los contadores a 0}
  for c := 'a' to 'z' do
    hist[c] := 0;

  {2. Recorrer la palabra y acumular}
  for i := 1 to pal.tope do
    hist[pal.cadena[i]] := hist[pal.cadena[i]] + 1;
end;



function iguales(pal1, pal2 : Palabra) : boolean;
{ Verifica si dos palabras tienen la misma longitud y las mismas letras
en el mismo orden. }
var
  i : integer;
begin
  if pal1.tope <> pal2.tope then
  begin
    iguales := false;
    exit;
  end;

  for i := 1 to pal1.tope do
    if pal1.cadena[i] <> pal2.cadena[i] then
    begin
      iguales := false;
      exit;
    end;
  iguales := true;
end;



procedure calcularHistogramaTexto(tex : Texto; var hist : Histograma);
{ Acumula las frecuencias de todas las palabras del texto `tex`. }
var
  tmp : Histograma;
  it  : Texto;
  c   : Letra;
begin
  {1. Limpiar hist}
  for c := 'a' to 'z' do
    hist[c] := 0;

  {2. Recorrer lista}
  it := tex;
  while it <> nil do
  begin
    calcularHistograma(it^.info, tmp);
    for c := 'a' to 'z' do
      hist[c] := hist[c] + tmp[c];
    it := it^.sig;
  end;
end;



function esPalabraValida(pal : Palabra; dicc : Texto) : boolean;
{ Devuelve true si `pal` aparece en el diccionario `dicc`. }
var
  it : Texto;
begin
  it := dicc;
  while it <> nil do
  begin
    if iguales(pal, it^.info) then
    begin
      esPalabraValida := true;
      exit;
    end;
    it := it^.sig;
  end;
  esPalabraValida := false;
end;


procedure removerLetraAtril(var mano : Atril; let : char);
{ Elimina la primera aparición de `let` en el atril intercambiándola con
  la última letra y decrementando el tope. }
var
  i : integer;
begin
  i := 1;
  {Buscar primera coincidencia}
  while (i <= mano.tope) and (mano.letras[i] <> let) do
    i := i + 1;

  if i <= mano.tope then
  begin
    mano.letras[i] := mano.letras[mano.tope]; {swap}
    mano.tope := mano.tope - 1;
  end;
end;


function entraEnTablero(pal : Palabra; pos : Posicion) : boolean;
{ Verifica que la palabra no se salga de los límites dados por
  MAXFILAS ('A'..'I') y MAXCOLUMNAS (1..9). }
var
  finCol : integer;
  finFil : char;
begin
  if pos.direccion = Horizontal then
  begin
    finCol := pos.col + pal.tope - 1;
    entraEnTablero := finCol <= MAXCOLUMNAS;
  end
  else {Vertical}
  begin
    finFil := chr(ord(pos.fila) + pal.tope - 1);
    entraEnTablero := finFil <= MAXFILAS;
  end;
end;



procedure siguientePosicion(var pos : Posicion);
{ Avanza al siguiente casillero en la dirección indicada. }
begin
  if pos.direccion = Horizontal then
    pos.col := pos.col + 1
  else
    pos.fila := succ(pos.fila);
end;


function puedeArmarPalabra(pal : Palabra; pos : Posicion;
                          mano : Atril; tab : Tablero) : boolean;
{ Comprueba que, a partir de `pos`, la palabra puede formarse respetando
  las letras ya presentes y las disponibles en el atril. }
var
  tempPos : Posicion;
  copia   : Atril;
  i, j    : integer;
begin
  copia   := mano;           {copia para no modificar la real}
  tempPos := pos;

  for i := 1 to pal.tope do
  begin
    if tab[tempPos.fila, tempPos.col].ocupada then
    begin
      {Debe coincidir con la letra existente}
      if tab[tempPos.fila, tempPos.col].ficha <> pal.cadena[i] then
      begin
        puedeArmarPalabra := false;
        exit;
      end;
    end
    else
    begin
      {Necesita ficha del atril}
      j := 1;
      while (j <= copia.tope) and (copia.letras[j] <> pal.cadena[i]) do
        j := j + 1;
      if j > copia.tope then
      begin
        puedeArmarPalabra := false;
        exit;
      end
      else
      begin
        copia.letras[j] := copia.letras[copia.tope];
        copia.tope      := copia.tope - 1;
      end;
    end;
    siguientePosicion(tempPos);
  end;
  puedeArmarPalabra := true;
end;



procedure intentarArmarPalabra(pal : Palabra; pos : Posicion;
                              var tab : Tablero; var mano : Atril;
                              dicc : Texto; info : InfoFichas;
                              var resu : ResultadoJugada);
{ Límites, fichas, diccionario, actualización de
  tablero, mano y cálculo de puntaje. }
var
  tempPos    : Posicion;
  i          : integer;
  letraScore : integer;
  wordScore  : integer;
  hayTriple  : boolean;
  celda      : Casillero;
begin
  {Guardar referencia de palabra y posición}
  resu.palabra := pal;
  resu.pos     := pos;

  {1. ¿Cabe en el tablero?}
  if not entraEnTablero(pal, pos) then
  begin
    resu.tipo := NoEntra;
    exit;
  end;

  {2. ¿Hay fichas suficientes / coincide con tablero?}
  if not puedeArmarPalabra(pal, pos, mano, tab) then
  begin
    resu.tipo := NoFichas;
    exit;
  end;

  {3. ¿Existe en el diccionario?}
  if not esPalabraValida(pal, dicc) then
  begin
    resu.tipo := NoExiste;
    exit;
  end;

  {4. Ejecutar la jugada}
  wordScore := 0;
  hayTriple := false;
  tempPos   := pos;

  for i := 1 to pal.tope do
  begin
    celda := tab[tempPos.fila, tempPos.col];

    if not celda.ocupada then
    begin
      {Consumir ficha del atril}
      removerLetraAtril(mano, pal.cadena[i]);

      {Puntaje base de la letra}
      letraScore := info[pal.cadena[i]].puntaje;

      {Aplicar bono de casillero}
      case celda.bonus of
        DobleLetra   : letraScore := letraScore * 2;
        Trampa       : letraScore := -letraScore;
        TriplePalabra: hayTriple  := true;
      end;

      wordScore := wordScore + letraScore;

      {Colocar la letra en el tablero}
      tab[tempPos.fila, tempPos.col].ficha   := pal.cadena[i];
      tab[tempPos.fila, tempPos.col].ocupada := true;
    end;

    siguientePosicion(tempPos);
  end;

  if hayTriple then
    wordScore := wordScore * 3;

  resu.tipo    := Valida;
  resu.puntaje := wordScore;
end;



procedure registrarJugada(var jugadas : HistorialJugadas;
                          pal : Palabra; pos : Posicion;
                          puntaje : integer);
{ Inserta la jugada al final de la lista de historial. }
var
  nuevo, it : HistorialJugadas;
begin
  new(nuevo);
  nuevo^.palabra := pal;
  nuevo^.pos     := pos;
  nuevo^.puntaje := puntaje;
  nuevo^.sig     := nil;

  if jugadas = nil then
    jugadas := nuevo
  else
  begin
    it := jugadas;
    while it^.sig <> nil do
      it := it^.sig;
    it^.sig := nuevo;
  end;
end;