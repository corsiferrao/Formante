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

%% Carrega arquivos de audio

vogais = ['AEIOU'];

% Varre pasta e cria variáveis
