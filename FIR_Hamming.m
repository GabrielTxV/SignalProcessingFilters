% Parâmetros do filtro
N = 5; % Número de coeficientes (ordem+1)
wc1 = pi/6; % Frequência de corte inferior
wc2 = pi/3; % Frequência de corte superior

% Resposta ao impulso ideal
n = 0:N-1;
hd = 2 * (sin(wc2*n) - sin(wc1*n)) ./ (pi*n);
hd(1) = 2 * (wc2 - wc1) / pi; % Ajuste para n = 0 (divisão por zero)

% Janela de Hamming
hamming_window = hamming(N)';

% Filtro FIR aplicando a janela de Hamming
h = hd .* hamming_window;

% Resposta em frequência do filtro
[H, w] = freqz(h, 1, 1024, 'whole');
H = H(1:512); % Apenas metade do espectro (frequências positivas)
w = w(1:512);

% Plotando a resposta em frequência
figure;
plot(w/pi, abs(H));
title('Resposta em Frequência do Filtro FIR');
xlabel('Frequência Normalizada (\times \pi rad/sample)');
ylabel('Magnitude');
grid on;
%% 
% Parâmetros do filtro
N = 5; % Número de coeficientes (ordem + 1)
wc = pi/4; % Frequência de corte

% Resposta ao impulso ideal
n = -(N-1)/2:(N-1)/2;
h_ideal = (sin(wc*n)./ (pi*n)).^2;
h_ideal((N+1)/2) = wc/pi; % correção para n = 0

% Janela Triangular
triangular_window = triang(N)';

% Filtro FIR aplicando a janela triangular
h = h_ideal .* triangular_window;

% Resposta em frequência do filtro
[H, w] = freqz(h, 1, 1024);
H = abs(H);

% Plotando a resposta em frequência
figure;
plot(w/pi, H);
title('Resposta em Frequência do Filtro FIR com Janela Triangular');
xlabel('Frequência Normalizada (\times \pi rad/sample)');
ylabel('Magnitude');
grid on;
%% 
% Parâmetros do filtro
N = 5; % Número de coeficientes (ordem + 1)
wc = pi/2; % Frequência de corte

% Resposta ao impulso ideal
n = -(N-1)/2:(N-1)/2;
h_ideal = sin(wc * n) ./ (pi * n);
h_ideal((N+1)/2) = wc / pi; % correção para n = 0

% Janela de Hann
hann_window = hann(N)';

% Filtro FIR aplicando a janela de Hann
h = h_ideal .* hann_window;

% Resposta em frequência do filtro
[H, w] = freqz(h, 1, 1024);
H = abs(H);

% Plotando a resposta em frequência
figure;
plot(w/pi, H);
title('Resposta em Frequência do Filtro FIR com Janela de Hann');
xlabel('Frequência Normalizada (\times \pi rad/sample)');
ylabel('Magnitude');
grid on;

