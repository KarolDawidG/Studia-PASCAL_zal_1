program CwiczenieZaliczenioweNr1;     // vol 1. na dzien 29.04.2022 r.
// Glinkowski Dawid; nr indeksu 154837;  rok akademicki: 1; wydzial: informatyka; grupa: D1, semestr: I.

procedure Poczatek;                    // Procedura przedstawia autora programu
begin
  Writeln ('Cwiczenie zaliczeniowe Nr 1 ');
  Writeln ('Autor Glinkowski Dawid; nr indeksu 154837;  rok akademicki: 1; wydzial: informatyka; grupa: D1, semestr: I. ');
  Writeln ('===========================================================================================================');
  Writeln; Writeln('Nacisnij ENTER aby rozpoczac');
  Writeln;
end;

function f(x:real):real;              // obliczanie funkcji cos(x)
begin
    f:=cos(x);
end;

procedure CzytajDaneZad2 (var a,b : double; var N : longint);
begin
writeln ('Zadanie 2. Obliczanie calki oznaczonej funkcji cos(x) metoda prostokatow, trapezow i Simpsona.');
writeln ('==============================================================================================');
repeat
write   ('Podaj wartosc krancowa "a" z przedzialu <0,PI>: ' ); readln (a);
write   ('Podaj wartosc krancowa "b" z przedzialu <0,PI>: ' ); readln (b);
if      (a < 0 )or (b > PI) then
begin
  writeln('Podane wartosci nie zawieraja sie w przedziale <0,PI>:');
  writeln('Wprowadz poprawne wartosci ! ! !');
  end;
until   (a >= 0 )and (b < PI) and (a < b) ;
write   ('Liczba podzialow N: '); readln (N);
end;

function Calkaprostok  ( a, b :double;  N : longint) : double;
var pros,dx : double;
var  i : integer;                        // funkcja liczaca calke metoda prostokatow
begin
  pros  := 0;
  dx := (b - a) / N;
  for i := 1 to N do pros := pros + f(a + i * dx);
  pros := pros * dx;
  Calkaprostok := pros;
  end;

function Calkatrapez ( a, b :double;  N : longint) : double;
 var trapez,dx : double;
var  i : integer;                       // funkcja liczaca calke metoda trapezow
begin
  trapez  := 0;
dx := (b - a) / N;
for i := 1 to N - 1 do trapez := trapez + f(a + i * dx);
trapez := (trapez + (f(a) + f(b)) / 2)* dx;
  Calkatrapez := trapez;
end;

function Sampson ( a, b :double;  N : longint) : double;
var sam, dx ,x, st : double;
var  i : integer;                    // funkcja liczaca calke metoda Simpsona
begin
  sam  := 0; st := 0;
  dx := (b - a) / N;
for i := 1 to N do
begin
  x  := a + i * dx;
  st := st + f(x - dx / 2);
  if i < N then sam := sam + f(x);
end;
sam := dx / 6 * (f(a) + f(b) + 2 * sam + 4 * st);
  Sampson := sam;
end;

procedure PiszWynikiZad2( pros , trapez, sam: double );
begin                           // procedura zwracajaca wyniki obliczen
  writeln( 'Wynik dla metody prostokatow wynosi: ',pros:10:5);
  writeln( 'Wynik dla metody trapezow wynosi:    ',trapez:10:5);
  writeln( 'Wynik dla metody Samsona wynosi:     ',sam:10:5);
  writeln( '========================================================');
  end;

procedure StartCalki;                               // procedura sterujaca
var a, b, pros , trapez, sam : double;
var N : longint;
    begin
      CzytajDaneZad2( a,b,N );
      pros:=   Calkaprostok(a,b,N);
      trapez:= Calkatrapez(a,b,N);
      sam:=    Sampson(a,b,N);
      PiszWynikiZad2(pros, trapez, sam);
      end;

  // zadanie Nr 3 oraz Nr 4

procedure CzytajDane (var a,P : double; var Eps : real; var MaxI : integer);    // procedura czytajaca dane zadania 3 i 4
begin
writeln ('Zadanie 3 i 4. Obliczanie pierwiastka liczby rzeczywistej przy pomocy algorytmu Newtona-Raphsona');
writeln ('metoda iteracyjna i rekurencyjna.');
writeln ('================================================================================================');
write   ('Podaj wartosc liczby rzeczywistej "a": ' ); readln (a);
write   ('Podaj wartosc pierwszego przyblizenia "p": ' ); readln (P);
write   ('Podaj wartosc dokladnosci - Eps: '); readln (Eps);
write   ('Podaj wartosc maksymalnej liczby iteracji - MaxI: '); readln (MaxI);
end;

function NewRap  ( a,P : double; Eps : real; MaxI : integer; var LiczbaIteracji: integer) : double;
var x1 : double;                       // Funkcja liczaca liczbe rzeczywista
begin                                 // przy pomocy algorytmu Newtona-Rapsona metoda iteracyjna.
LiczbaIteracji:=1;
 repeat
   begin
      x1:=(p+a/p)/2;
      if abs(p-x1)<=Eps then break;
      p:=x1;
      LiczbaIteracji:=LiczbaIteracji+1
   end;
   until (LiczbaIteracji>=MaxI);
   NewRap:=x1;
end;

function NewRap_rekursja ( a,P : double; Eps : real; MaxI : integer; var LiczbaIteracjiRek : longint) : double;
var
    x2: double;                           // Funkcja liczaca liczbe rzeczywista
begin                                    // przy pomocy algorytmu Newtona-Rapsona metoda rekurecyjna.
LiczbaIteracjiRek:=LiczbaIteracjiRek+1;
x2 := (p+a/p)/2;
if (LiczbaIteracjiRek >= MaxI) or (abs(p-x2)<=Eps) then
result :=x2
else
begin
       p:=x2;
       NewRap_rekursja := NewRap_rekursja(a, P, Eps, MaxI, LiczbaIteracjiRek);
end;
end;

procedure PiszWynik( a, x1, x2 : double ; LiczbaIteracji: integer; LiczbaIteracjiRek : longint );
begin                    // procedura zwracajaca wyniki obliczen
  Writeln;
  writeln( 'Wynik dla obliczen algorytmem Newtona-Rapsona iteracyjnie wynosi: ',   x1:10:5);
  Writeln ( 'Liczba Iteracji: ', LiczbaIteracji);
  Writeln ( 'Kwadrat obliczonej wartosci x*x wynosi: ', x1*x1:10:5);
  Writeln ( 'Roznica a-x*x wynosi: ', a-(x1*x1):10:5);
  writeln; writeln;
  writeln( 'Wynik dla obliczen algorytmem Newtona-Rapsona rekurencyjnie wynosi: ', x2:10:5);
  Writeln ( 'Liczba Iteracji: ', LiczbaIteracjiRek);
  Writeln ( 'Kwadrat obliczonej wartosci x*x wynosi: ', x2*x2:10:5);
  Writeln ( 'Roznica a-x*x wynosi: ', a-(x2*x2):10:5);
  end;

procedure MetodaNewtonaRapsona;           // procedura sterujaca dla algorytmow Newtona-Raphsona
var a, P, x1, x2  : double;
var Eps : real;
var MaxI : integer;
LiczbaIteracji : integer;  LiczbaIteracjiRek : longint;
    begin
      CzytajDane               (a,P, Eps, MaxI);
      x1:= NewRap              (a,P, Eps, MaxI, LiczbaIteracji);
    LiczbaIteracjiRek:=0;
      x2:= NewRap_rekursja     (a,P, Eps, MaxI, LiczbaIteracjiRek);
      PiszWynik(a, x1, x2, LiczbaIteracji, LiczbaIteracjiRek);
      end;

 //=============================================================================

begin
Poczatek;
   Writeln;                                 // glwona czesc programu
   Readln;
   StartCalki;
   Writeln; Writeln('Nacisnij ENTER aby kontynuowa');
   Readln;
MetodaNewtonaRapsona;
   Writeln; Writeln('Nacisnij ENTER aby zakonczyc');
   Readln;
end.
