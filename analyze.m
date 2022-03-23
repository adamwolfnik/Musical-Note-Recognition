clc
clear all

% Read audio file
file='test_song_shakira.mp3';
[x,fs]=audioread(file);
w = notewindows(x);
num_notes=length(w)-1
Ns = length(x);
t = (1/fs)*(1:Ns); 
Xk = abs(fft(x));
f = fs*(0:Ns-1)/Ns; 


% plot the waveform of the signal
xk=Xk/max(Xk);
%plot the Fourier transform of the signal
figure(1)
subplot(2,1,1);
plot(t, x,'color','blue')
xlabel('Time (s)')
ylabel('Amplitude')
title('Input Audio Signal');
subplot(2,1,2);
plot(f, xk)
hold on
xlim([0 6500])
ylim([0,1.1])
xlabel('Frequency (Hz)')
ylabel('Normalisied Amplitude')
title('Magnitude spectrum of FFT');

%Note Initialisation   
mainNames = char('C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B');
names = char('A0', 'A#0' ,'B0');
A0 = 27.5;
ind = 4;
for i = 0:87
    data(i+1) = A0 * (2^(1/12))^i;
    if i>2
         a = [mainNames( rem((ind - 4), 12)+1,:)  num2str(fix((ind - 4)/12)+1)];
         names = char(names, a);
         ind = ind + 1;
    end
end

% Band Initialization
bands(1) = 20;
for i = 1:87
    bands(i+1) = +7+(data(i) + data(i+1))/2;
end
bands(89) = 4500;

% Bands
    for i=1:88
        freqBand(i) = mean(Xk( round(bands(i)/(fs/Ns) ):round(bands(i+1)/(fs/Ns))))^2;
        freqband(i)=freqBand(i);
    end
    
% Print the result
    for i=1:num_notes
    
    m = find(freqband == max(freqband(:)));
    disp(names(m,:))
    freqband=freqband(freqband~=max(freqband));
    end
    
hold off