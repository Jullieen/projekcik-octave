function interwaly()
pkg load statistics

str={'C', 'C#','D','D#','E','F','F#','G','G#','A', 'B', 'H', 'C2'};
names = {'c1.wav', 'c#.wav', 'd.wav',  'd#.wav','e.wav','f.wav','f#.wav','g.wav','g#.wav','a.wav','b.wav','h.wav','c2.wav'};
interw = {'pryma czysta', 'sekunda ma³a', 'sekunda wielka','tercja ma³a','tercja wielka','kwarta czysta','kwinta zmniejszona','kwinta czysta','seksta ma³a','seksta wielka','septyma ma³a','septyma wielka','oktawa czysta'};
polton = [0,1,2,3,4,5,6,7,8,9,10,11,12];

%tworzÄ™ menu 1
my_options = {"Rozpocznij test interwa³ów", "WyjdŸ z programu"};

[sel, ok] = listdlg ("ListString", my_options,
                     "SelectionMode", "Single","Name","Test na rozpoznawanie interwa³ów","ListSize",[300,160], "CancelString", "Anuluj");
score =0;
score1 = 0;

%jeÅ›li uÅ¼ytkownik wybierze opcjÄ™ testu
if sel == 1
  
  %pÄ™tla na powtarzanie interwaÅ‚Ã³w aÅ¼ uÅ¼ytkownik anuluje
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

    %odszukuje odpowiadajÄ…cÄ… pozycje ze zbioru str w zbiorze names
    s = names(1,y);
    s1 = names(1,y2);
    plik = ['interwaly/' char(s)];
    plik2 = ['interwaly/' char(s1)];
    h=questdlg('Chcesz kontynuowaæ?', 'Kontynuowaæ?', 'Kontynuuj', 'Anuluj', 'Kontynuuj');
    
    %funkcja przypisania co siÄ™ dzieje po wciÅ›niÄ™ciu przyciskÃ³w kontynuuj i anuluj
    switch h
      case 'Kontynuuj'
    
    %kiedy pierwszy dÅºwiÄ™k jest wyÅ¼szy od drugiego
      if y <= y2
        
         %wczytuje i odtwarza
         for k =1
              
             [wave1, fs] = audioread(char(plik));
              [wave2, fs] = audioread(char(plik2));
              %tworzÄ™ punkt start i stop dla danego pliku audio
               playerObj1 = audioplayer(wave1,48000);
              start1 = 0.5;
              stop1 = playerObj1.SampleRate * 2;
              play(playerObj1,[start1,stop1]);
              %pausa miÄ™dzy dÅºwiÄ™kami przez 1 sekundÄ™
             pause(1);
             %odtwarza drugi dÅºwiÄ™k
             playerObj2 = audioplayer(wave2,48000);
              start2 = 0.5;
              stop2 = playerObj2.SampleRate * 2;
              play(playerObj2,[start2,stop2]);
         endfor
          
          %xyspace liczy odlegÅ‚oÅ›c miedzy dÅºwiÄ™kami, find odszukuje index, zmienna b przypisuje znaleziony indeks do indeksu w tablicy interw
          n = xyspace(str, z, z2);
          c = find(polton == n);
          b = interw(1, c);
          
          %pokazuje okno dialogowe input
          [odp, ok] = listdlg("ListString", interw,
                           "SelectionMode", "Single",
                           "Name","Wybierz us³yszany interwa³",
                           "ListSize",[500,350], 
                           "CancelString", "Anuluj");

          if (odp == c)
            
              uiwait(msgbox('Poprawnie! Zdobywasz 1 punkt.'));
              score = score + 1;
              
          elseif (odp ~= c)
            
             uiwait(msgbox(['Nie trafi³eœ. Poprawny interwa³ to ', char(b),'.']));
             score1 = score1 +1 ;
          else
             close all;
               
          endif

          %kiedy pierwszy dÅºwiÄ™k jest wyÅ¼ej od drugiego
      elseif y > y2
         %wczytuje i odtwarza
         for k =1
              
             [wave1, fs] = audioread(char(plik));
              [wave2, fs] = audioread(char(plik2));
              %tworzÄ™ punkt start i stop dla danego pliku audio
               playerObj1 = audioplayer(wave1,48000);
              start1 = 0.5;
              stop1 = playerObj1.SampleRate * 2;
              play(playerObj1,[start1,stop1]);
              %pausa miÄ™dzy dÅºwiÄ™kami przez 1 sekundÄ™
             pause(1);
             %odtwarza drugi dÅºwiÄ™k
             playerObj2 = audioplayer(wave2,48000);
              start2 = 0.5;
              stop2 = playerObj2.SampleRate * 2;
              play(playerObj2,[start2,stop2]);
         endfor
      
          n1 = xyspace(str, z2, z);
          c1 = find(polton==n1);
          b1 = interw(1, c1);
          
          [odp, ok] = listdlg("ListString", interw,
                           "SelectionMode", "Single",
                           "Name","Wybierz us³yszany interwa³",
                           "ListSize",[500,250], 
                           "CancelString", "Anuluj");

          
          if (odp == c1)
              
              uiwait(msgbox('Poprawnie! Zdobywasz 1 punkt.'))
              score = score + 1;
          elseif (odp ~= c1)
              
              uiwait(msgbox(['Nie trafi³eœ. Poprawny interwa³ to ', char(b1),'.']));
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
  elseif (sel == 2)
    %uiwait(msgbox('Witaj w programie do rozpoznawania interwaÅ‚Ã³w. Po rozpoczÄ™ciu testu, zostanie Ci zaprezentowanych 10 dÅºwiÄ™kÃ³w tworzÄ…cych 5 interwaÅ‚Ã³w. Twoim zadaniem jest rozpoznanie co to za interwaÅ‚ i wybranie poprawnej opcji z listy. Powodzenia!'));
    uiwait(msgbox('wychodzisz z programu.'));
    close all;
  endif
score_all = score + score1;
waitfor(msgbox(['Opowiedzia³eœ poprawnie na ', num2str(score), ' z ', num2str(score_all), ' prezentowanych interwa³ów.']))
close all;

endfunction
