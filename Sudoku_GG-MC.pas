program Sudokum;

uses
  Crt;

const
  Filas = 9;
  Columnas = 9;
  CuadranteTamano = 3;
  PistasMinimas = 20;

type
  Tablero = array[1..Filas, 1..Columnas] of Integer;
  Pistas = array[1..Filas, 1..Columnas] of Boolean;
  TableroR = array[1..Filas, 1..Columnas] of Integer;
  PistasR = array[1..Filas, 1..Columnas] of Boolean;

var
  Sudoku: Tablero;
  PistasSudoku: Pistas;
  SudokuR: TableroR;
  PistasSudokuR: PistasR;

procedure InicializarTablero(var Sudoku: Tablero);
var
  i, j: Integer;
begin
  for i := 1 to Filas do
    for j := 1 to Columnas do
      Sudoku[i, j] := 0;
end;

///////////////////////////////////////



//////////////////////////////////////

procedure MostrarTablero(Sudoku: Tablero; PistasSudoku: Pistas);
var
  i, j: Integer;
begin
  ClrScr;
  
  for i := 1 to Filas do
  begin
    for j := 1 to Columnas do
    begin
      if PistasSudoku[i, j] then
        TextColor(LightBlue)
      else if Sudoku[i, j] = 0 then
        TextColor(White)
      else
        TextColor(Yellow);
      
      write(Sudoku[i, j], ' ');
      
      if j mod CuadranteTamano = 0 then
        write(' ');
    end;
    
    writeln;
    
    if i mod CuadranteTamano = 0 then
      writeln;
  end;
  
  TextColor(White);
end;

function EsMovimientoValido(Sudoku: Tablero; fila, columna, numero: Integer): Boolean;
var
  i, j, inicioFila, inicioColumna: Integer;
begin
  for i := 1 to Columnas do
  begin
    if (Sudoku[fila, i] = numero) or (Sudoku[i, columna] = numero) then
    begin
      EsMovimientoValido := False;
      Exit;
    end;
  end;
  
  inicioFila := CuadranteTamano * ((fila - 1) div CuadranteTamano) + 1;
  inicioColumna := CuadranteTamano * ((columna - 1) div CuadranteTamano) + 1;
  
  for i := inicioFila to inicioFila + CuadranteTamano - 1 do
    for j := inicioColumna to inicioColumna + CuadranteTamano - 1 do
      if Sudoku[i, j] = numero then
      begin
        EsMovimientoValido := False;
        Exit;
      end;
  
  EsMovimientoValido := True;
end;

procedure RealizarMovimiento(var Sudoku: Tablero; fila, columna, numero: Integer);
begin
  Sudoku[fila, columna] := numero;
end;


//--Si el programa fuese un atomo, este procedimiento sería un neutrón, puro agregando peso, nada de carga util--//
procedure EliminarMovimiento(var Sudoku: Tablero; fila, columna: Integer);
begin
  Sudoku[fila, columna] := 0;
end;
//--Volvemos con las cargas de verdad... (poronga de procedimiento)--//


function TableroCompleto(Sudoku: Tablero): Boolean;
var
  i, j: Integer;
begin
  for i := 1 to Filas do
    for j := 1 to Columnas do
      if Sudoku[i, j] = 0 then
      begin
        TableroCompleto := False;
        Exit;
      end;
  
  TableroCompleto := True;
end;

function ResolverSudoku(var Sudoku: Tablero): Boolean;
var
  fila, columna, numero: Integer;
begin
  if TableroCompleto(Sudoku) then
  begin
    ResolverSudoku := True;
    Exit;
  end;
  
  for fila := 1 to Filas do
    for columna := 1 to Columnas do
      if Sudoku[fila, columna] = 0 then
      begin
        for numero := 1 to Columnas do
        begin
          if EsMovimientoValido(Sudoku, fila, columna, numero) then
          begin
            Sudoku[fila, columna] := numero;
            
            if ResolverSudoku(Sudoku) then
            begin
              ResolverSudoku := True;
              Exit;
            end;
            
            Sudoku[fila, columna] := 0;
          end;
        end;
        
        ResolverSudoku := False;
        Exit;
      end;
  
  ResolverSudoku := False;
end;

///////////////////////////////////////////////
//--Acá estoy tratando de hacer que llene él mismo los espacios de las pistas--//

function ResolverSudokuGenerado(var Sudoku: Tablero): Boolean;
var
  fila, columna, numero: Integer;
begin
  if TableroCompleto(Sudoku) then
  begin
    ResolverSudokuGenerado := True;
    Exit;
  end;
  
  for fila := 1 to Filas do
    for columna := 1 to Columnas do
      if Sudoku[fila, columna] = 0 then
      begin
        for numero := 1 to Columnas do
        begin
          if EsMovimientoValido(Sudoku, fila, columna, numero) then
          begin
            Sudoku[fila, columna] := numero;
            
            if ResolverSudokuGenerado(Sudoku) then
            begin
              ResolverSudokuGenerado := True;
              Exit;
            end;
            
            Sudoku[fila, columna] := 0;
          end;
        end;
        
        ResolverSudokuGenerado := False;
        Exit;
      end;
  
  ResolverSudokuGenerado := False;
end;

//-----------------------------------------------------------//

procedure InicializarPistas(var PistasSudoku: Pistas);
var
  i, j, PistasGeneradas, fila, columna, numero: Integer;
label
  NumeroRandom;
begin
  PistasGeneradas := 0;
  
  for i := 1 to Filas do
    for j := 1 to Columnas do
      PistasSudoku[i, j] := False;
      PistasSudokuR[i, j] := False;
  
  repeat
    i := Random(Filas) + 1;
    j := Random(Columnas) + 1;
    fila:=i;
    columna:=j;
    NumeroRandom:
    numero:=random(9)+1;
    if not EsMovimientoValido(Sudoku, fila, columna, numero) then
      begin
        goto NumeroRandom;
      end;
    Sudoku[i, j]:=numero;
    if not PistasSudoku[i, j] then
    begin
      PistasSudoku[i, j] := True;
      PistasSudokuR[i, j] := True;
      Inc(PistasGeneradas);
    end;
  until PistasGeneradas >= PistasMinimas;
  if not ResolverSudokuGenerado(SudokuR) then
    begin
      goto NumeroRandom;
    end;
end;

///////////////////////////////////////////////

procedure JugarSudoku;
var
  fila, columna, numero: Integer;
begin
  Randomize;
  writeln('Bienvenido a "TuSudoku C&G"');
  InicializarTablero(Sudoku);
  InicializarPistas(PistasSudoku);
  
  repeat
    MostrarTablero(Sudoku, PistasSudoku);
    
    repeat
      write('Ingrese la fila (1-9): ');
      readln(fila);
      write('Ingrese la columna (1-9): ');
      readln(columna);
    until (fila >= 1) and (fila <= Filas) and (columna >= 1) and (columna <= Columnas);
    
    if not PistasSudoku[fila, columna] then
    begin
      repeat
        write('Ingrese el número (1-9): ');
        readln(numero);
      until (numero >= 1) and (numero <= Columnas);
      
      if EsMovimientoValido(Sudoku, fila, columna, numero) then
        RealizarMovimiento(Sudoku, fila, columna, numero)
      else
        writeln('Movimiento inválido. Intente nuevamente.');
    end
    else
      writeln('No puede modificar una pista. Intente nuevamente.');
    
  until TableroCompleto(Sudoku);
  
  MostrarTablero(Sudoku, PistasSudoku);
  
  if ResolverSudoku(Sudoku) then
    writeln('¡Felicidades! Has resuelto el Sudoku.')
  else
  begin
    writeln('No se pudo resolver el Sudoku. La solución es:');
    MostrarTablero(Sudoku, PistasSudoku);
  end;
  
  writeln('Presione cualquier tecla para salir.');
  ReadKey;
end;

begin
  JugarSudoku;
end.