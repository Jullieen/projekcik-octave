function [odp_poprawne, odp_laczne] = rozpoznawanie_wysokosci(odp_poprawne_2, odp_laczne_2)
  tablica = {"c", "cis", "d", "dis", "e", "f", "fis", "g", "gis", "a", "ais", "h"}
  
  oktawy = {"Kontra", "Wielka", "Ma≥a", "Razkreúlna", "Dwukreúlna", "Trzykreúlna"}
  [numer_oktawy, ok] = listdlg("ListString", oktawy,
                       "SelectionMode", "Single",
                       "Name","Wybierz Êwiczonπ oktawÍ",
                       "ListSize",[400,250], 
                       "CancelString", "Anuluj");
  numer_nuty = randi([1,12])
  
  nazwa_pliku = 3 + numer_oktawy * 12 + numer_nuty;
  zagraj(nazwa_pliku)
  [odp, ok] = listdlg("ListString", tablica,
                       "SelectionMode", "Single",
                       "Name","Wybierz us≥yszany düwiÍk",
                       "ListSize",[500,250], 
                       "CancelString", "Anuluj");
  odp_poprawne = odp_poprawne_2
  odp_laczne = odp_laczne_2 + 1
  if (odp == numer_nuty)
    waitfor(msgbox(["Poprawnie! To by≥ düwiÍk",tablica(numer_nuty)]))
    odp_poprawne = odp_poprawne + 1
  else
    waitfor(msgbox(["èle! To by≥ düwiÍk",tablica(numer_nuty)]))
  endif
  
  temp = questdlg("Chcesz sprÛbowaÊ jeszcze raz?", "Ponownie?","Tak", "Nie", "Nie")
  if (temp == "Tak")
    rozpoznawanie_wysokosci(odp_poprawne, odp_laczne)
  else
    waitfor(msgbox(["Odpowiedzia≥eú poprawnie na ", num2str(odp_poprawne), " z ", num2str(odp_laczne), " testÛw"]))
  endif
endfunction
