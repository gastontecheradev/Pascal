Program Pascal;
Var
  inicio, valor, k: Integer;
  Begin
inicio := 1; valor := inicio;
For k := inicio to 3 do
Begin
   valor := valor + 2;
   write (k, ' ', inicio, ' ', valor)
End;
End.