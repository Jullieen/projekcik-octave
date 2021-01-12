function zagraj(nuta)
  M=length(nuta);
  for i=1:M
      strinG=['dzwiekiPianina/' num2str(nuta(i)) '.mat'];
      load(strinG)
      try
          y_sound=y_sound+y;
      catch
          y_sound=y;
      end
  end
  soundsc(y_sound,Fs)
endfunction
