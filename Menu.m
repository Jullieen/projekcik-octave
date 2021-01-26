clc;
clear;
close all;

sel = 0;
while(sel != 5)
  my_options = {"Rozpoznawanie wysokoœci dŸwiêku", "Rozpoznawanie interwa³ów", "Rozpoznawanie akordów", "Instrukcja obslugi", "Wyjdz"};
  [sel, ok] = listdlg ("ListString", my_options,
                       "SelectionMode", "Single",
                       "Name","Program do kszta³cenia s³uchu",
                       "ListSize",[400,250], 
                       "CancelString", "Anuluj");
  if (sel == 1)
    rozpoznawanie_wysokosci(0, 0, 0)
  elseif (sel == 2)
    interwaly()
  elseif (sel == 3)
    akordy_v2(0, 0, 0)
  elseif (sel == 4)
    waitfor(msgbox ("To jest instrukcja obs³ugi programu do kszta³cenia s³uchu. \n Masz do wyboru 3 modu³y: \n 1. Æwiczenia rozpoznawania wysokoœci dŸwiêków \n 2. Æwiczenie rozpoznawania interwa³ów \n 3. Æwiczenie rozpoznawania akordów \n Mo¿esz wybraæ modu³ treningowy z listy w menu g³ównym", "Instrukcja obs³ugi"));
  else 
    close all;
  endif
endwhile