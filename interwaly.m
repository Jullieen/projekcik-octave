function interwaly(interw)
pkg load statistics

str={'C', 'C#','D','D#','E','F','F#','G','G#','A', 'B', 'H', 'C2'};
names = {'c1.wav', 'c#.wav', 'd.wav',  'd#.wav','e.wav','f.wav','f#.wav','g.wav','g#.wav','a.wav','b.wav','h.wav','c2.wav'};
interw = {'pryma czysta', 'sekunda ma³a', 'sekunda wielka','tercja ma³a','tercja wielka','kwarta czysta','kwinta zmniejszona','kwinta czysta','seksta ma³a','seksta wielka','septyma ma³a','septyma wielka','oktawa czysta'};
polton = [0,1,2,3,4,5,6,7,8,9,10,11,12];

%tworzê menu 1
my_options = {"Rozpocznij test interwa³ów", "Instrukcja obslugi"};

[sel, ok] = listdlg ("ListString", my_options,
                     "SelectionMode", "Multiple","Name","Test na rozpoznawanie interwa³ów","ListSize",[300,160], "CancelString", "Anuluj");
score =0;


if sel == 1
  uiwait(msgbox('Test start'));

  for i = 1:5
        %generuje randomowe elementy zbioru
    x1 = str(1,randi(numel(str)));
    x2 = str(1,randi(numel(str)));

    %zmieniam na stringi
    z = char(x1)
    z2= char(x2)

    %odszukuje pozycje randomowego elementu w zbiorze
    y = find(strcmp(str, z))
    y2 = find(strcmp(str, z2))

    %odszukuje odpowiadaj¹c¹ pozycje ze zbioru str w zbiorze names
    s = names(1,y)
    s1 = names(1,y2)

    %zmienia na string
    #sd = char(s)
    #sd1 = char(s1)
    
    if y < y2
       %wczytuje i odtwarza
       [wave1, fs] = audioread(char(s));
       [wave2, fs] = audioread(char(s1));
        wave3 = [wave1;wave2];
        sound(wave3, 48000);
        
        n = xyspace(str, z, z2)
        c = find(polton == n)
        b = interw(1, c)
        
        %pokazuje okno dialogowe input
        [odp, ok] = listdlg("ListString", interw,
                         "SelectionMode", "Single",
                         "Name","Wybierz us³yszany interwa³",
                         "ListSize",[500,250], 
                         "CancelString", "Anuluj");

        if (odp == c)
          
            uiwait(msgbox('Poprawnie!'));
            score = score + 1
            
        elseif (odp ~= c)
          
           uiwait(msgbox(['Nie trafi³eœ. Poprawny interwa³ to ', char(b),'.']));
        else
           close all;
             
        endif

    elseif y > y2
       %wczytuje i odtwarza
       [wave1, fs] = audioread(char(s));
       [wave2, fs] = audioread(char(s1));
        wave3 = [wave1;wave2];
        sound(wave3, 48000);
    
        n1 = xyspace(str, z2, z);
        c1 = find(polton==n1)
        b1 = interw(1, c1)
        
        [odp, ok] = listdlg("ListString", interw,
                         "SelectionMode", "Single",
                         "Name","Wybierz us³yszany interwa³",
                         "ListSize",[500,250], 
                         "CancelString", "Anuluj");

        
        if (odp == c1)
            
            uiwait(msgbox('Poprawnie!'))
            score = score + 1
        elseif (odp ~= c1)
            
            uiwait(msgbox(['Nie trafi³eœ. Poprawny interwa³ to ', char(b1),'.']));
        else 
            close all;
        endif
    
    endif
 
  endfor
elseif sel==2
  uiwait(msgbox('Witaj w programie do rozpoznawania interwa³ów. Po rozpoczêciu testu, zostanie Ci zaprezentowanych 10 dŸwiêków tworz¹cych 5 interwa³ów. Twoim zadaniem jest rozpoznanie co to za interwa³ i wybranie poprawnej opcji z listy. Powodzenia!'));
  uiwait(msgbox('Test start'));
  
    for i = 1:5
        %generuje randomowe elementy zbioru
    x1 = str(1,randi(numel(str)));
    x2 = str(1,randi(numel(str)));

    %zmieniam na stringi
    z = char(x1)
    z2= char(x2)

    %odszukuje pozycje randomowego elementu w zbiorze
    y = find(strcmp(str, z))
    y2 = find(strcmp(str, z2))

    %odszukuje odpowiadaj¹c¹ pozycje ze zbioru str w zbiorze names
    s = names(1,y)
    s1 = names(1,y2)

    %zmienia na string
    #sd = char(s)
    #sd1 = char(s1)
    
    if y < y2
       %wczytuje i odtwarza
       [wave1, fs] = audioread(char(s));
       [wave2, fs] = audioread(char(s1));
        wave3 = [wave1;wave2];
        sound(wave3, 48000);
        
        n = xyspace(str, z, z2)
        c = find(polton == n)
        b = interw(1, c)
        
        %pokazuje okno dialogowe input
        [odp, ok] = listdlg("ListString", interw,
                         "SelectionMode", "Single",
                         "Name","Wybierz us³yszany interwa³",
                         "ListSize",[500,250], 
                         "CancelString", "Anuluj");

        if (odp == c)
          
            uiwait(msgbox('Poprawnie!'));
            score = score + 1
            
        elseif (odp ~= c)
          
           uiwait(msgbox(['Nie trafi³eœ. Poprawny interwa³ to ', char(b),'.']));
        else
           close all;
             
        endif

    elseif y > y2
       %wczytuje i odtwarza
       [wave1, fs] = audioread(char(s));
       [wave2, fs] = audioread(char(s1));
        wave3 = [wave1;wave2];
        sound(wave3, 48000);
    
        n1 = xyspace(str, z2, z);
        c1 = find(polton==n1)
        b1 = interw(1, c1)
        
        [odp, ok] = listdlg("ListString", interw,
                         "SelectionMode", "Single",
                         "Name","Wybierz us³yszany interwa³",
                         "ListSize",[500,250], 
                         "CancelString", "Anuluj");

        
        if (odp == c1)
            
            uiwait(msgbox('Poprawnie!'))
            score = score + 1
        elseif (odp ~= c1)
            
            uiwait(msgbox(['Nie trafi³eœ. Poprawny interwa³ to ', char(b1),'.'])); 
        else
            close all;
        endif
    
    endif
 
  endfor
endif

waitfor(msgbox(['Uzyska³eœ ³¹cznie punktów ', num2str(score), ' z 5 mo¿liwych.']))
close all;

endfunction