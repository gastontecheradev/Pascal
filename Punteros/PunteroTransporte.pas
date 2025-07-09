program ProgramaPunteroTransporte;

type
  TipoVehiculo = (barco, camion);

  PunteroTransporte = ^Transporte;

  Transporte = record
    capacidad: integer;
    case vehiculo: TipoVehiculo of
      barco: (habitaciones: integer);
      camion: ();  
  end;

var
  a, b, c: PunteroTransporte;

begin
  new(a);
  a^.capacidad := 30;
  a^.vehiculo := barco;
  a^.habitaciones := 4;

  new(b);
  b^.capacidad := 5;
  b^.vehiculo := camion;

  new(c);
  c^.capacidad := 5;
  c^.vehiculo := camion;
  readln()
end.
