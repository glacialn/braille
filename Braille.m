function varargout = Braille(varargin)
% BRAILLE MATLAB code for Braille.fig
%      BRAILLE, by itself, creates a new BRAILLE or raises the existing
%      singleton*.
%
%      H = BRAILLE returns the handle to a new BRAILLE or the handle to
%      the existing singleton*.
%
%      BRAILLE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BRAILLE.M with the given input arguments.
%
%      BRAILLE('Property','Value',...) creates a new BRAILLE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Braille_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Braille_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Braille

% Last Modified by GUIDE v2.5 16-Jun-2018 15:48:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Braille_OpeningFcn, ...
                   'gui_OutputFcn',  @Braille_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Braille is made visible.
function Braille_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Braille (see VARARGIN)

% Choose default command line output for Braille
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Braille wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Braille_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
global im im2 aa
[path, user_cance]=imgetfile();
if user_cance
    msgbox(sprintf('Error'),'Error','Error');
    return
end
im=imread(path);

axes(handles.axes1);
imshow(im);
L2=rgb2gray(im);
aa= L2<200;

% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global aa;

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
%identyfikacja
nowy=aa;
L3= nowy;
rozmiar=size(L3);
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
    if isequal(ilekropek,scalonamacierz(1:6)); 
    %porównanie czy macierze s¹ równe, nie GDZIE s¹ równe
    wynik =i(1)
end

 %czy inne
 for k=1:24
    if isequal(ilekropek,scalonamacierz((k*6+1):(k*6+6)));
    %porównanie czy macierze s¹ równe, nie GDZIE s¹ równe
    wynik=i(k+1)
    end
 end
 
set(handles.literka, 'String', wynik); %pokazuje wynik ropoznania
