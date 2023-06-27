program Sudokum;
uses
  Crt;
const
  Filas = 9;
  Columnas = 9;
  CuadranteTamano = 3;
  PistasDificil = 17;
  PistasNormal = 22;
  PistasFacil = 32;
type
  Tablero = array[1..Filas, 1..Columnas] of Integer;
  Pistas = array[1..Filas, 1..Columnas] of Boolean;
  TableroR = array[1..Filas, 1..Columnas] of Integer;
  PistasR = array[1..Filas, 1..Columnas] of Boolean;
  TableroFinal = array[1..Filas, 1..Columnas] of Integer;
  PistasFinal = array[1..Filas, 1..Columnas] of Boolean;
var
  Sudoku: Tablero;
  PistasSudoku: Pistas;
  SudokuR: TableroR;
  PistasSudokuR: PistasR;
  SudokuFinal: TableroFinal;
  PistasSudokuFinal: PistasFinal;
  NickName: string;
procedure InicializarTablero(var Sudoku: Tablero);
var
  i, j: Integer;
begin
  for i := 1 to Filas do
    for j := 1 to Columnas do
      Sudoku[i, j] := 0;
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

//----------------------------------------------------------------------------------------//

procedure MostrarTablero(Sudoku: Tablero; PistasSudoku: Pistas; NickName: string);
var
  i, j: Integer;
begin
  ClrScr;
  writeln('|=================================================|');
  writeln('|Hola, ', NickName, '. Este es tu sudoku asignado:|');
  writeln('|=================================================|');
  writeln;
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
//----------------------------------------------------------------------------------------//


//--Función nueva que aun no se utilizar bien xd--//

procedure BorrarValoresIngresados(var Sudoku: Tablero; PistasSudoku: Pistas);
var
  i, j: Integer;
begin
  for i := 1 to Filas do
    for j := 1 to Columnas do
      if not PistasSudoku[i, j] then
        begin
          Sudoku[i, j] := 0;
        end;
end;

//--Fin de Función nueva que aun no se utilizar bien xd--//

procedure RealizarMovimiento(var Sudoku: Tablero; fila, columna, numero: Integer);
begin
  Sudoku[fila, columna] := numero;
end;

//--Si el programa fuese un atomo, este procedimiento sería un neutrón, puro agregando peso, nada de carga util, porque puedes cambiar el dato y ya, pero la comodidad mató al humano--//
procedure EliminarMovimiento(var Sudoku: Tablero; fila, columna: Integer; NickName: string);
var numero: shortint;
begin
  {textcolor(white);
  Sudoku[fila, columna] := 0;
  numero:=0;}
  numero:=0;
  RealizarMovimiento(Sudoku, fila, columna, numero);
  MostrarTablero(Sudoku, PistasSudoku, NickName);
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
function ResolverSudoku(var SudokuR: TableroR): Boolean;
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
function ResolverSudokuGenerado(var SudokuR: TableroR): Boolean;
var
  fila, columna, numero: Integer;
begin
  if TableroCompleto(SudokuR) then
  begin
    ResolverSudokuGenerado := True;
    Exit;
  end;
  for fila := 1 to Filas do
    for columna := 1 to Columnas do
      if SudokuR[fila, columna] = 0 then
      begin
        for numero := 1 to Columnas do
        begin
          if EsMovimientoValido(SudokuR, fila, columna, numero) then
          begin
            SudokuR[fila, columna] := numero;
            
            if ResolverSudokuGenerado(SudokuR) then
            begin
              ResolverSudokuGenerado := True;
              Exit;
            end;
            SudokuR[fila, columna] := 0;
          end;
        end;
        ResolverSudokuGenerado := False;
        Exit;
      end;
  ResolverSudokuGenerado := False;
end;
//-----------------------------------------------------------//
function SudokuUnico(var Sudoku: Tablero): Boolean;
var
  CopiaSudoku: Tablero;
begin
  CopiaSudoku := Sudoku;
  SudokuUnico := ResolverSudokuGenerado(Sudoku);
end;
//-------------------------------------------------------//
procedure MostrarTableroFinal(SudokuFinal: TableroFinal; PistasSudokuFinal: PistasFinal);
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


//-------------------------------------------------------//
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
    if not ResolverSudokuGenerado(SudokuR) then
      begin
        goto NumeroRandom;
      end;
  until (PistasGeneradas >= PistasDificil) and SudokuUnico(SudokuR);
  if not ResolverSudokuGenerado(SudokuR) then
      begin
        goto NumeroRandom;
      end;
end;
procedure JugarSudoku;
var
  fila, columna, numero: Integer;
  Opcion1, Opcion2: shortint;
label
  EtiquetaInicio, EtiquetaSudoku, EtiquetaIngresar, EtiquetaRendirse, EtiquetaAccion;
begin
  Randomize;
  EtiquetaInicio:
  textcolor(lightcyan);
  writeln('=====================================');
  writeln('|   Bienvenido al "TuSudoku C&G"    |');
  writeln('=====================================');
  Writeln('|        Ingrese su NickName        |');
  writeln('=====================================');
  write('NickName:');
  readln(NickName);
  repeat
  clrscr;
  writeln('===============================================================================');
  writeln('|                          Bienvenido al "TuSudoku C&G"                       |');
  writeln('===============================================================================');
  Writeln('|                             Que accion desea tomar?                         |');
  writeln('===============================================================================');
  writeln('|    1-Generar Sudoku         2-Ensename a usar "TuSudoku"             3-Salir|');
  writeln('===============================================================================');
  readln(Opcion1);
  PistasSudokuFinal:=PistasSudokuR;
  
  case Opcion1 of
    1:begin
        goto EtiquetaSudoku;
      end;
    2:begin
		//--Inicio del area de Manual del Usuario--//
		clrscr;
					writeln('|=================================================================|');
					writeln('|                      Bienvenido a TUSUDOKU                      |');
					writeln('|                   A continuacion, recibira las                  |');
					writeln('| Instrucciones para poder utilizar el programa de forma correcta |');
					writeln('|=================================================================|');
					writeln('   ');
					writeln('Presione una tecla para continuar');
					readln;
					
					writeln('|==============================|');
					writeln('|      MANUAL DE USUARIO:      |');
					writeln('|==============================|');
					
					writeln('   ');
					
					writeln('|==================================================|');
					writeln('|1.Al entrar en el programa, tendra 3 opciones:    |');
					writeln('|  A. Generar Sudoku                               |');
					writeln('|  B. Ensename a usar TUSUDOKU                     |');
					writeln('|  C. Salir                                        |');
					writeln('|==================================================|');

					writeln('   ');

					writeln('|=================================================================|');
					writeln('|2.Generar Sudoku:                                                |');
					writeln('|  Esta opcion le permite generar un nuevo Sudoku para resolver.  |'); 
					writeln('|  El programa generara un Sudoku aleatorio con una               |'); 
					writeln('|  combinacion unica de pistas predefinidas.                      |'); 
					writeln('|=================================================================|');

					writeln('   ');
					
					writeln('Presione una tecla para continuar');
					readln;


					writeln('|=================================================================|');
					writeln('|3. Ensename a usar TUSUDOKU:                                     |');
					writeln('|  Esta seccion le proporcionara una guia detallada sobre como    |');
					writeln('|  utilizar el programa TUSUDOKU. Aprendera como ingresar         |');
					writeln('|  los valores en el tablero, como verificar la validez de su     |'); 
					writeln('|  solucion y como usar las funciones adicionales disponibles.    |');
					writeln('|=================================================================|');
					
					writeln('   ');
					
					writeln('|======================================|');
					writeln('|4. Salir:                             |');
					writeln('|   Utilice esta opcion para cerrar el |'); 
					writeln('|   programa TUSUDOKU en su totalidad. |');
					writeln('|======================================|');
					
					writeln('   ');
					
					writeln('A continuacion, se presentaran las instrucciones sobre como utilizar el apartado de'); 
					writeln('''Utilizar Sudoku''');
					writeln('   ');
					
					writeln('Presione una tecla para continuar');
					readln;
					
					writeln('   ');
					
					writeln('A continuacion se presentan las instrucciones para rellenar el tablero:');
					
					writeln('');
					writeln('|===================================================================================================================|');
					writeln('|1. El tablero de Sudoku consta de una cuadricula de 9x9 casillas, dividida en                                      |');
					writeln('|   9 subcuadriculas mas pequenas de 3x3.                                                                           |');
					writeln('|                                                                                                                   |');
					writeln('|2. Para rellenar el tablero, debe ingresar los valores del 1 al 9 en las casillas vacias.                          |');
					writeln('|   Utilice la siguiente notacion:                                                                                  |');
					writeln('|   - Ingrese el numero deseado en la casilla correspondiente.                                                      |');
					writeln('|   - Si necesita borrar un valor ingresado previamente, utilice la opcion "Quitar valor".                          |');
					writeln('|                                                                                                                   |');
					writeln('|3. Puede comenzar a rellenar las casillas vacias de izquierda a derecha y de arriba a abajo, o                     |');
					writeln('|   en el orden que prefiera                                                                                        |');
					writeln('|                                                                                                                   |');
					writeln('|4. Asegurese de cumplir con las siguientes reglas al ingresar los valores:                                         |');
					writeln('|                                                                                                                   |');
					writeln('|   - Cada fila debe contener todos los numeros del 1 al 9, sin repetir ninguno.                                    |');
					writeln('|   - Cada columna debe contener todos los numeros del 1 al 9, sin repetir ninguno.                                 |');
					writeln('|   - Cada subcuadricula de 3x3 debe contener todos los numeros del 1 al 9, sin repetir ninguno.                    |');
					writeln('|                                                                                                                   |');
					writeln('|5. Tenga en cuenta que el programa generara un Sudoku con una combinacion unica de pistas predefinidas.            |'); 
					writeln('|No podra cambiar ni borrar estas pistas.                                                                           |');
					writeln('|                                                                                                                   |');
					writeln('|6. Una vez que haya ingresado todos los valores en el tablero, puede seleccionar la opcion "Resolver Sudoku"       |'); 
					writeln('|para que el programa intente resolverlo y mostrar el resultado.                                                    |');
					writeln('|                                                                                                                   |');
					writeln('|===================================================================================================================|');
					writeln('');
					writeln('Disfrute resolviendo Sudokus con TUSUDOKU!');
					writeln('');
					writeln('Presione una tecla para continuar y regresar al menu principal');
					readln;
        //--Fin del Area del Manual del Usuario--//
      end;
    3:begin
        exit 
      end;
      
      else
      begin
		writeln('La opcion ingresada no es valida');
		end;
  end;
  until opcion1=3;
  EtiquetaSudoku:
  InicializarTablero(Sudoku);
  InicializarPistas(PistasSudoku);
  repeat
    MostrarTablero(Sudoku, PistasSudoku, NickName);
    repeat
      EtiquetaAccion:
      textcolor(lightcyan);
      writeln('================================================================');
      Writeln('|                    Que accion desea tomar?                   |');
      writeln('================================================================');
      writeln('|1-Ingresar un dato   2-Eliminar un dato   3-Rendirse   4-Salir|');
      writeln('================================================================');
      write('Opcion: ');
      readln(Opcion2);
      case Opcion2 of
        1:begin
            goto EtiquetaIngresar;
          end;
        2:begin
            write('Ingrese la fila (1-9): ');
            readln(fila);
            write('Ingrese la columna (1-9): ');
            readln(columna);
            EliminarMovimiento(Sudoku, fila, columna, NickName);
          end;
        3:begin
            goto EtiquetaRendirse;
          end;
        4:begin
          exit;
        end;
      else
      begin
		writeln('Accion ingresada invalida, selecciona una de las opciones correspondientes');
		readln;
          goto EtiquetaAccion;
        end;
      end;
      EtiquetaIngresar:
      write('Ingrese la fila (1-9): ');
      readln(fila);
      write('Ingrese la columna (1-9): ');
      readln(columna);
    until (fila >= 1) and (fila <= Filas) and (columna >= 1) and (columna <= Columnas);
    if not PistasSudoku[fila, columna] then
    begin
      repeat
        write('Ingrese el numero (1-9): ');
        readln(numero);
      until (numero >= 1) and (numero <= Columnas);
      if EsMovimientoValido(Sudoku, fila, columna, numero) then
        RealizarMovimiento(Sudoku, fila, columna, numero)
      else
        begin
          MostrarTablero(Sudoku, PistasSudoku, NickName);
          textcolor(LightRed);
          writeln('|==============================================|');
          writeln('|    Movimiento invalido. Intente nuevamente   |');
          writeln('|==============================================|');
          textcolor(lightcyan);
          goto EtiquetaAccion;
        end;
    end
    else
      begin
        writeln('No puede modificar una pista. Intente nuevamente.');
      end;
  until TableroCompleto(Sudoku);
  MostrarTablero(Sudoku, PistasSudoku, NickName);
  if ResolverSudoku(Sudoku) then
    begin
		textcolor(lightgreen);
	  writeln('|==============================================|');
      writeln('|Felicidades, ', NickName, '! Has resuelto el Sudoku.');
      writeln('|==============================================|');
    end;
    
    
  EtiquetaRendirse:
  textcolor(lightred);
   writeln('|==============================================|');
   writeln('|No se pudo resolver el Sudoku. La solucion es:|');
   writeln('|       Presione cualquier tecla para ver      |');
   writeln('|==============================================|');
  readln;
  BorrarValoresIngresados(Sudoku, PistasSudoku);
  ResolverSudoku(Sudoku);
  MostrarTableroFinal(Sudoku, PistasSudoku);
  textcolor(lightcyan);
  writeln('|====================================|');
  writeln('|Presione cualquier tecla para salir.|');
  writeln('|                                    |');
  writeln('|  No te rindas, tu puedes hacerlo!  |');
  writeln('|====================================|');
  ReadKey;
end;
BEGIN
  NickName:=' ';
  JugarSudoku;
END.
//Made by: GG & MC//
