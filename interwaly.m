function interwaly()
pkg load statistics

str={'C', 'C#','D','D#','E','F','F#','G','G#','A', 'B', 'H', 'C2'};
names = {'c1.wav', 'c#.wav', 'd.wav',  'd#.wav','e.wav','f.wav','f#.wav','g.wav','g#.wav','a.wav','b.wav','h.wav','c2.wav'};
interw = {'pryma czysta', 'sekunda ma�a', 'sekunda wielka','tercja ma�a','tercja wielka','kwarta czysta','kwinta zmniejszona','kwinta czysta','seksta ma�a','seksta wielka','septyma ma�a','septyma wielka','oktawa czysta'};
polton = [0,1,2,3,4,5,6,7,8,9,10,11,12];

%tworz� menu 1
my_options = {"Rozpocznij test interwa��w", "Wyjd� z programu"};

[sel, ok] = listdlg ("ListString", my_options,
                     "SelectionMode", "Multiple","Name","Test na rozpoznawanie interwa��w","ListSize",[300,160], "CancelString", "Anuluj");
score =0;
score1 = 0;

%je�li u�ytkownik wybierze opcj� testu
if sel == 1
  
  %p�tla na powtarzanie interwa��w a� u�ytkownik anuluje
   while (1)
  
        %generuje randomowe elementy zbioru
    x1 = str(1,randi(numel(str)));
    x2 = str(1,randi(numel(str)));

    %zmieniam na stringi
    z = char(x1);
    z2= char(x2);

    %odszukuje pozycje randomowego elementu w zbiorze
    y = find(strcmp(str, z));
    y2 = find(strcmp(str, z2));

    %odszukuje odpowiadaj�c� pozycje ze zbioru str w zbiorze names
    s = names(1,y);
    s1 = names(1,y2);
    plik = ['interwaly/' char(s)];
    plik2 = ['interwaly/' char(s1)];
    h=questdlg('Chcesz kontynuowac?', 'Kontynuowac?', 'Kontynuuj', 'Anuluj', 'Kontynuuj');
    
    %funkcja przypisania co si� dzieje po wci�ni�ciu przycisk�w kontynuuj i anuluj
    switch h
      case 'Kontynuuj'
    
    %kiedy pierwszy d�wi�k jest wy�szy od drugiego
      if y < y2
        
         %wczytuje i odtwarza
         [wave1, fs] = audioread(char(plik));
         [wave2, fs] = audioread(char(plik2));
          wave3 = [wave1;wave2];
          sound(wave3, 48000);
          
          %xyspace liczy odleg�o�c miedzy d�wi�kami, find odszukuje index, zmienna b przypisuje znaleziony indeks do indeksu w tablicy interw
          n = xyspace(str, z, z2);
          c = find(polton == n);
          b = interw(1, c);
          
          %pokazuje okno dialogowe input
          [odp, ok] = listdlg("ListString", interw,
                           "SelectionMode", "Single",
                           "Name","Wybierz us�yszany interwa�",
                           "ListSize",[500,350], 
                           "CancelString", "Anuluj");

          if (odp == c)
            
              uiwait(msgbox('Poprawnie! Zdobywasz 1 punkt.'));
              score = score + 1;
              
          elseif (odp ~= c)
            
             uiwait(msgbox(['Nie trafi�e�. Poprawny interwa� to ', char(b),'.']));
             score1 = score1 +1 ;
          else
             close all;
               
          endif

          %kiedy pierwszy d�wi�k jest wy�ej od drugiego
      elseif y > y2
         %wczytuje i odtwarza
         [wave1, fs] = audioread(char(plik));
         [wave2, fs] = audioread(char(plik2));
          wave3 = [wave1;wave2];
          sound(wave3, 48000);
      
          n1 = xyspace(str, z2, z);
          c1 = find(polton==n1);
          b1 = interw(1, c1);
          
          [odp, ok] = listdlg("ListString", interw,
                           "SelectionMode", "Single",
                           "Name","Wybierz us�yszany interwa�",
                           "ListSize",[500,250], 
                           "CancelString", "Anuluj");

          
          if (odp == c1)
              
              uiwait(msgbox('Poprawnie! Zdobywasz 1 punkt.'))
              score = score + 1;
          elseif (odp ~= c1)
              
              uiwait(msgbox(['Nie trafi�e�. Poprawny interwa� to ', char(b1),'.']));
              score1 =score1 + 1;
          else 
              close all;
          endif
      
      endif
      case 'Anuluj'
       close all;
       % endfor
       break
        otherwise
       endswitch
     endwhile
  elseif sel==2
    %uiwait(msgbox('Witaj w programie do rozpoznawania interwa��w. Po rozpocz�ciu testu, zostanie Ci zaprezentowanych 10 d�wi�k�w tworz�cych 5 interwa��w. Twoim zadaniem jest rozpoznanie co to za interwa� i wybranie poprawnej opcji z listy. Powodzenia!'));
    uiwait(msgbox('wychodzisz z programu.'));
    close all;
  endif
score_all = score + score1;
waitfor(msgbox(['Opowiedzia�e� poprawnie na ', num2str(score), ' z ', num2str(score_all), ' prezentowanych interwa��w.']))
close all;

endfunction