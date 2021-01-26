clc;
clear;
close all;

sel = 0;
while(sel != 5)
  my_options = {"Rozpoznawanie wysoko�ci d�wi�ku", "Rozpoznawanie interwa��w", "Rozpoznawanie akord�w", "Instrukcja obslugi", "Wyjdz"};
  [sel, ok] = listdlg ("ListString", my_options,
                       "SelectionMode", "Single",
                       "Name","Program do kszta�cenia s�uchu",
                       "ListSize",[400,250], 
                       "CancelString", "Anuluj");
  if (sel == 1)
    rozpoznawanie_wysokosci(0, 0, 0)
  elseif (sel == 2)
    interwaly()
  elseif (sel == 3)
    akordy_v2(0, 0, 0)
  elseif (sel == 4)
    waitfor(msgbox ("To jest instrukcja obs�ugi programu do kszta�cenia s�uchu. \n Masz do wyboru 3 modu�y: \n 1. �wiczenia rozpoznawania wysoko�ci d�wi�k�w \n 2. �wiczenie rozpoznawania interwa��w \n 3. �wiczenie rozpoznawania akord�w \n Mo�esz wybra� modu� treningowy z listy w menu g��wnym", "Instrukcja obs�ugi"));
  else 
    close all;
  endif
endwhile