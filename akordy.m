function akordy(answer)
clc;
clear all;
close all;

%trzy tablice z wartoœciami
chord = {'C_maj', 'D_maj', 'E_maj', 'F_maj', 'G_maj', 'A_maj', 'B_maj', 'H_maj','C_min', 'D_min', 'E_min', 'F_min', 'G_min', 'A_min', 'B_min', 'H_min','C_aug', 'D_aug', 'E_aug', 'F_aug', 'G_aug', 'A_aug', 'B_aug', 'H_aug','C_dim', 'D_dim', 'E_dim', 'F_dim', 'G_dim', 'A_dim', 'B_dim', 'H_dim'};

files = {'c_maj.wav', 'd_maj.wav', 'e_maj.wav', 'f_maj.wav', 'g_maj.wav', 'a_maj.wav', 'b_maj.wav', 'h_maj.wav', 'c_min.wav', 'd_min.wav', 'e_min.wav', 'f_min.wav', 'g_min.wav', 'a_min.wav', 'b_min.wav', 'h_min.wav','c_aug.wav', 'd_aug.wav', 'e_aug.wav', 'f_aug.wav', 'g_aug.wav', 'a_aug.wav', 'b_aug.wav', 'h_aug.wav','c_dim.wav', 'd_dim.wav', 'e_dim.wav', 'f_dim.wav', 'g_dim.wav', 'a_dim.wav', 'b_dim.wav', 'h_dim.wav'};

answer = {'Dur', 'Mol', 'Zwiêkszony', 'Zmniejszony'};

%tworzê menu 1
my_options = {"Rozpocznij test akordów", "WyjdŸ z programu"};

[sel, ok] = listdlg ("ListString", my_options,
                     "SelectionMode", "Multiple","Name","Test na rozpoznawanie akordów","ListSize",[300,160], "CancelString", "Anuluj");

%tworzê podstawê do punktacji                     
score =0;

if sel == 1
  uiwait(msgbox('Witaj w programie do rozpoznawania akordów. Po rozpoczêciu testu, zostanie Ci zaprezentowanych 6 akordów. Twoim zadaniem jest rozpoznanie czy dany akord jest durowy, molowy, zwiêkszony b¹dŸ zmniejszony i wybranie poprawnej opcji z listy. Powodzenia!'));
  uiwait(msgbox('Test start'));
  for i= 1:6
    %generuje randomowy element zbioru chord
    x = chord(randi(numel(chord)));

    %zmieniam na stringi
    z = char(x);

    %odszukuje pozycje randomowego elemntu w zbiorze chord
    y = find(strcmp(chord, z));

    %odszukuje odpowiadaj¹c¹ pozycje ze zbioru chord w zbiorze files
    s = files(y)
    %wczytuje i odtwarza
    [wave, fs] = audioread(char(s));
     sound(wave, 48000);
     
     %warunek jeden:jeœli y jest miêdzy indeksem 1 a 8 ze zbioru chord to przypisuje wartoœc n=1 - ta wartoœc odpowiada indeksowi z listy odpowiedzi
    if (y >=1) && (y <=8)

      n = 1;
      
      %pokazuje okno dialogowe input
       [odp, ok] = listdlg("ListString", answer,
                         "SelectionMode", "Single",
                         "Name","Wybierz us³yszany akord",
                         "ListSize",[500,250], 
                         "CancelString", "Anuluj");
       if odp == n
            uiwait(msgbox('Poprawnie!'));
            score = score + 1
       else
            uiwait(msgbox(['Nie trafi³eœ. Poprawny interwa³ to ', char(answer(n)),'.']));
       endif
     %warunek dwa:jeœli y jest miêdzy indeksem 9 a 16 ze zbioru chord to przypisuje wartoœc n=2 - ta wartoœc odpowiada indeksowi z listy odpowiedzi      
    elseif (y >=9) && (y <=16)
      
       n = 2;
      
      %pokazuje okno dialogowe input
       [odp, ok] = listdlg("ListString", answer,
                         "SelectionMode", "Single",
                         "Name","Wybierz us³yszany akord",
                         "ListSize",[500,250], 
                         "CancelString", "Anuluj");
       if odp == n
            uiwait(msgbox('Poprawnie!'));
            score = score + 1
       else
            uiwait(msgbox(['Nie trafi³eœ. Poprawny interwa³ to ', char(answer(n)),'.']));
       endif
    %warunek jeden:jeœli y jest miêdzy indeksem 17 a 24 ze zbioru chord to przypisuje wartoœc n=3 - ta wartoœc odpowiada indeksowi z listy odpowiedzi
    elseif (y >=17) && (y <=24)
       
       n = 3;
      
      %pokazuje okno dialogowe input
       [odp, ok] = listdlg("ListString", answer,
                         "SelectionMode", "Single",
                         "Name","Wybierz us³yszany akord",
                         "ListSize",[500,250], 
                         "CancelString", "Anuluj");
       if odp == n
            uiwait(msgbox('Poprawnie!'));
            score = score + 1
       else
            uiwait(msgbox(['Nie trafi³eœ. Poprawny interwa³ to ', char(answer(n)),'.']));
       endif
    %warunek jeden:jeœli y jest miêdzy indeksem 25 a 32 ze zbioru chord to przypisuje wartoœc n=4 - ta wartoœc odpowiada indeksowi z listy odpowiedzi
    elseif (y >=25) && (y <=32)
       
       n = 4;
      
      %pokazuje okno dialogowe input
       [odp, ok] = listdlg("ListString", answer,
                         "SelectionMode", "Single",
                         "Name","Wybierz us³yszany akord",
                         "ListSize",[500,250], 
                         "CancelString", "Anuluj");
       if odp == n
            uiwait(msgbox('Poprawnie!'));
            score = score + 1
       else
            uiwait(msgbox(['Nie trafi³eœ. Poprawny interwa³ to ', char(answer(n)),'.']));
       endif
    else
       close all;
                  
    endif
  endfor
elseif sel == 2
  close all;
else 
  clear all;
endif

waitfor(msgbox(['Uzyska³eœ ³¹cznie punktów ', num2str(score), ' z 6 mo¿liwych.']))
close all;

endfunction