function interwaly()
pkg load statistics

str={'C', 'C#','D','D#','E','F','F#','G','G#','A', 'B', 'H', 'C2'};
names = {'c1.wav', 'c#.wav', 'd.wav',  'd#.wav','e.wav','f.wav','f#.wav','g.wav','g#.wav','a.wav','b.wav','h.wav','c2.wav'};
interw = {'pryma czysta', 'sekunda mała', 'sekunda wielka','tercja mała','tercja wielka','kwarta czysta','kwinta zmniejszona','kwinta czysta','seksta mała','seksta wielka','septyma mała','septyma wielka','oktawa czysta'};
polton = [0,1,2,3,4,5,6,7,8,9,10,11,12];

%tworzę menu 1
my_options = {"Rozpocznij test interwałów", "Wyjdź z programu"};

[sel, ok] = listdlg ("ListString", my_options,
                     "SelectionMode", "Single","Name","Test na rozpoznawanie interwałów","ListSize",[300,160], "CancelString", "Anuluj");
score =0;
score1 = 0;

%jeśli użytkownik wybierze opcję testu
if sel == 1
  
  %pętla na powtarzanie interwałów aż użytkownik anuluje
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

    %odszukuje odpowiadającą pozycje ze zbioru str w zbiorze names
    s = names(1,y);
    s1 = names(1,y2);
    plik = ['interwaly/' char(s)];
    plik2 = ['interwaly/' char(s1)];
    h=questdlg('Chcesz kontynuowac?', 'Kontynuowac?', 'Kontynuuj', 'Anuluj', 'Kontynuuj');
    
    %funkcja przypisania co się dzieje po wciśnięciu przycisków kontynuuj i anuluj
    switch h
      case 'Kontynuuj'
    
    %kiedy pierwszy dźwięk jest wyższy od drugiego
      if y < y2
        
         %wczytuje i odtwarza
         for k =1
              
             [wave1, fs] = audioread(char(plik));
              [wave2, fs] = audioread(char(plik2));
              %tworzę punkt start i stop dla danego pliku audio
               playerObj1 = audioplayer(wave1,48000);
              start1 = 0.5;
              stop1 = playerObj1.SampleRate * 2;
              play(playerObj1,[start1,stop1]);
              %pausa między dźwiękami przez 1 sekundę
             pause(1);
             %odtwarza drugi dźwięk
             playerObj2 = audioplayer(wave2,48000);
              start2 = 0.5;
              stop2 = playerObj2.SampleRate * 2;
              play(playerObj2,[start2,stop2]);
         endfor
          
          %xyspace liczy odległośc miedzy dźwiękami, find odszukuje index, zmienna b przypisuje znaleziony indeks do indeksu w tablicy interw
          n = xyspace(str, z, z2);
          c = find(polton == n);
          b = interw(1, c);
          
          %pokazuje okno dialogowe input
          [odp, ok] = listdlg("ListString", interw,
                           "SelectionMode", "Single",
                           "Name","Wybierz usłyszany interwał",
                           "ListSize",[500,350], 
                           "CancelString", "Anuluj");

          if (odp == c)
            
              uiwait(msgbox('Poprawnie! Zdobywasz 1 punkt.'));
              score = score + 1;
              
          elseif (odp ~= c)
            
             uiwait(msgbox(['Nie trafiłeś. Poprawny interwał to ', char(b),'.']));
             score1 = score1 +1 ;
          else
             close all;
               
          endif

          %kiedy pierwszy dźwięk jest wyżej od drugiego
      elseif y > y2
         %wczytuje i odtwarza
         for k =1
              
             [wave1, fs] = audioread(char(plik));
              [wave2, fs] = audioread(char(plik2));
              %tworzę punkt start i stop dla danego pliku audio
               playerObj1 = audioplayer(wave1,48000);
              start1 = 0.5;
              stop1 = playerObj1.SampleRate * 2;
              play(playerObj1,[start1,stop1]);
              %pausa między dźwiękami przez 1 sekundę
             pause(1);
             %odtwarza drugi dźwięk
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
                           "Name","Wybierz usłyszany interwał",
                           "ListSize",[500,250], 
                           "CancelString", "Anuluj");

          
          if (odp == c1)
              
              uiwait(msgbox('Poprawnie! Zdobywasz 1 punkt.'))
              score = score + 1;
          elseif (odp ~= c1)
              
              uiwait(msgbox(['Nie trafiłeś. Poprawny interwał to ', char(b1),'.']));
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
    %uiwait(msgbox('Witaj w programie do rozpoznawania interwałów. Po rozpoczęciu testu, zostanie Ci zaprezentowanych 10 dźwięków tworzących 5 interwałów. Twoim zadaniem jest rozpoznanie co to za interwał i wybranie poprawnej opcji z listy. Powodzenia!'));
    uiwait(msgbox('wychodzisz z programu.'));
    close all;
  endif
score_all = score + score1;
waitfor(msgbox(['Opowiedziałeś poprawnie na ', num2str(score), ' z ', num2str(score_all), ' prezentowanych interwałów.']))
close all;

endfunction
