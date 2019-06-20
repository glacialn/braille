close all
clear all

%WZORCE LITEREK
A=[1 0 0 0 0 0];
B=[1 1 0 0 0 0];
C=[1 0 0 0 0 1];
D=[1 0 0 0 1 1];
E=[1 0 0 0 1 0];
F=[1 1 0 0 0 1];
G=[1 1 0 0 1 1];
H=[1 1 0 0 1 0];
I=[0 1 0 0 0 1];
J=[0 1 0 0 1 1];
K=[1 0 1 0 0 0];
L=[1 1 1 0 0 0];
M=[1 0 1 0 0 1];
N=[1 0 1 0 1 1];
O=[1 0 1 0 1 0];
P=[1 1 1 0 0 1];
Q=[1 1 1 0 1 1];
R=[1 1 1 0 1 0];
S=[0 1 1 0 0 1];
T=[0 1 1 0 1 1];
U=[1 0 1 1 0 0];
V=[1 1 1 1 0 0];
W=[0 1 0 1 1 1];
X=[1 0 1 1 0 1];
Y=[1 0 1 1 1 1];
Z=[1 0 1 1 1 0];

%KOD

L1=imread('T.png'); %wczytanie naszego obrazka z literk¹

imshow(L1);
L2=rgb2gray(L1);
L3= L2<200;
ob=bweuler(L3);

rozmiar=size(L1);
wierszy = rozmiar(:,1);
kolumn = rozmiar(:,2);
ilekropek=[0 0 0 0 0 0];

%dzielimy obraz na 6 czêœci i sprawdzamy czy w danym obszarze jest 
%kropka -1 , nie ma - 0
a=round(0.33*wierszy);
b=round(0.66*wierszy);
c=round(0.5*kolumn);

wycietaczesc=L3(1:a,1:c);
ilekropek(1,1) = bweuler(wycietaczesc);

wycietaczesc=L3(a:b,1:c);
ilekropek(1,2) = bweuler(wycietaczesc);
   
wycietaczesc=L3(b:wierszy,1:c);
ilekropek(1,3) = bweuler(wycietaczesc);

wycietaczesc=L3(b:wierszy,c:kolumn);
ilekropek(1,4) = bweuler(wycietaczesc);

wycietaczesc=L3(a:b,c:kolumn);
ilekropek(1,5) = bweuler(wycietaczesc);

wycietaczesc=L3(1:a,c:kolumn);
ilekropek(1,6) = bweuler(wycietaczesc);

%Porównanie ze wzorcami
i=['A'; 'B'; 'C'; 'D'; 'E'; 'F'; 'G'; 'H'; 'I'; 'J'; 'K'; 'L'; 'M'; 'N'; 'O'; 'P'; 'Q'; 'R'; 'S'; 'T'; 'U'; 'V'; 'W'; 'X'; 'Y'; 'Z'];
scalonamacierz=[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z];

%czy A
k=1;
if isequal(ilekropek,scalonamacierz(1:6)); %porównanie czy macierze s¹ równe, nie GDZIE s¹ równe
wynik=i(1)
end

 %czy inne
 for k=1:24
if isequal(ilekropek,scalonamacierz((k*6+1):(k*6+6))); %porównanie czy macierze s¹ równe, nie GDZIE s¹ równe
wynik=i(k+1)
end
end
'Dziekujemy :)'