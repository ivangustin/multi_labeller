function varargout = Simulador_Multilabeler(varargin)
% SIMULADOR_MULTILABELER MATLAB code for Simulador_Multilabeler.fig
%      SIMULADOR_MULTILABELER, by itself, creates a new SIMULADOR_MULTILABELER or raises the existing
%      singleton*.
%
%      H = SIMULADOR_MULTILABELER returns the handle to a new SIMULADOR_MULTILABELER or the handle to
%      the existing singleton*.
%
%      SIMULADOR_MULTILABELER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIMULADOR_MULTILABELER.M with the given input arguments.
%
%      SIMULADOR_MULTILABELER('Property','Value',...) creates a new SIMULADOR_MULTILABELER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Simulador_Multilabeler_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Simulador_Multilabeler_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Simulador_Multilabeler

% Last Modified by GUIDE v2.5 27-Oct-2016 20:29:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Simulador_Multilabeler_OpeningFcn, ...
                   'gui_OutputFcn',  @Simulador_Multilabeler_OutputFcn, ...
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


% --- Executes just before Simulador_Multilabeler is made visible.
function Simulador_Multilabeler_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Simulador_Multilabeler (see VARARGIN)

% Choose default command line output for Simulador_Multilabeler
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% clear all;
global v_ini
v_ini = 20;
A = 0.4;
sen = -A*sin(0:0.01:pi)+0.7;
% figure(1)
% plot(sen);
itv = length(sen)/5;
vecte = 0:itv:itv*5;
vecf(1)= 1;vecf(2)= vecte(2);vecf(3)= 150;vecf(4)= vecte(5);vecf(5)= vecte(6);
sen = sen*100;
uvec = [sen(vecf(1)) sen(vecf(2)) sen(vecf(3)) sen(vecf(4)) sen(vecf(1))];
% vnorm = norm(uvec);
% vfin = uvec/vnorm;
% vfin = vfin/sum(vfin)
vfin = (uvec/sum(uvec))*100;

set(handles.w1_t,'String',roundn(vfin(1),-1));
set(handles.w2_t,'String',roundn(vfin(2),-1));
set(handles.w3_t,'String',roundn(vfin(3),-1));
set(handles.w4_t,'String',roundn(vfin(4),-1));
set(handles.w5_t,'String',roundn(vfin(5),-1));
set(handles.w1,'value',roundn(vfin(1),-1));
set(handles.w2,'value',roundn(vfin(2),-1));
set(handles.w3,'value',roundn(vfin(3),-1));
set(handles.w4,'value',roundn(vfin(4),-1));
set(handles.w5,'value',roundn(vfin(5),-1));
set(handles.Manual,'Value',0);
set(handles.Kernel,'Value',0);
set(handles.Gaussian,'Value',0);
set(handles.Mean,'Value',0);
set(handles.Vote,'Value',0);



% UIWAIT makes Simulador_Multilabeler wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Simulador_Multilabeler_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function tyt_Callback(hObject, eventdata, handles)
% hObject    handle to tyt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tyt as text
%        str2double(get(hObject,'String')) returns contents of tyt as a double
global tt
tt = str2num(get(handles.tyt,'string'));

% --- Executes during object creation, after setting all properties.
function tyt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tyt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function w1_Callback(hObject, eventdata, handles)
% hObject    handle to w1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global w1
w1 = get(handles.w1,'value');

% --- Executes during object creation, after setting all properties.
function w1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
global v_ini
set(hObject,'Value',v_ini);

% --- Executes on slider movement.
function w2_Callback(hObject, eventdata, handles)
% hObject    handle to w2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global w2
w2 = get(handles.w2,'value');

% --- Executes during object creation, after setting all properties.
function w2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
global v_ini
set(hObject,'Value',v_ini);


% --- Executes on slider movement.
function w3_Callback(hObject, eventdata, handles)
% hObject    handle to w3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global w3
w3 = get(handles.w3,'value');

% --- Executes during object creation, after setting all properties.
function w3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
global v_ini
set(hObject,'Value',v_ini);

% --- Executes on slider movement.
function w4_Callback(hObject, eventdata, handles)
% hObject    handle to w4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global w4
w4 = get(handles.w4,'value');

% --- Executes during object creation, after setting all properties.
function w4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
global v_ini
set(hObject,'Value',v_ini);

% --- Executes on slider movement.
function w5_Callback(hObject, eventdata, handles)
% hObject    handle to w5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global w5
w5 = get(handles.w5,'value');

% --- Executes during object creation, after setting all properties.
function w5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
global v_ini
set(hObject,'Value',v_ini);

% --- Executes on button press in c1.
function c1_Callback(hObject, eventdata, handles)
% hObject    handle to c1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of c1
global c1
c1 = get(handles.c1,'Value');

% --- Executes on button press in c2.
function c2_Callback(hObject, eventdata, handles)
% hObject    handle to c2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of c2
global c2
c2 = get(handles.c1,'Value');

% --- Executes on button press in c3.
function c3_Callback(hObject, eventdata, handles)
% hObject    handle to c3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of c3
global c3
c3 = get(handles.c1,'Value');

% --- Executes on button press in c4.
function c4_Callback(hObject, eventdata, handles)
% hObject    handle to c4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of c4
global c4
c4 = get(handles.c1,'Value');

% --- Executes on button press in c5.
function c5_Callback(hObject, eventdata, handles)
% hObject    handle to c5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of c5
global c5
c5 = get(handles.c1,'Value');

% --- Executes on selection change in Datasets.
function Datasets_Callback(hObject, eventdata, handles)
% hObject    handle to Datasets (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Datasets contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Datasets
global tt X y dat_v yc
dat_v = get(handles.Datasets,'Value');
switch dat_v
    case 1
        disp(0);
    case 2        
        set(handles.tyt,'string',num2str([20 20 20]));
        set(handles.Feat,'string',num2str([3 4]));
        load fisheriris
        X       = meas;
        [yc,~,y] = unique(species);
        helpdlg({'This is perhaps the best known database to be found in the pattern recognition literature. Fishers paper is a classic in the field and is referenced frequently to this day.' ' ' '- Data Set Characteristics: Multivariate' '- Number of Elements: 150' '- Number of Attributes: 4' '- Number of Classes: 3'...
            '' 'For more information, you can go to next url: https://archive.ics.uci.edu/ml/datasets/Iris'},...
            'Iris Plants Database');
    case 3        
        set(handles.tyt,'string',num2str([20 20]));
        set(handles.Feat,'string',num2str([10 11]));
%         if length(tt)>2
%             tt(3)=[];
%         end
        load ionosphere
        [yc,~,y] = unique(Y);
        helpdlg({'This radar data was collected by a system in Goose Bay, Labrador. This system consists of a phased array of 16 high-frequency antennas with a total transmitted power on the order of 6.4 kilowatts. See the paper for more details. The targets were free electrons in the ionosphere. "Good" radar returns are those showing evidence of some type of structure in the ionosphere. "Bad" returns are those that do not; their signals pass through the ionosphere.' ' ' '- Data Set Characteristics: Multivariate' '- Number of Elements: 351' '- Number of Attributes: 34' '- Number of Classes: 2'...
            '' 'For more information, you can go to next url: https://archive.ics.uci.edu/ml/datasets/Ionosphere'},...
            'Johns Hopkins University Ionosphere database');
    case 4        
        set(handles.tyt,'string',num2str([20 20 20 20 20 20 20 20]));
        set(handles.Feat,'string',num2str([1 6]));%[1 6][1 7]
        filename = 'C:\Users\IVAN\Documents\Ivan Gustin\Tesis\Interfaz_Multilabeller\Datasets\ecoli.data';
        delimiter = ' ';
        formatSpec = '%s%f%f%f%f%f%f%f%s%[^\n\r]';
        fileID = fopen(filename,'r');
        dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true,  'ReturnOnError', false);
        X = [];
%         y = [];
%         yc = [];
%         clearvars -global
        for i=2:8
            X(:,i-1) = dataArray{:,i};%336 8c
        end
        [yc,~,y] = unique(dataArray{:,9});

        helpdlg({'This data contains protein localization sites Creator and Maintainer: Kenta Nakai Institue of Molecular and Cellular Biology Osaka, University ' ' ' '- Data Set Characteristics: Multivariate' '- Number of Elements: 336' '- Number of Attributes: 7' '- Number of Classes: 8'...
            '' 'For more information, you can go to next url: https://archive.ics.uci.edu/ml/datasets/Ecoli'},...
            'Protein Localization Sites');
%         clearvars filename delimiter formatSpec fileID dataArray ans;
    case 5
        set(handles.tyt,'string',num2str([20 20]));
        set(handles.Feat,'string',num2str([1 2]));
        load hospital
        hos = struct(hospital);
        X = hos.data{6};%Blood Pressure
        X(:,3) = hos.data{3};%Age
        X(:,4) = hos.data{4};%Weight
        y = double(hos.data{5});
        [yc,~,y] = unique(hos.data{5});
        helpdlg({'This database recreates a set of people in a hospital at that age he recorded his weight and blood pressure was also register if they were smokers..' ' ' '- Data Set Characteristics: Multivariate' '- Number of Elements: 100' '- Number of Attributes: 4' '- Number of Classes: 2'...
            },...
            'Smokers Dataset');
    case 6
        set(handles.tyt,'string',num2str([20 20]));
        set(handles.Feat,'string',num2str([1 2]));
        filename = 'C:\Users\IVAN\Documents\Ivan Gustin\Tesis\Interfaz_Multilabeller\Datasets\bupa.data';
        delimiter = ',';
        formatSpec = '%f%f%f%f%f%f%f%[^\n\r]';
        fileID = fopen(filename,'r');
        dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter,  'ReturnOnError', false);
        fclose(fileID);
        X = [];
%         y = [];
%         yc = [];
%         clearvars -global
        for i=1:6
            X(:,i) = dataArray{:,i};%345 2c
        end
        [yc,~,y] = unique(dataArray{:,7});
        helpdlg({'This data contains protein localization sites Creator and Maintainer: Kenta Nakai Institue of Molecular and Cellular Biology Osaka, University ' ' ' '- Data Set Characteristics: Multivariate' '- Number of Elements: 345' '- Number of Attributes: 6' '- Number of Classes: 2'...
            '' 'For more information, you can go to next url: https://archive.ics.uci.edu/ml/datasets/Ecoli'},...
            'Bupa Data');
        clearvars filename delimiter formatSpec fileID dataArray ans;
    case 7
        set(handles.tyt,'string',num2str([20 20 20 20 20 20 20 20 20 20 20 20 20]));
        set(handles.Feat,'string',num2str([227 228]));
        load arrhythmia
        [yc,~,y] = unique(Y);
        helpdlg({'This database contains 279 attributes, 206 of which are linear valued and the rest are nominal. Concerning the study of H. Altay Guvenir: "The aim is to distinguish between the presence and absence of cardiac arrhythmia and to classify it in one of the 16 groups. Class 01 refers to "normal" ECG classes 02 to 15 refers to different classes of arrhythmia and class 16 refers to the rest of unclassified ones.' ' ' '- Data Set Characteristics: Multivariate' '- Number of Elements: 452' '- Number of Attributes: 279' '- Number of Classes: 16'...
            '' 'For more information, you can go to next url: https://archive.ics.uci.edu/ml/datasets/Arrhythmia'},...
            'Cardiac Arrhythmia Database');
end



% --- Executes during object creation, after setting all properties.
function Datasets_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Datasets (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Feat_Callback(hObject, eventdata, handles)
% hObject    handle to Feat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Feat as text
%        str2double(get(hObject,'String')) returns contents of Feat as a double


% --- Executes during object creation, after setting all properties.
function Feat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Feat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in Help.
function Help_Callback(hObject, eventdata, handles)
% hObject    handle to Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
url = 'https://sites.google.com/site/multipleexpertssimulator/';
web(url,'-browser')

% --- Executes on button press in About.
function About_Callback(hObject, eventdata, handles)
% hObject    handle to About (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({' ' 'Designed by: Ivan D. Gustin' '                      M. Bolaños-Ledezma' ' ' 'Directed by: Diego H. Peluffo Ordoñez' ' ' '                  Nariño University' '                  Pasto - Colombia' '' '        Email: Ivandgustin@gmail.com' '' '                           Beta'},...
            'About of');
        
% --- Executes on button press in Manu.
function Manu_Callback(hObject, eventdata, handles)
% hObject    handle to Manu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
url = 'https://1drv.ms/b/s!AgiCRNhXoo9FrlEb7nid-Z0K1bMD';
web(url,'-browser')
        
% --- Executes on button press in Mean.
function Mean_Callback(hObject, eventdata, handles)
% hObject    handle to Mean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Mean
global itr X y indc W1 CC1 CC2 CC3 CC4 CC5 nevalD tt
disp('mean')
tt = str2num(get(handles.tyt,'string'));
if get(handles.Manual,'Value') == 1 || get(handles.Kernel,'Value') == 1 || get(handles.Gaussian,'Value') == 1
    h1 = waitbar(0,'Performing mapping Please wait ...');
    Niter = itr;
    iter_i=1;    
    for ip1=1:itr
        for ip=1:nevalD
            W1{ip1,ip} = set(W1{ip1,ip},'user',[]);
        end
    end    
    waitbar(0.2);
    Af = prdataset(X(:,indc),y);
    waitbar(0.3);
    [Cf,Df] = gendat(Af,tt); % Training and test dataset
    W1f = svc(Cf,proxm('e',0.9));%
    waitbar(0.4);
    CC4 = meanc([W1{:}]);
    waitbar(0.6);
    [E(1,:) F1(1,:)] = testc(Df,CC4);
    set(handles.E_mean,'String',roundn(E*100,-2));
    waitbar(0.9);    
    axes(handles.axes1);
    if get(handles.Manual,'Value') == 1
        if get(handles.Vote,'Value') == 1 && get(handles.Mean,'Value') == 1
            waitbar(0.99);
            plotc({CC1,CC4,CC5});
        else if get(handles.Mean,'Value') == 1
                waitbar(0.99);
                plotc({CC1,CC4});
            end
        end
        if get(handles.Mean,'Value') == 0 && get(handles.Vote,'Value') == 0
            cla reset
            gscatter(X(:,indc(1)),X(:,indc(2)),y,'brm','+*o');
            plotc({CC1});
        else if get(handles.Mean,'Value') == 0 && get(handles.Vote,'Value') == 1
                cla reset
                gscatter(X(:,indc(1)),X(:,indc(2)),y,'brm','+*o');
                plotc({CC1,CC5});
            end
        end
    else if get(handles.Kernel,'Value') == 1
            if get(handles.Vote,'Value') == 1 && get(handles.Mean,'Value') == 1
                waitbar(0.99);
                plotc({CC2,CC4,CC5});
            else if get(handles.Mean,'Value') == 1
                    waitbar(0.99);
                    plotc({CC2,CC4});
                end
            end
            if get(handles.Mean,'Value') == 0 && get(handles.Vote,'Value') == 0
                cla reset
                gscatter(X(:,indc(1)),X(:,indc(2)),y,'brm','+*o');
                plotc({CC2});
            else if get(handles.Mean,'Value') == 0 && get(handles.Vote,'Value') == 1
                    cla reset
                    gscatter(X(:,indc(1)),X(:,indc(2)),y,'brm','+*o');
                    plotc({CC2,CC5});
                end
            end
        else
            if get(handles.Vote,'Value') == 1 && get(handles.Mean,'Value') == 1
                waitbar(0.99);
                plotc({CC3,CC4,CC5});
            else if get(handles.Mean,'Value') == 1
                    waitbar(0.99);
                    plotc({CC3,CC4});
                end
            end
            if get(handles.Mean,'Value') == 0 && get(handles.Vote,'Value') == 0
                cla reset
                gscatter(X(:,indc(1)),X(:,indc(2)),y,'brm','+*o');
                plotc({CC3});
            else if get(handles.Mean,'Value') == 0 && get(handles.Vote,'Value') == 1
                    cla reset
                    gscatter(X(:,indc(1)),X(:,indc(2)),y,'brm','+*o');
                    plotc({CC3,CC5});
                end
            end            
        end
    end
    close(h1)
    % plotc({CC4},'b-');
    % title(handles.axes1,'Mapping','FontSize',10,'FontWeight','Bold');
else
    helpdlg('First must choose a weight method');
    set(handles.Mean,'Value',0);
end

% --- Executes on button press in Vote.
function Vote_Callback(hObject, eventdata, handles)
% hObject    handle to Vote (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Vote
global itr X y indc W1 CC1 CC2 CC3 nevalD CC4 CC5 tt
disp('vote')
tt = str2num(get(handles.tyt,'string'));
if get(handles.Manual,'Value') == 1 || get(handles.Kernel,'Value') == 1 || get(handles.Gaussian,'Value') == 1
    h1 = waitbar(0,'Performing mapping Please wait ...');
    Niter = itr;
    iter_i=1;    
    for ip1=1:itr
        for ip=1:nevalD
            W1{ip1,ip} = set(W1{ip1,ip},'user',[]);
        end
    end    
    waitbar(0.2);
    Af = prdataset(X(:,indc),y);
    waitbar(0.3);
    [Cf,Df] = gendat(Af,tt); % Training and test dataset
    W1f = svc(Cf,proxm('e',0.9));%
    waitbar(0.4);
    CC5 = votec([W1{:}]);
    waitbar(0.6);
    [E(1,:) F1(1,:)] = testc(Df,CC5);
    set(handles.E_vote,'String',roundn(E*100,-2));
    waitbar(0.9);
    axes(handles.axes1);
    if get(handles.Manual,'Value') == 1
        if get(handles.Vote,'Value') == 1 && get(handles.Mean,'Value') == 1
            waitbar(0.99);
            plotc({CC1,CC4,CC5});
        else if get(handles.Vote,'Value') == 1
                waitbar(0.99);
                plotc({CC1,CC5});
            end
        end
        if get(handles.Mean,'Value') == 0 && get(handles.Vote,'Value') == 0
            cla reset
            gscatter(X(:,indc(1)),X(:,indc(2)),y,'brm','+*o');
            plotc({CC1});
        else if get(handles.Mean,'Value') == 1 && get(handles.Vote,'Value') == 0
                cla reset
                gscatter(X(:,indc(1)),X(:,indc(2)),y,'brm','+*o');
                plotc({CC1,CC4});
            end
        end
    else if get(handles.Kernel,'Value') == 1
            if get(handles.Vote,'Value') == 1 && get(handles.Mean,'Value') == 1
                waitbar(0.99);
                plotc({CC2,CC4,CC5});
            else if get(handles.Vote,'Value') == 1
                    waitbar(0.99);
                    plotc({CC2,CC5});
                end
            end
            if get(handles.Mean,'Value') == 0 && get(handles.Vote,'Value') == 0
                cla reset
                gscatter(X(:,indc(1)),X(:,indc(2)),y,'brm','+*o');
                plotc({CC2});
            else if get(handles.Mean,'Value') == 1 && get(handles.Vote,'Value') == 0
                    cla reset
                    gscatter(X(:,indc(1)),X(:,indc(2)),y,'brm','+*o');
                    plotc({CC2,CC4});
                end
            end
        else
            if get(handles.Vote,'Value') == 1 && get(handles.Mean,'Value') == 1
                waitbar(0.99);
                plotc({CC3,CC4,CC5});
            else if get(handles.Vote,'Value') == 1
                    waitbar(0.99);
                    plotc({CC3,CC5});
                end
            end
            if get(handles.Mean,'Value') == 0 && get(handles.Vote,'Value') == 0
                cla reset
                gscatter(X(:,indc(1)),X(:,indc(2)),y,'brm','+*o');
                plotc({CC3});
            else if get(handles.Mean,'Value') == 1 && get(handles.Vote,'Value') == 0
                    cla reset
                    gscatter(X(:,indc(1)),X(:,indc(2)),y,'brm','+*o');
                    plotc({CC3,CC4});
                end
            end
        end
    end
    close(h1)
    % plotc({CC4},'b-');    
    % title(handles.axes1,'Mapping','FontSize',10,'FontWeight','Bold');
else
    helpdlg('First must choose a weight method');
    set(handles.Vote,'Value',0);
end


% --- Executes on button press in Data.
function Data_Callback(hObject, eventdata, handles)
% hObject    handle to Data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global nevalD yev indc N X y W1 itr Cf Df tt dat_v yc
% dat_v = get(handles.Datasets,'Value');
tt = str2num(get(handles.tyt,'string'));
indc = str2num(get(handles.Feat,'string'));

if dat_v == 2 || dat_v == 3 || dat_v == 4 || dat_v == 5 || dat_v == 6 || dat_v == 7
    N = size(X,1);
%     indc = [3 4];
    
    %Multi-Labellers
    nevalD = 4;                %Numero De Evaluadores
    % nume = round(100/nevalD);  %Numero de procentaje de error
    per = [5 70 80 90 100]%[0 60 80 90 100];    
    nevalD = nevalD+1;
    yev = repmat(y,1,nevalD); %Vector de evaluadores incorrupto, clases numericas
%     yet = repmat(species,1,nevalD); %Vector de evaluadores incorrupto, etiquetas
    i=0;
    pos=0;pos2=0;
    h2 = waitbar(0,'Loading Data Please wait ...');
    waitbar(0.1)
    twb = 0;
    for i=1:nevalD
        pos = randperm(N,round((per(i)/100)*N));pos=pos';
        pos2 = randperm(N,round((per(i)/100)*N));pos2=pos2';
        for i1=1:length(pos)
            yevtem(pos(i1),i) = yev(pos(i1),i);
            yev(pos(i1),i) = yev(pos2(i1),i);
            yev(pos2(i1),i) = yevtem(pos(i1),i);
            
%             yettem(pos(i1),i) = yet(pos(i1),i);
%             yet(pos(i1),i) = yet(pos2(i1),i);
%             yet(pos2(i1),i) = yettem(pos(i1),i);
        end
        twb = twb + 0.1;
        waitbar(0.1+twb)
    end
    for i2=1:nevalD
        A{1,i2} = prdataset(X(:,indc),yev(:,i2));%data structure
    end
    
    itr = 1;
    Niter = itr;
    iter_i=1;
    twb = 0;
    for iter_2=1:nevalD
        for iter = iter_i:Niter
            [C{1,iter_2},D{1,iter_2}] = gendat(A{1,iter_2},tt); % Training and test dataset
            W1{iter,iter_2} = svc(C{1,iter_2},proxm('e',0.9));%exponential varias iteraciones p=0.6 p=0.9
        end
        w1_svc(:,iter_2) = testc(A{1}*W1(:,iter_2));
        twb = twb + 0.05;
        waitbar(0.7+twb)
    end
    Af = prdataset(X(:,indc),y);
    [Cf,Df] = gendat(Af,tt); % Training and test dataset
    axes(handles.axes1);
    gscatter(X(:,indc(1)),X(:,indc(2)),y,'brmygck','+*odxsph^<>.');
    waitbar(0.99);
    close(h2)
    helpdlg('Data is loaded Successfully','Message');
end



% --- Executes on button press in Manu.
function Manual_Callback(hObject, eventdata, handles)
% hObject    handle to Manu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Manu
global itr nevalD W1 Df indc X y CC1 CC4 CC5
while(1)
    c1 = get(handles.c1,'Value');
    c2 = get(handles.c2,'Value');
    c3 = get(handles.c3,'Value');
    c4 = get(handles.c4,'Value');
    c5 = get(handles.c5,'Value');
    
    h1 = waitbar(0,'Performing mapping Please wait ...');
%     if c1 == 0 && c2 == 0 && c3 == 0 && c4 == 0 && c5 == 0 
        w1 = get(handles.w1,'value');
        set(handles.w1_t,'String',roundn(w1,-1));
        w2 = get(handles.w2,'value');
        set(handles.w2_t,'String',roundn(w2,-1));
        w3 = get(handles.w3,'value');
        set(handles.w3_t,'String',roundn(w3,-1));
        w4 = get(handles.w4,'value');
        set(handles.w4_t,'String',roundn(w4,-1));
        w5 = get(handles.w5,'value');
        set(handles.w5_t,'String',roundn(w5,-1));
%     end
    
    waitbar(0.1)
    wp = [w1 w2 w3 w4 w5]/100;
    for ip1=1:itr
        for ip=1:nevalD
            W1{ip1,ip} = set(W1{ip1,ip},'user',wp(ip1,ip));
        end
    end

    CC1 = meanc([W1{:}]);
    waitbar(0.2)
    [E(1,:) F1(1,:)] = testc(Df,CC1);
    set(handles.E_usr,'String',roundn(E*100,-2));
    waitbar(0.2)
    CC1 = CC1*setname('Weighted Mean Combiner');
    waitbar(0.3)
    axes(handles.axes1);
    waitbar(0.75)
    gscatter(X(:,indc(1)),X(:,indc(2)),y,'brmygck','+*odxsph^<>.');
    waitbar(0.8)
    hold(handles.axes1,'on');
    waitbar(0.85)
    
    if get(handles.Mean,'Value') == 1 && get(handles.Vote,'Value') == 0
        waitbar(0.99)
        plotc({CC1,CC4});
    else if get(handles.Mean,'Value') == 1 && get(handles.Vote,'Value') == 1
            waitbar(0.99)
            plotc({CC1,CC4,CC5});
        end
    end
    if get(handles.Mean,'Value') == 0 && get(handles.Vote,'Value') == 1
        waitbar(0.99)
        plotc({CC1,CC5});
    else if get(handles.Mean,'Value') == 0 && get(handles.Vote,'Value') == 0
            waitbar(0.99)
            plotc({CC1});
        end
    end        
    title(handles.axes1,'Mapping','FontSize',10,'FontWeight','Bold');
    close(h1)
    
    if get(handles.c1,'Value') == 1
        w1 = get(handles.w1,'value');
        set(handles.w1_t,'String',roundn(w1,-1));
    else if get(handles.c2,'Value') == 1
            w2 = get(handles.w2,'value');
            set(handles.w2_t,'String',roundn(w2,-1));
        end
    end    
    if get(handles.c3,'Value') == 1
        w3 = get(handles.w3,'value');
        set(handles.w3_t,'String',roundn(w3,-1));
    else if get(handles.c4,'Value') == 1
            w4 = get(handles.w4,'value');
            set(handles.w4_t,'String',roundn(w4,-1));
        end
    end
    if get(handles.c5,'Value') == 1
        w5 = get(handles.w5,'value');
        set(handles.w5_t,'String',roundn(w5,-1));
    end

    w1t = w1; w2t = w2; w3t = w3; w4t = w4; w5t = w5;
    
    if get(handles.c1,'Value') == 1 || get(handles.c2,'Value') == 1 || get(handles.c3,'Value') == 1 || get(handles.c4,'Value') == 1 || get(handles.c5,'Value') == 1
        if get(handles.c1,'Value') == 1
            while w1 == w1t
                w1 = get(handles.w1,'value');
                set(handles.w2,'value',w2t);
                set(handles.w3,'value',w3t);
                set(handles.w4,'value',w4t);
                set(handles.w5,'value',w5t);
                set(handles.c2,'Value',0);
                set(handles.c3,'Value',0);
                set(handles.c4,'Value',0);
                set(handles.c5,'Value',0);
                pause(1)
                if get(handles.c1,'Value') == 0
                    break;
                end
            end
        else if get(handles.c2,'Value') == 1
                while w2 == w2t
                    w2 = get(handles.w2,'value');
                    set(handles.w1,'value',w1t);
                    set(handles.w3,'value',w3t);
                    set(handles.w4,'value',w4t);
                    set(handles.w5,'value',w5t);
                    set(handles.c1,'Value',0);
                    set(handles.c3,'Value',0);
                    set(handles.c4,'Value',0);
                    set(handles.c5,'Value',0);
                    pause(1)
                    if get(handles.c2,'Value') == 0
                        break;
                    end
                end
            end
        end
        if get(handles.c3,'Value') == 1
            while w3 == w3t
                w3 = get(handles.w3,'value');                
                set(handles.w1,'value',w1t);
                set(handles.w2,'value',w2t);
                set(handles.w4,'value',w4t);
                set(handles.w5,'value',w5t);
                set(handles.c1,'Value',0);
                set(handles.c2,'Value',0);
                set(handles.c4,'Value',0);
                set(handles.c5,'Value',0);
                pause(1)
                if get(handles.c3,'Value') == 0
                    break;
                end
            end
        else if get(handles.c4,'Value') == 1
                while w4 == w4t
                    w4 = get(handles.w4,'value');                    
                    set(handles.w1,'value',w1t);
                    set(handles.w2,'value',w2t);
                    set(handles.w3,'value',w3t);
                    set(handles.w5,'value',w5t);
                    set(handles.c1,'Value',0);
                    set(handles.c2,'Value',0);
                    set(handles.c3,'Value',0);
                    set(handles.c5,'Value',0);
                    pause(1)
                    if get(handles.c4,'Value') == 0
                        break;
                    end
                end
            end
        end
        if get(handles.c5,'Value') == 1
            while w5 == w5t
                w5 = get(handles.w5,'value');                
                set(handles.w1,'value',w1t);
                set(handles.w2,'value',w2t);
                set(handles.w3,'value',w3t);
                set(handles.w4,'value',w4t);
                set(handles.c1,'Value',0);
                set(handles.c2,'Value',0);
                set(handles.c3,'Value',0);
                set(handles.c4,'Value',0);
                pause(1)
                if get(handles.c5,'Value') == 0
                    break;
                end
            end
        end
        w1 = get(handles.w1,'value');
        set(handles.w1_t,'String',roundn(w1,-1));
        w2 = get(handles.w2,'value');
        set(handles.w2_t,'String',roundn(w2,-1));
        w3 = get(handles.w3,'value');
        set(handles.w3_t,'String',roundn(w3,-1));
        w4 = get(handles.w4,'value');
        set(handles.w4_t,'String',roundn(w4,-1));
        w5 = get(handles.w5,'value');
        set(handles.w5_t,'String',roundn(w5,-1));
                      
        wtem = 0;
        if get(handles.c1,'Value') == 1
            wtem = w1-w1t;
        else if get(handles.c2,'Value') == 1
                wtem = w2-w2t;
            end
        end        
        if get(handles.c3,'Value') == 1
            wtem = w3-w3t;
        else if get(handles.c4,'Value') == 1
                wtem = w4-w4t;
            end
        end
        if get(handles.c5,'Value') == 1
            wtem = w5-w5t;
        end
        
        wtem = wtem/4;
        if wtem>0
            if get(handles.c1,'Value') == 0
                %                 w1 = get(handles.w1,'value');
                if w1-wtem <= 0                    
                    set(handles.w1_t,'String',roundn(0,-1));
                    set(handles.w1,'value',roundn(0,-1));
                else
                    set(handles.w1_t,'String',roundn(w1-wtem,-1));
                    set(handles.w1,'value',roundn(w1-wtem,-1));                    
                end
            end
            if get(handles.c2,'Value') == 0
                %                 w2 = get(handles.w2,'value');
                if w2-wtem <= 0
                    set(handles.w2_t,'String',roundn(0,-1));
                    set(handles.w2,'value',roundn(0,-1));
                else
                    set(handles.w2_t,'String',roundn(w2-wtem,-1));
                    set(handles.w2,'value',roundn(w2-wtem,-1));
                end
            end
            if get(handles.c3,'Value') == 0
                %                 w3 = get(handles.w3,'value');
                if w3-wtem <= 0                    
                    set(handles.w3_t,'String',roundn(0,-1));
                    set(handles.w3,'value',roundn(0,-1));
                else
                    set(handles.w3_t,'String',roundn(w3-wtem,-1));
                    set(handles.w3,'value',roundn(w3-wtem,-1));                    
                end
            end
            if get(handles.c4,'Value') == 0
                %                 w4 = get(handles.w4,'value');
                if w4-wtem <= 0
                    set(handles.w4_t,'String',roundn(0,-1));
                    set(handles.w4,'value',roundn(0,-1));
                else
                    set(handles.w4_t,'String',roundn(w4-wtem,-1));
                    set(handles.w4,'value',roundn(w4-wtem,-1));
                end
            end
            if get(handles.c5,'Value') == 0
                %                 w5 = get(handles.w5,'value');
                if w5-wtem <= 0
                    set(handles.w5_t,'String',roundn(0,-1));
                    set(handles.w5,'value',roundn(0,-1));
                else
                    set(handles.w5_t,'String',roundn(w5-wtem,-1));
                    set(handles.w5,'value',roundn(w5-wtem,-1));
                end
            end
        else if wtem<0
                wtem = abs(wtem);
                if get(handles.c1,'Value') == 0
                    %                 w1 = get(handles.w1,'value');
                    set(handles.w1_t,'String',roundn(w1+wtem,-1));
                    set(handles.w1,'value',roundn(w1+wtem,-1));
                end
                if get(handles.c2,'Value') == 0
                    %                 w2 = get(handles.w2,'value');
                    set(handles.w2_t,'String',roundn(w2+wtem,-1));
                    set(handles.w2,'value',roundn(w2+wtem,-1));
                end
                if get(handles.c3,'Value') == 0
                    %                 w3 = get(handles.w3,'value');
                    set(handles.w3_t,'String',roundn(w3+wtem,-1));
                    set(handles.w3,'value',roundn(w3+wtem,-1));
                end
                if get(handles.c4,'Value') == 0
                    %                 w4 = get(handles.w4,'value');
                    set(handles.w4_t,'String',roundn(w4+wtem,-1));
                    set(handles.w4,'value',roundn(w4+wtem,-1));
                end
                if get(handles.c5,'Value') == 0
                    %                 w5 = get(handles.w5,'value');
                    set(handles.w5_t,'String',roundn(w5+wtem,-1));
                    set(handles.w5,'value',roundn(w5+wtem,-1));
                end
            end
        end
    end
    sum_w = get(handles.w1,'value')+get(handles.w2,'value')+get(handles.w3,'value')+get(handles.w4,'value')+get(handles.w5,'value');
    
    while w1 == w1t && w2 == w2t && w3 == w3t && w4 == w4t && w5 == w5t...
            && get(handles.c1,'Value') == 0 && get(handles.c2,'Value') == 0 && get(handles.c3,'Value') == 0 && get(handles.c4,'Value') == 0 && get(handles.c5,'Value') == 0
            w1 = get(handles.w1,'value');
            set(handles.w1_t,'String',roundn(w1,-1));
            w2 = get(handles.w2,'value');
            set(handles.w2_t,'String',roundn(w2,-1));
            w3 = get(handles.w3,'value');
            set(handles.w3_t,'String',roundn(w3,-1));
            w4 = get(handles.w4,'value');
            set(handles.w4_t,'String',roundn(w4,-1));
            w5 = get(handles.w5,'value');
            set(handles.w5_t,'String',roundn(w5,-1));
            pause(0.5)

            if get(handles.Manual,'Value') == 0 
                break;
            end
    end
%     h = warndlg('Calculando Mapping','Message');
    pause(0.5)
%     delete(h);
%     clear('h');
    if get(handles.Manual,'Value') == 0
        break;
    end
end


% --- Executes on button press in Kernel.
function Kernel_Callback(hObject, eventdata, handles)
% hObject    handle to Kernel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Kernel
global nevalD yev indc N X y W1 itr Cf Df numc CC2 CC4 CC5 yc
numc = length(yc);
% numc = 3; %Variable que determina la cantidad de clases a tomar
sigma=0.65;
h3 = waitbar(0,'Performing mapping Please wait ...');
K = [];
Kc = [];% Kernel's apróximados
twb = 0;
for L=1:nevalD      %Va hasta el # de eval
    for i1=1:numc      %Va hasta el num de clases
        yevl{L}(:,i1) = yev(:,L);   %Coloca cada etiquetador en yev
        yevl{L}( yevl{L}(:,i1) ~= i1 , i1 ) = -1; %Selecciona cada clase diferente de i1 y le asigna un valor de -1
        yevl{L}( yevl{L}(:,i1) == i1 , i1 ) = 1;    %A la clase dada por i2 le asigna el valor de 1
    end
    for i = 1:N   %Va Hasta el # de datos
        for j = 1:N    %Va Hasta el # de datos
%             K{L}(i,j) = yevl{L}(i,:)*yevl{L}(j,:)'*...
%                 exp(-(norm(X(i,:) - X(j,:)))^2/(2*sigma^2));    %Matriz Kernel
            
            K{L}(i,j) = yevl{L}(i,:)*yevl{L}(j,:)'*...
                exp(-(norm(X(i,:) - X(j,:)))^2/(2*sigma^2));    %Matriz Kernel
        end
    end
    Kc = [Kc K{L}(:)];  %Organiza la matriz kernel en una sola columna por etq
    twb = twb + 0.05;
    waitbar(0.1+twb)
end

[V,delta] = eig(Kc'*Kc);    %Genera los vectores propios de la matriz simetrica
[ndelta,nidelta] = sort(diag(delta));   %indices y valores eigen
NV = V(:,nidelta);
p12=(NV.*NV)*ndelta;

p1 = p12/sum(p12);
waitbar(0.4)

wp = p1';
set(handles.w1_t,'String',roundn(wp(1)*100,-1));
set(handles.w2_t,'String',roundn(wp(2)*100,-1));
set(handles.w3_t,'String',roundn(wp(3)*100,-1));
set(handles.w4_t,'String',roundn(wp(4)*100,-1));
set(handles.w5_t,'String',roundn(wp(5)*100,-1));
set(handles.w1,'value',roundn(wp(1)*100,-1));
set(handles.w2,'value',roundn(wp(2)*100,-1));
set(handles.w3,'value',roundn(wp(3)*100,-1));
set(handles.w4,'value',roundn(wp(4)*100,-1));
set(handles.w5,'value',roundn(wp(5)*100,-1));


W1f = svc(Cf,proxm('e',0.9));%
waitbar(0.5)
for ip1=1:itr
    for ip=1:nevalD
        W1{ip1,ip} = set(W1{ip1,ip},'user',wp(ip1,ip));
    end
end
CC2 = meanc([W1{:}]);
waitbar(0.7)
[E(1,:) F1(1,:)] = testc(Df,CC2);
set(handles.E_usr,'String',roundn(E*100,-2));
waitbar(0.8)
CC2 = CC2*setname('Weighted Mean Combiner');
waitbar(0.99)
axes(handles.axes1);
gscatter(X(:,indc(1)),X(:,indc(2)),y,'brmygck','+*odxsph^<>.');
hold(handles.axes1,'on');
if get(handles.Mean,'Value') == 1 && get(handles.Vote,'Value') == 0
    waitbar(0.99)
    plotc({CC2,CC4});
else if get(handles.Mean,'Value') == 1 && get(handles.Vote,'Value') == 1
        waitbar(0.99)
        plotc({CC2,CC4,CC5});
    end
end
if get(handles.Mean,'Value') == 0 && get(handles.Vote,'Value') == 1
    waitbar(0.99)
    plotc({CC2,CC5});
else if get(handles.Mean,'Value') == 0 && get(handles.Vote,'Value') == 0
        waitbar(0.99)
        plotc({CC2});
    end
end
delete(h3);
clear('h3');
title(handles.axes1,'Mapping','FontSize',10,'FontWeight','Bold');

% --- Executes on button press in Gaussian.
function Gaussian_Callback(hObject, eventdata, handles)
% hObject    handle to Gaussian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Gaussian
global yev X y indc W1 itr Cf Df CC3 numc yc dat_v
set(handles.Mean,'Value',0);
set(handles.Vote,'Value',0);
if dat_v == 2 || dat_v == 3 || dat_v == 5 || dat_v == 6 
    h4 = waitbar(0,'Performing mapping Please wait ...');
    nevalD = 4;
    nevalD = nevalD+1;
    numc = length(yc);
    waitbar(0.05)
    [FitFunction ,fitresult,xData, yData, zData,values,minx1,maxx1] = regsKernel_v1( yev,X ,indc,nevalD,numc,0);
    % indc=[3 4];
    minx = [];
    maxx = [];
    twb = 0.05;
    for L = 1:nevalD
        for i1 = 1:numc
            indx = find(yev(:,L)==i1);%Encuentra los indices por etiquetador en la clase i1
            mu{i1,L} = mean(X(indx,indc));%Calcula la media por clase por etiquetador
            covs{i1,L} = cov(X(indx,indc));%Calcula la covarianza por clase por etiquetador           
            Sigmat{i1,L} = std(X(indx,indc));
            for iy = 1:size(covs,1)
                % covs{i1}(L,iy,iy)=Sigmat{i1}(L,iy);
            end
            x1 = X(indx,indc(1));
            x2 = X(indx,indc(2));
            %        [X1,X2] = meshgrid(X(indx,indc(1)),X(indx,indc(2)));
            % covd=zeros(size(indc,2));
            % covd(:,:)=covs{i1}(L,:,:);
            F = mvnpdf([fliplr(X(indx,indc))],mu{i1,L},covs{i1,L});
            %         F = reshape(F,length(X(indx,indc(2))),length(X(indx,indc(1))));
            %         [xData{i1}{L}, yData{i1}{L}, zData{i1}{L}] = prepareSurfaceData( X2, X1, F );
            %minix{i1}(L,:)=[min(xData{i1}{L}) min(yData{i1}{L}) min(zData{i1}{L})];
            %maxx{i1}(L,:)=[max(xData{i1}{L}) max(yData{i1}{L})  min(yData{i1}{L})];
            
            minx{i1}(L,:) = [min(X(indx,indc))];
            maxx{i1}(L,:) = [max(X(indx,indc)) ];
        end
        twb = twb + 0.05;
        waitbar(0.05+twb)
    end
    
    % Optimization
    global functiontoeval valuestemp mu covs numberOfVariables nevalD nclas
    %functiontoeval=FitFunction{1}{1}
    
    %             figure( 'Name', 'untitled fit 1' );
    %             h = plot( fitresult{1}{1}, [xData{1}{1}, yData{1}{1}], zData{1}{1} );
    %             legend( h, 'untitled fit 1', 'F vs. X1, X2', 'Location', 'NorthEast' );
    %             % Label axes
    %             xlabel X1
    %             ylabel X2
    %             zlabel F
    %             grid on
    %FitnessFunction = @simple_multiobjective_D; %funciona
    FitnessFunction = @simple_multiobjective_D3;
    FitnessFunction1 = @simple_multiobjective_D4;
    
    constraintFunction = @constraint;
    constraintFunction1 = @constraint1;
    
    numberOfVariables = 7;
    A = []; b = [];
    Aeq = []; beq = [];
    nclas = size(indc,2);
    covso = zeros(nclas);
    global numcOp
    waitbar(0.4)
    twb = 0;
    for numcOp=1:numc
        %muo= mu{numcOp,:};
        %     covso(:,:)=covs{i1}(L,:,:)
        % covso=covs{numcOp,:};
        valuestemp = values{numcOp};
        lb1 = [min(minx1{numcOp}(:,1)) min(minx1{numcOp}(:,2))  0 0 0 0 0];%??????????????
        ub1 = [max(maxx1{numcOp}(:,1)) max(maxx1{numcOp}(:,2))  (ones(1,nevalD))*1];%0;
        
        lb = [2*min(minx{numcOp}(:,:))  0 0 0 0 0];%??????????????
        ub = [2*max(maxx{numcOp}(:,:))  (ones(1,nevalD))*1];%0;
        nclas=size(indc,2);        
        lb = [(ones(1,nclas))*-Inf,  0 ,0 ,0 ,0 ,0];%??????????????
        ub = [(ones(1,nclas))*Inf (ones(1,nevalD))*1];%0;
        numberOfVariables=size(ub,2);
        % options = optimoptions(@gamultiobj,'PlotFcn',{@gaplotpareto,@gaplotscorediversity});
        %options.TimeLimit=30;
%         [x(numcOp,:),fval(numcOp,:)] = gamultiobj(FitnessFunction,numberOfVariables,A,b,Aeq,beq,lb,ub,constraintFunction);%options);
        nclas=2;
        twb = twb + 0.05;
        waitbar(0.4+twb)
        [x11(numcOp,:),fval11(numcOp,:)] = gamultiobj(FitnessFunction1,7,A,b,Aeq,beq,lb1,ub1,constraintFunction1);%options);
        
        %x((numcOp),3:end)=x((numcOp),3:end)/sum(x((numcOp),3:end));
        twb = twb + 0.05;
        waitbar(0.4+twb)
    end
    nclas=size(indc,2);
%     p2=prod(x(:,nclas+1:end)).^(1/nevalD);    
%     p2=p2/sum(p2);

    nclas=2;    
    p12 = prod(x11(:,nclas+1:end)).^(1/nevalD);
    %p21=mean(x11(:,nclas+1:end));
    % p21=p21/sum(p21)
    p21=p12/sum(p12)
    waitbar(0.75);
    
    wp = p21;
    set(handles.w1_t,'String',roundn(wp(1)*100,-1));
    set(handles.w2_t,'String',roundn(wp(2)*100,-1));
    set(handles.w3_t,'String',roundn(wp(3)*100,-1));
    set(handles.w4_t,'String',roundn(wp(4)*100,-1));
    set(handles.w5_t,'String',roundn(wp(5)*100,-1));
    set(handles.w1,'value',roundn(wp(1)*100,-1));
    set(handles.w2,'value',roundn(wp(2)*100,-1));
    set(handles.w3,'value',roundn(wp(3)*100,-1));
    set(handles.w4,'value',roundn(wp(4)*100,-1));
    set(handles.w5,'value',roundn(wp(5)*100,-1));
    
    W1f = svc(Cf,proxm('e',0.9));%
    waitbar(0.8);
    for ip1=1:itr
        for ip=1:nevalD
            W1{ip1,ip} = set(W1{ip1,ip},'user',wp(ip1,ip));
        end
    end
    waitbar(0.85);
    CC3 = meanc([W1{:}]);
    waitbar(0.9);
    [E(1,:) F1(1,:)] = testc(Df,CC3);
    set(handles.E_usr,'String',roundn(E*100,-2));
    CC3 = CC3*setname('Weighted Mean Combiner');
    axes(handles.axes1);
    waitbar(0.95);
    gscatter(X(:,indc(1)),X(:,indc(2)),y,'brmygck','+*odxsph^<>.');
    
    hold(handles.axes1,'on');
    if get(handles.Mean,'Value') == 1 && get(handles.Vote,'Value') == 0
        waitbar(0.99);
        plotc({CC3,CC4});
    else if get(handles.Mean,'Value') == 1 && get(handles.Vote,'Value') == 1
            waitbar(0.99);
            plotc({CC3,CC4,CC5});
        end
    end
    if get(handles.Mean,'Value') == 0 && get(handles.Vote,'Value') == 1
        waitbar(0.99);
        plotc({CC3,CC5});
    else if get(handles.Mean,'Value') == 0 && get(handles.Vote,'Value') == 0
            waitbar(0.99);
            plotc({CC3});
        end
    end
    delete(h4);
    clear('h4');
    title(handles.axes1,'Mapping','FontSize',10,'FontWeight','Bold');
else
    h = msgbox('This data set is not available for this method', 'Error','error');
end
