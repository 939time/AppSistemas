function varargout = sistemas(varargin)
%% SISTEMAS MATLAB code for sistemas.fig
%      SISTEMAS, by itself, creates a new SISTEMAS or raises the existing
%      singleton*.
%
%      H = SISTEMAS returns the handle to a new SISTEMAS or the handle to
%      the existing singleton*.
%
%      SISTEMAS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SISTEMAS.M with the given input arguments.
%
%      SISTEMAS('Property','Value',...) creates a new SISTEMAS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sistemas_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sistemas_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sistemas

% Last Modified by GUIDE v2.5 31-Mar-2015 16:29:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sistemas_OpeningFcn, ...
                   'gui_OutputFcn',  @sistemas_OutputFcn, ...
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
%% End initialization code - DO NOT EDIT


% --- Executes just before sistemas is made visible.
function sistemas_OpeningFcn(hObject, eventdata, handles, varargin)
%% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sistemas (see VARARGIN)

% Choose default command line output for sistemas
handles.output = hObject;

% Logo de la app
axes(handles.logo)
imshow(imread('sistemas.jpg'))

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sistemas wait for user response (see UIRESUME)
%% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sistemas_OutputFcn(hObject, eventdata, handles) 
%% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
%%

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
%%
if get(handles.popupmenu1,'Value') == 1
    set(handles.text4,'String','Amplitude =');
elseif get(handles.popupmenu1,'Value') == 2
    set(handles.text4,'String','Amplitude =');
elseif get(handles.popupmenu1,'Value') == 3
    set(handles.text4,'String','Amplitude =') ;   
elseif get(handles.popupmenu1,'Value') == 4
    set(handles.text4,'String','Slope =');
end
%%
% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
%% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%


function vin_Callback(hObject, eventdata, handles)
%% hObject    handle to vin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vin as text
%%        str2double(get(hObject,'String')) returns contents of vin as a double


% --- Executes during object creation, after setting all properties.
function vin_CreateFcn(hObject, eventdata, handles)
%% hObject    handle to vin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%


function ain_Callback(hObject, eventdata, handles)
%% hObject    handle to ain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ain as text
%%        str2double(get(hObject,'String')) returns contents of ain as a double


% --- Executes during object creation, after setting all properties.
function ain_CreateFcn(hObject, eventdata, handles)
%% hObject    handle to ain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
%%
switch get(handles.popupmenu1,'Value')
    case 2
        vectorImpulse=get(handles.vin,'String');
        vectorImpulse=str2double(vectorImpulse);
        amplitudeImpulse=get(handles.ain,'String');
        amplitudeImpulse=str2double(amplitudeImpulse);
        timeImpulse=0:vectorImpulse;
        inputImpulse=[amplitudeImpulse zeros(1,vectorImpulse)];
        plot(handles.pin,timeImpulse,inputImpulse,'o')
        title(handles.pin,'Impulse')
        xlabel(handles.pin,'Time (seconds)')
        ylabel(handles.pin,'Amplitude')
        assignin('base', 'timeImpulse', timeImpulse);
        assignin('base', 'inputImpulse', inputImpulse);
    case 3
        vectorStep=get(handles.vin,'String');
        vectorStep=str2double(vectorStep);
        amplitudeStep=get(handles.ain,'String');
        amplitudeStep=str2double(amplitudeStep);
        timeStep=0:vectorStep-1;
        inputStep=ones(1,vectorStep);
        inputStep=amplitudeStep*inputStep;
        plot(handles.pin,timeStep,inputStep,'o')
        title(handles.pin,'Step')
        xlabel(handles.pin,'Time (seconds)')
        ylabel(handles.pin,'Amplitude')
        assignin('base', 'timeStep', timeStep);
        assignin('base', 'inputStep', inputStep);
    case 4
        vectorRamp=get(handles.vin,'String');
        vectorRamp=str2double(vectorRamp);
        scopeRamp=get(handles.ain,'String');
        scopeRamp=str2double(scopeRamp);
        timeRamp=0:vectorRamp;
        inputRamp=scopeRamp*timeRamp;
        plot(handles.pin,timeRamp,inputRamp,'o')
        title(handles.pin,'Ramp')
        xlabel(handles.pin,'Time (seconds)')
        ylabel(handles.pin,'Amplitude')
         assignin('base', 'timeRamp', timeRamp);
        assignin('base', 'inputRamp', inputRamp);
end
%%

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
%% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
%% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% Hint: get(hObject,'Value') returns toggle state of radiobutton2



function edit3_Callback(hObject, eventdata, handles)
%% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
%% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%


function edit4_Callback(hObject, eventdata, handles)
%% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
%% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%


function edit5_Callback(hObject, eventdata, handles)
%% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
%% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%


function edit6_Callback(hObject, eventdata, handles)
%% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
%% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
%% Continuous system
if get(handles.radiobutton1,'Value') == 1
    if get(handles.radiobutton3,'Value') == 1
        % tf method
        N=get(handles.edit3,'String');
        N=str2num(N);
        D=get(handles.edit4,'String');
        D=str2num(D);
        Gs=tf(N,D);
        assignin('base', 'Gs', Gs);
        GsE=evalc('Gs');
        set(handles.text9,'String',GsE);
    elseif get(handles.radiobutton4,'Value') == 1
        % zpk method
        Z=get(handles.edit3,'String');
        Z=str2num(Z);
        P=get(handles.edit4,'String');
        P=str2num(P);
        K=get(handles.edit5,'String');
        K=str2num(K);
        Gs=zpk(Z,P,K);
        assignin('base', 'Gs', Gs);
        GsE=evalc('Gs');
        set(handles.text9,'String',GsE);
    elseif get(handles.radiobutton5,'Value') == 1
        % Direct method
        s=tf('s');
        %TODO
    end
% Discrete system    
else
    if get(handles.radiobutton3,'Value') == 1
        % tf method
        N=get(handles.edit3,'String');
        N=str2num(N);
        D=get(handles.edit4,'String');
        D=str2num(D);
        Ts=get(handles.edit6,'String');
        Ts=str2num(Ts);
        Gz=tf(N,D,Ts);
        assignin('base', 'Gz', Gz);
        GzE=evalc('Gz');
        set(handles.text9,'String',GzE);
    elseif get(handles.radiobutton4,'Value') == 1
        % zpk method
        Z=get(handles.edit3,'String');
        Z=str2num(Z);
        P=get(handles.edit4,'String');
        P=str2num(P);
        K=get(handles.edit5,'String');
        K=str2num(K);
        Ts=get(handles.edit6,'String');
        Ts=str2num(Ts);
        Gs=zpk(Z,P,K,Ts);
        assignin('base', 'Gs', Gs);
        GsE=evalc('Gs');
        set(handles.text9,'String',GsE);
    elseif get(handles.radiobutton5,'Value') == 1
        % Direct method
        Ts=get(handles.edit6,'String');
        Ts=str2num(Ts);
        z=tf('z',Ts);
        %TODO
    else
        % filt method
        N=get(handles.edit3,'String');
        N=str2num(N);
        D=get(handles.edit4,'String');
        D=str2num(D);
        Ts=get(handles.edit6,'String');
        Ts=str2num(Ts);
        Gz=filt(N,D,Ts);
        assignin('base', 'Gz', Gz);
        GzE=evalc('Gz');
        set(handles.text9,'String',GzE);
    end
end
%%

% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
%%
if get(handles.radiobutton1,'Value') == 1
    set(handles.text8,'Visible','off');
    set(handles.edit6,'Visible','off');
    set(handles.radiobutton6,'Visible','off');
else
    set(handles.text8,'Visible','on');
    set(handles.edit6,'Visible','on');
    set(handles.radiobutton6,'Visible','on');
end
%%

% --- Executes when selected object is changed in uibuttongroup2.
function uibuttongroup2_SelectionChangedFcn(hObject, eventdata, handles)
%%
if get(handles.radiobutton3,'Value') == 1
    set(handles.text5,'String','Numerator =');
    set(handles.text6,'String','Denominator =');
    set(handles.text7,'Visible','off');
    set(handles.edit5,'Visible','off');
elseif get(handles.radiobutton4,'Value') == 1
    set(handles.text5,'String','Zeros =');
    set(handles.text6,'String','Poles =');
    set(handles.text7,'Visible','on');
    set(handles.edit5,'Visible','on');
elseif get(handles.radiobutton5,'Value') == 1
    set(handles.text5,'String','Numerator =');
    set(handles.text6,'String','Denominator =');
    set(handles.text7,'Visible','off');
    set(handles.edit5,'Visible','off');
else
    set(handles.text7,'Visible','off');
    set(handles.edit5,'Visible','off');
end
%%


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
%% Input
switch get(handles.popupmenu1,'Value')
    case 2
        V=get(handles.vin,'String');
        V=str2double(V);
        A=get(handles.ain,'String');
        A=str2double(A);
        T=0:V;
        I=[A zeros(1,V)];
    case 3
        V=get(handles.vin,'String');
        V=str2double(V);
        A=get(handles.ain,'String');
        A=str2double(A);
        T=0:V-1;
        I=ones(1,V);
        I=A*I;
    case 4
        V=get(handles.vin,'String');
        V=str2double(V);
        A=get(handles.ain,'String');
        A=str2double(A);
        T=0:V;
        I=A*T;
end
%% Transfer function 
%% Continuous system
if get(handles.radiobutton1,'Value') == 1
    if get(handles.radiobutton3,'Value') == 1
        % tf method
        N=get(handles.edit3,'String');
        N=str2num(N);
        D=get(handles.edit4,'String');
        D=str2num(D);
        Gs=tf(N,D);
    else
        msgbox('Please use "tf" format for the transfer function', 'Help','help');
    end
% Discrete system    
else
    if get(handles.radiobutton3,'Value') == 1
        % tf method
        N=get(handles.edit3,'String');
        N=str2num(N);
        D=get(handles.edit4,'String');
        D=str2num(D);
        Ts=get(handles.edit6,'String');
        Ts=str2num(Ts);
        Gz=tf(N,D,Ts);
    else
        msgbox('Please use "tf" format for the transfer function', 'Help','help');
    end
end
%% Response
if get(handles.popupmenu2,'Value') == 2
    % Input response
    if get(handles.radiobutton1,'Value') == 1
        lsim(handles.pout,Gs,I,T)
        title(handles.pout,'Response')
        xlabel(handles.pout,'Time (seconds)')
        ylabel(handles.pout,'Amplitude')
        
    else
        Y=filter(N,D,I);
        plot(handles.pout,T,I,'bo',T,Y,'r-')
        title(handles.pout,'Response')
        xlabel(handles.pout,'Time (seconds)')
        ylabel(handles.pout,'Amplitude')
    end
elseif get(handles.popupmenu2,'Value') == 3
    % Root locus
    % TODO
elseif get(handles.popupmenu2,'Value') == 4
    % Bode diagram
    % TODO
end

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
