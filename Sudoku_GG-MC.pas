Program matrizsudoku;
uses crt;
const
	TFila=10;
	TColumna=10;
type
	TMatriz1P = Array[1..Tfila,1..TColumna] of char;
    TMatriz1S = Array[1..Tfila,1..TColumna] of char;
    TMatriz1 = Array[1..Tfila,1..TColumna] of char;

var 
    //--variables para Matriz 1--//
    Ancho,Alto:integer;
	Matriz1:Tmatriz1;
    OpcionColumna, OpcionFila:integer;
    NumeroCasilla:char;

	//--Variable para Matriz 1s--/
    Matriz1S:Tmatriz1S;


label
    EtiquetaImpresion1, EtiquetaMatriz1, EtiquetaComparador1;




procedure CrearMatriz1P;
var Ancho,Alto:integer;
	Matriz1:Tmatriz1;
    OpcionColumna, OpcionFila, NumeroCasilla:char;
begin
	for Ancho:=1 to TFila do
		begin
			for Alto:=1 to TColumna do
				begin
					Matriz1[Ancho,Alto]:=(' ');
                    Matriz1[1,2]:=('1');
                    Matriz1[1,3]:=('2');
                    Matriz1[1,4]:=('3');
                    Matriz1[1,5]:=('4');
                    Matriz1[1,6]:=('5');
                    Matriz1[1,7]:=('6');
                    Matriz1[1,8]:=('7');
                    Matriz1[1,9]:=('8');
                    Matriz1[1,10]:=('9');
                    Matriz1[2,1]:=('1');
                    Matriz1[3,1]:=('2');
                    Matriz1[4,1]:=('3');
                    Matriz1[5,1]:=('4');
                    Matriz1[6,1]:=('5');
                    Matriz1[7,1]:=('6');
                    Matriz1[8,1]:=('7');
                    Matriz1[9,1]:=('8');
                    Matriz1[10,1]:=('9'); 
                    //-----------------//
                    Matriz1[2,3]:=('7');
                    Matriz1[2,4]:=('9');
                    Matriz1[2,6]:=('8');
                    Matriz1[2,7]:=('2');
                    Matriz1[2,8]:=('6');
                    Matriz1[2,9]:=('4');
                    Matriz1[3,4]:=('6');
                    Matriz1[3,5]:=('7');
                    Matriz1[3,6]:=('3');
                    Matriz1[3,7]:=('9');
                    Matriz1[3,8]:=('2');
                    Matriz1[3,10]:=('8');
                    Matriz1[4,3]:=('2');
                    Matriz1[4,6]:=('5');
                    Matriz1[4,7]:=('4');
                    Matriz1[4,8]:=('3');
                    Matriz1[4,9]:=('9');
                    Matriz1[4,10]:=('7');
                    Matriz1[5,2]:=('9');
                    Matriz1[5,4]:=('5');
                    Matriz1[5,5]:=('2');
                    Matriz1[5,6]:=('1');
                    Matriz1[5,7]:=('3');
                    Matriz1[5,8]:=('8');
                    Matriz1[5,10]:=('4');
                    Matriz1[6,2]:=('7');
                    Matriz1[6,3]:=('8');
                    Matriz1[6,4]:=('3');
                    Matriz1[6,7]:=('6');
                    Matriz1[6,9]:=('5');
                    Matriz1[6,10]:=('2');
                    Matriz1[7,3]:=('4');
                    Matriz1[7,4]:=('1');
                    Matriz1[7,5]:=('5');
                    Matriz1[7,6]:=('7');
                    Matriz1[7,8]:=('9');
                    Matriz1[7,9]:=('6');
                    Matriz1[7,10]:=('3');
                    Matriz1[8,2]:=('6');
                    Matriz1[8,3]:=('1');
                    Matriz1[8,6]:=('4');
                    Matriz1[8,7]:=('5');
                    Matriz1[8,9]:=('3');
                    Matriz1[8,10]:=('9');
                    Matriz1[9,2]:=('8');
                    Matriz1[9,3]:=('3');
                    Matriz1[9,5]:=('9');
                    Matriz1[9,8]:=('5');
                    Matriz1[9,9]:=('2');
                    Matriz1[9,10]:=('1');
                    Matriz1[10,3]:=('9');
                    Matriz1[10,4]:=('7');
                    Matriz1[10,5]:=('3');
                    Matriz1[10,6]:=('2');
                    Matriz1[10,7]:=('1');
				end;
		end;
end;

procedure MostrarMatriz1;
var Ancho,Alto:integer;
	Matriz1:TMatriz1;
begin
	for Ancho:=1 to TFila do
		begin
			if (Ancho=1) or (Ancho=2) or (Ancho=5) or (Ancho=8) or (Ancho=11) then
				writeln('+---+-------+-------+-------+');
			for Alto:=1 to TColumna do
				begin
					if (Alto=1) or (Alto=2) or (Alto=5) or (Alto=8) or (Alto=11) then
						write('| ');
						write(Matriz1[Ancho, Alto], ' '); 
				end;
	writeln;
	end;
end;



procedure MostrarMatriz1P;
var Ancho,Alto:integer;
	Matriz1P:TMatriz1P;
begin
	for Ancho:=1 to TFila do
		begin
			if (Ancho=1) or (Ancho=2) or (Ancho=5) or (Ancho=8) or (Ancho=11) then
				writeln('+---+-------+-------+-------+');
			for Alto:=1 to TColumna do
				begin
					if (Alto=1) or (Alto=2) or (Alto=5) or (Alto=8) or (Alto=11) then
						write('| ');
						write(Matriz1P[Ancho, Alto], ' '); 
				end;
	writeln;
	end;
end;





BEGIN
    CrearMatriz1P;
    MostrarMatriz1P;
//--Area de creacion de la Matriz 1--//
for Ancho:=1 to TFila do
		begin
			for Alto:=1 to TColumna do
				begin
					Matriz1[Ancho,Alto]:=(' ');
                    Matriz1[1,2]:=('1');
                    Matriz1[1,3]:=('2');
                    Matriz1[1,4]:=('3');
                    Matriz1[1,5]:=('4');
                    Matriz1[1,6]:=('5');
                    Matriz1[1,7]:=('6');
                    Matriz1[1,8]:=('7');
                    Matriz1[1,9]:=('8');
                    Matriz1[1,10]:=('9');
                    Matriz1[2,1]:=('1');
                    Matriz1[3,1]:=('2');
                    Matriz1[4,1]:=('3');
                    Matriz1[5,1]:=('4');
                    Matriz1[6,1]:=('5');
                    Matriz1[7,1]:=('6');
                    Matriz1[8,1]:=('7');
                    Matriz1[9,1]:=('8');
                    Matriz1[10,1]:=('9'); 
                    //-----------------//
                    Matriz1[2,3]:=('7');
                    Matriz1[2,4]:=('9');
                    Matriz1[2,6]:=('8');
                    Matriz1[2,7]:=('2');
                    Matriz1[2,8]:=('6');
                    Matriz1[2,9]:=('4');
                    Matriz1[3,4]:=('6');
                    Matriz1[3,5]:=('7');
                    Matriz1[3,6]:=('3');
                    Matriz1[3,7]:=('9');
                    Matriz1[3,8]:=('2');
                    Matriz1[3,10]:=('8');
                    Matriz1[4,3]:=('2');
                    Matriz1[4,6]:=('5');
                    Matriz1[4,7]:=('4');
                    Matriz1[4,8]:=('3');
                    Matriz1[4,9]:=('9');
                    Matriz1[4,10]:=('7');
                    Matriz1[5,2]:=('9');
                    Matriz1[5,4]:=('5');
                    Matriz1[5,5]:=('2');
                    Matriz1[5,6]:=('1');
                    Matriz1[5,7]:=('3');
                    Matriz1[5,8]:=('8');
                    Matriz1[5,10]:=('4');
                    Matriz1[6,2]:=('7');
                    Matriz1[6,3]:=('8');
                    Matriz1[6,4]:=('3');
                    Matriz1[6,7]:=('6');
                    Matriz1[6,9]:=('5');
                    Matriz1[6,10]:=('2');
                    Matriz1[7,3]:=('4');
                    Matriz1[7,4]:=('1');
                    Matriz1[7,5]:=('5');
                    Matriz1[7,6]:=('7');
                    Matriz1[7,8]:=('9');
                    Matriz1[7,9]:=('6');
                    Matriz1[7,10]:=('3');
                    Matriz1[8,2]:=('6');
                    Matriz1[8,3]:=('1');
                    Matriz1[8,6]:=('4');
                    Matriz1[8,7]:=('5');
                    Matriz1[8,9]:=('3');
                    Matriz1[8,10]:=('9');
                    Matriz1[9,2]:=('8');
                    Matriz1[9,3]:=('3');
                    Matriz1[9,5]:=('9');
                    Matriz1[9,8]:=('5');
                    Matriz1[9,9]:=('2');
                    Matriz1[9,10]:=('1');
                    Matriz1[10,3]:=('9');
                    Matriz1[10,4]:=('7');
                    Matriz1[10,5]:=('3');
                    Matriz1[10,6]:=('2');
                    Matriz1[10,7]:=('1');
                    //-----------------//
                    repeat
                    EtiquetaMatriz1:
                    writeln('Elija la casilla a llenar');
                    writeln('Escriba el numero de columna');
                    readln(OpcionColumna);
                    writeln('Escriba el numero de fila');
                    readln(OpcionFila);
                    writeln('Escriba el numero que desea ingresar');
                    readln(NumeroCasilla);
                    Matriz1[OpcionFila+1,OpcionColumna+1]:=NumeroCasilla;
                    goto EtiquetaImpresion1;
                    until ((OpcionColumna>0) and (OpcionColumna<=9)) and ((OpcionFila>0) and (OpcionFila<=9)) 
				end;
		end;
//--Fin del Area de creacion de la Matriz 1--//

//--Area de impresion de Matriz 1--//
EtiquetaImpresion1:
    clrscr;
    for Ancho:=1 to TFila do
            begin
                if (Ancho=1) or (Ancho=2) or (Ancho=5) or (Ancho=8) or (Ancho=11) then
                    writeln('+---+-------+-------+-------+');
                for Alto:=1 to TColumna do
                    begin
                        if (Alto=1) or (Alto=2) or (Alto=5) or (Alto=8) or (Alto=11) then
                            write('| ');
                            textcolor(lightred);
                            write(Matriz1[Ancho, Alto], ' '); 
                            textcolor(white);
                    end;
        writeln;
        end;
        goto EtiquetaMatriz1;
//--Fin del Area de impresion de Matriz 1--//

//--Area de Creación de la Matriz 1s--//
    for Ancho:=1 to TFila do
            begin
                for Alto:=1 to TColumna do
                    begin
                        Matriz1S[Ancho,Alto]:=(' ');
                        Matriz1S[1,2]:=('1');
                        Matriz1S[1,3]:=('2');
                        Matriz1S[1,4]:=('3');
                        Matriz1S[1,5]:=('4');
                        Matriz1S[1,6]:=('5');
                        Matriz1S[1,7]:=('6');
                        Matriz1S[1,8]:=('7');
                        Matriz1S[1,9]:=('8');
                        Matriz1S[1,10]:=('9');
                        Matriz1S[2,1]:=('1');
                        Matriz1S[3,1]:=('2');
                        Matriz1S[4,1]:=('3');
                        Matriz1S[5,1]:=('4');
                        Matriz1S[6,1]:=('5');
                        Matriz1S[7,1]:=('6');
                        Matriz1S[8,1]:=('7');
                        Matriz1S[9,1]:=('8');
                        Matriz1S[10,1]:=('9');
                        Matriz1S[2,2]:=('3');
                        Matriz1S[2,3]:=('7');
                        Matriz1S[2,4]:=('9');
                        Matriz1S[2,5]:=('1');
                        Matriz1S[2,6]:=('8');
                        Matriz1S[2,7]:=('2');
                        Matriz1S[2,8]:=('6');
                        Matriz1S[2,9]:=('4');
                        Matriz1S[2,10]:=('5');
                        Matriz1S[3,2]:=('4');
                        Matriz1S[3,3]:=('5');
                        Matriz1S[3,4]:=('6');
                        Matriz1S[3,5]:=('7');
                        Matriz1S[3,6]:=('3');
                        Matriz1S[3,7]:=('9');
                        Matriz1S[3,8]:=('2');
                        Matriz1S[3,9]:=('1');
                        Matriz1S[3,10]:=('8');
                        Matriz1S[4,2]:=('1');
                        Matriz1S[4,3]:=('2');
                        Matriz1S[4,4]:=('8');
                        Matriz1S[4,5]:=('6');
                        Matriz1S[4,6]:=('5');
                        Matriz1S[4,7]:=('4');
                        Matriz1S[4,8]:=('3');
                        Matriz1S[4,9]:=('9');
                        Matriz1S[4,10]:=('7');
                        Matriz1S[5,2]:=('9');
                        Matriz1S[5,3]:=('6');
                        Matriz1S[5,4]:=('5');
                        Matriz1S[5,5]:=('2');
                        Matriz1S[5,6]:=('1');
                        Matriz1S[5,7]:=('3');
                        Matriz1S[5,8]:=('8');
                        Matriz1S[5,9]:=('7');
                        Matriz1S[5,10]:=('4');
                        Matriz1S[6,2]:=('7');
                        Matriz1S[6,3]:=('8');
                        Matriz1S[6,4]:=('3');
                        Matriz1S[6,5]:=('4');
                        Matriz1S[6,6]:=('9');
                        Matriz1S[6,7]:=('6');
                        Matriz1S[6,8]:=('1');
                        Matriz1S[6,9]:=('5');
                        Matriz1S[6,10]:=('2');
                        Matriz1S[7,2]:=('2');
                        Matriz1S[7,3]:=('4');
                        Matriz1S[7,4]:=('1');
                        Matriz1S[7,5]:=('5');
                        Matriz1S[7,6]:=('7');
                        Matriz1S[7,7]:=('8');
                        Matriz1S[7,8]:=('9');
                        Matriz1S[7,9]:=('6');
                        Matriz1S[7,10]:=('3');
                        Matriz1S[8,2]:=('6');
                        Matriz1S[8,3]:=('1');
                        Matriz1S[8,4]:=('2');
                        Matriz1S[8,5]:=('8');
                        Matriz1S[8,6]:=('4');
                        Matriz1S[8,7]:=('5');
                        Matriz1S[8,8]:=('7');
                        Matriz1S[8,9]:=('3');
                        Matriz1S[8,10]:=('9');
                        Matriz1S[9,2]:=('8');
                        Matriz1S[9,3]:=('3');
                        Matriz1S[9,4]:=('4');
                        Matriz1S[9,5]:=('9');
                        Matriz1S[9,6]:=('6');
                        Matriz1S[9,7]:=('7');
                        Matriz1S[9,8]:=('5');
                        Matriz1S[9,9]:=('2');
                        Matriz1S[9,10]:=('1');
                        Matriz1S[10,2]:=('5');
                        Matriz1S[10,3]:=('9');
                        Matriz1S[10,4]:=('7');
                        Matriz1S[10,5]:=('3');
                        Matriz1S[10,6]:=('2');
                        Matriz1S[10,7]:=('1');
                        Matriz1S[10,8]:=('4');
                        Matriz1S[10,9]:=('8');
                        Matriz1S[10,10]:=('6');
                    end;
            end;
//--Fin de area de Creación Matriz 1s--//

//--Area de Impresión Matriz 1s--//
	for Ancho:=1 to TFila do
		begin
			if (Ancho=1) or (Ancho=2) or (Ancho=5) or (Ancho=8) or (Ancho=11) then
				writeln('+---+-------+-------+-------+');
			for Alto:=1 to TColumna do
				begin
					if (Alto=1) or (Alto=2) or (Alto=5) or (Alto=8) or (Alto=11) then
						write('| ');
						write(Matriz1S[Ancho, Alto], ' '); 
				end;
	writeln;
	end;

//--Area de comparado--//
EtiquetaComparador1:
if Matriz1=Matriz1S then
    begin
        writeln('Felicidades, usted a completado el sudoku correctamente!!!');
        writeln('Presione cualquier tecla para salir');
        readln;
        exit;
    end
else 
    begin
        writeln('el sudoku está incompleto o erroneo, siga intentando');
        goto EtiquetaMatriz1;
    end;
//--Fin del Area de comparado--//



readln;
END.

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
{
    Matriz2:Tmatriz2;
    Matriz3:Tmatriz3;
    Matriz4:Tmatriz4;
    Matriz5:Tmatriz5;
    Matriz6:Tmatriz6;
    Matriz7:Tmatriz7;
    Matriz8:Tmatriz8;
    Matriz9:Tmatriz9;
A1, B1, I1, A2, B2, H2, A3, C3, C4, B4, H4, D5, E5, G5, A6, F6, C7, D7, G7, C8, E8, F8, A9, G9, H9, I9:string;
    A1:=
    B1:=
    I1:=
    A2:=
    B2:=
    H2:=
    A3:=
    C3:=
    C4:=
    B4:=
    H4:=
    D5:=
    E5:=
    G5:=
    A6:=
    F6:=
    C7:=
    D7:=
    G7:=
    C8:=
    E8:=
    F8:=
    A9:=
    G9:=
    H9:=
    I9:=
}
