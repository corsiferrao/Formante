%% ------------------------------------------------------------------------ 
%       Rafael Corsi - rafael.corsi@maua.br
%       Núcleo de Sistemas Eletrônicos Embarcados - NSEE
% 
%       Sinais & Sistemas - Analise de Formantes
%       Parte 1 - Trabalhando com arquivos e áudios
%
%                                                       12/03/2015 - vA1
% -------------------------------------------------------------------------

%% Inicio

% configura codificacao do arquivo
feature('DefaultCharacterSet', 'UTF8');

% limpa dados e figuras
clear all;

% adiciona ao caminho de busca do matlab a pasta com os Audios
addpath('Audios');

%% Carregar arquivos de audio
% Dica:
%   utilize a funçao: audioread para carregar o áudio de uma vogal 
%   e salve em uma variavel os dois retornos (y, Fs)
%
% Perguntas : 
%   - Qual o tamanho do vetor audio criado ?
%       R. L = size(y,1);
%   - O que Fs diz sobre o dado ?
%       R. Fs é a taxa de amostragem (quantos pnts por segundo)
%   - Com base nessas duas informações, qual a duração da reproducão ?
%       R. t = L/Fs;

name   = 'A1.mp3';

[y Fs] = audioread(name);

L = size(y,1);

%% Reprodução
% reproduza o áudio com a funcao: 

player = audioplayer(y, Fs);
play(player);

%% Plot
% plote o sinal temporal do áudio
% Dica
%   - Devemos gerar um vetor t com base na taxa de amostragem Fs e no
%   tamanho do dado, para ajusta a escala X do gráfico.

 plot(y);


%% Plot com escala X correta

figure
 t = (1:size(y,1))/Fs;                  % duracao total
 plot(t, y);                            % plota
 title(['Audio Original - ' name])
 xlabel('s'); ylabel('A');

%% Trabalhando com o dado
% Poderemos notar que no começo da gravação o áudio ainda não está estável,
% podemos eliminar essa parte para obtermos um resultado mais preciso.
% Desenvolva um método para isso e crie um novo vetor com esse resultado.

half = size(y,1)/2;
y  = y(half-half/2:half+half/2);

%% Plot
% plote o sinal temporal do novo vetor

figure
 t = (1:size(y,1))/Fs;
 plot(t, y);
 title(['Audio Cortado - ' name])
 xlabel('s'); ylabel('A');


%% Analise em frequência
% plote o Fourier (fft) do sinal capturado
% Dica:
%   utilize a função fft(), porém alguns cuidados devem ser
%   tomados, para abrir um exemplo de utilização digite:
%       doc fft

figure
    Fs = Fs;              % Sampling frequency
    Ts = 1/Fs;            % Sample time
    L = size(y,1);        % Length of signal

    NFFT = 2^nextpow2(L);            % Next power of 2 from length of y
    Y = fft(y,NFFT)/L;               % Calcula FFT
    f = Fs/2*linspace(0,1,NFFT/2+1); % Ajusta frequencia

    stem(f,2*abs(Y(1:NFFT/2+1)))     % plota resutltado
    title(['Fourier Audio - ' name]);
    xlabel('Hz'); ylabel('|A|');
    
%% Analise em frequência - Foco até 3Khz

figure
    Fs = Fs;              % Sampling frequency
    Ts = 1/Fs;            % Sample time
    L = size(y,1);        % Length of signal

    NFFT = 2^nextpow2(L);             % Next power of 2 from length of y
    Y = fft(y,NFFT)/L;                % Calcula FFT
    f = Fs/2*linspace(0,1,NFFT/2+1);  % Ajusta frequencia
    
    xf = find(f >= 3000,1);           % encontra index da freq. >= 3k Hz

    stem(f(1:xf),2*abs(Y(1:xf)))      % plota resutltado
    title(['Fourier Audio - ' name]);
    xlabel('Hz'); ylabel('|A|');
        
%% Formantes
% Analise as duas princiapis formantes F1 e F2 do áudio, em quais 
% frequências elas estão ?

F1 = 112;
F2 = 226;
