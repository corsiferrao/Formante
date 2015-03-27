function [  ] = fourier_plot(y, Fs, nome )
%% ------------------------------------------------------------------------ 
%       Rafael Corsi - rafael.corsi@maua.br
%       Núcleo de Sistemas Eletrônicos Embarcados - NSEE
% 
%       Sinais & Sistemas - Analise de Formantes
%       Parte 1 - Trabalhando com arquivos e áudios
%
%                                                       12/03/2015 - vA1
% -------------------------------------------------------------------------

half = size(y,1)/2;
y  = y(half-half/2:half+half/2);


figure
 t = (1:size(y,1))/Fs;
 plot(t, y);
 title(['Audio Cortado - ' nome])
 xlabel('s'); ylabel('A');

 figure
    Fs = Fs;              % Sampling frequency
    Ts = 1/Fs;            % Sample time
    L = size(y,1);        % Length of signal

    NFFT = 2^nextpow2(L);             % Next power of 2 from length of y
    Y = fft(y,NFFT)/L;                % Calcula FFT
    f = Fs/2*linspace(0,1,NFFT/2+1);  % Ajusta frequencia
    
    xf = find(f >= 3000,1);           % encontra index da freq. >= 3k Hz

    stem(f(1:xf),2*abs(Y(1:xf)))      % plota resutltado
    title(['Fourier Audio - ' nome]);
    xlabel('Hz'); ylabel('|A|');


end

