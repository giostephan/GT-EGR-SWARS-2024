  function keyDownListener(~,event)    
  global quitGame;
    switch event.Key
      case 'q'
        quitGame = true;
    end
  end