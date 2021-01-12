clc;
clear;
close all;

sel = 0
while(sel != 5)
  my_options = {"Rozpoznawanie wysokoœci dŸwiêku", "Rozpoznawanie interwa³ów", "Rozpoznawanie akordów", "Instrukcja obslugi", "Wyjdz"};
  [sel, ok] = listdlg ("ListString", my_options,
                       "SelectionMode", "Single",
                       "Name","Program do kszta³cenia s³uchu",
                       "ListSize",[400,250], 
                       "CancelString", "Anuluj");
  if (sel == 1)
    rozpoznawanie_wysokosci(0, 0)
  elseif (sel == 2)
    
  elseif (sel == 3)
    
  elseif (sel == 4)
    waitfor(msgbox ("To jest instrukcja obs³ugi programu do kszta³cenia s³uchu. Wybierz modu³ treningowy z listy", "Instrukcja obs³ugi"));
  else 
    close all;
  endif
endwhile