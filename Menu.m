clc;
clear;
close all;

sel = 0
while(sel != 5)
  my_options = {"Rozpoznawanie wysoko�ci d�wi�ku", "Rozpoznawanie interwa��w", "Rozpoznawanie akord�w", "Instrukcja obslugi", "Wyjdz"};
  [sel, ok] = listdlg ("ListString", my_options,
                       "SelectionMode", "Single",
                       "Name","Program do kszta�cenia s�uchu",
                       "ListSize",[400,250], 
                       "CancelString", "Anuluj");
  if (sel == 1)
    rozpoznawanie_wysokosci(0, 0)
  elseif (sel == 2)
    
  elseif (sel == 3)
    
  elseif (sel == 4)
    waitfor(msgbox ("To jest instrukcja obs�ugi programu do kszta�cenia s�uchu. Wybierz modu� treningowy z listy", "Instrukcja obs�ugi"));
  else 
    close all;
  endif
endwhile