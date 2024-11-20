function playSound()
% playSound loads a ".wav" file and plays sound 
[y,fs] = audioread('laser_x.wav'); % read audio file ('laser_x.wav')
sound(y,fs); % play sound

%           **call function whenever you want to play/use the sound effect**
%   for i = 0:inf
 %      playSound();
 %      pause(0.5);
%   end
