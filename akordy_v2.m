function [odp_poprawne, odp_laczne] = akordy_v2 (odp_poprawne_2, odp_laczne_2, oktawa)
  
  
  if(oktawa == 0)
    oktawy = {"Kontra", "Wielka", "Ma≥a", "Razkreúlna", "Dwukreúlna", "Trzykreúlna"}
    [numer_oktawy, ok] = listdlg("ListString", oktawy,
                         "SelectionMode", "Single",
                         "Name","Wybierz oktawÍ pierwszego klawisza",
                         "ListSize",[400,250], 
                         "CancelString", "Anuluj");
  else
    numer_oktawy = oktawa;
  endif
  
  odstep_1 = randi([3,4]);
  odstep_2 = randi([3,4]);
  if (numer_oktawy == 6)
    numer_nuty = randi([1, (12-odstep_1-odstep_2)]);
  else
    numer_nuty = randi([1,12]);
  endif
  
  nuta_1 = 3 + numer_oktawy * 12 + numer_nuty;
  nuta_2 = nuta_1 + odstep_1;
  nuta_3 = nuta_2 + odstep_2;
  nuty = [nuta_1, nuta_2, nuta_3];
  zagraj(nuty)
  rodzaje_akordow={"Dur", "Mol", "Zmniejszony", "ZwiÍkszony"}
  [odp, ok] = listdlg("ListString", rodzaje_akordow,
                       "SelectionMode", "Single",
                       "Name","Wybierz us≥yszany akord",
                       "ListSize",[400,250], 
                       "CancelString", "Anuluj");
  if(odstep_1 == 4)
    if(odstep_2 == 3)
      poprawna_odp = 1;
    else
      poprawna_odp = 4;
    endif
  else
    if(odstep_2 = 3)
      poprawna_odp = 3;
    else
      poprawna_odp = 2;
    endif
  endif
  
  odp_poprawne = odp_poprawne_2;
  odp_laczne = odp_laczne_2 + 1;
  if(odp == poprawna_odp)
    waitfor(msgbox(["Poprawnie! To by≥ akord", rodzaje_akordow(poprawna_odp)]))
    odp_poprawne = odp_poprawne + 1
  else
    waitfor(msgbox(["èle! To by≥ akord", rodzaje_akordow(poprawna_odp)]))
  endif  
  
  temp = questdlg("Czy chcesz kontynuowaÊ?", "Ponownie?","Tak", "Nie", "Zmiana oktawy", "Nie");
  if (strcmp(temp, "Tak"))
    akordy_v2(odp_poprawne, odp_laczne, numer_oktawy)
  elseif (strcmp(temp, "Nie"))
    waitfor(msgbox(["Odpowiedzia≥eú poprawnie na ", num2str(odp_poprawne), " z ", num2str(odp_laczne), " testÛw"]))
  else
    akordy_v2(odp_poprawne, odp_laczne, 0)
  endif
endfunction
