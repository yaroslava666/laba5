%=== Завдання #1.1 ===
% Моделювання стаціонарного випадкового процесу
fs = 200;
f0 = 5;
A = 0.5;
D = 0.25;
t=0:1/fs:5; % вектор часу
n = 0:1000-1;
r = randn(size(n))*sqrt(D); %моделюємо шум як вектор випадкових чисел з нормальним розподілом
s = A*cos(2*pi*f0*t);
x=s+r;
figure(1)
subplot(211), plot(x);
title('Stationary signal')
xlabel('t'), ylabel('x(t)');
subplot(212), plot(r);
title('Noise')
xlabel('t'), ylabel('r(t)');

%=== Завдання #1.2 ===
% Обчислення оцінки дисперсії шуму, дисперсії сигналу та відношення шум/сигнал
fprintf('D(s) = %4.3g\n', var(s)) % обчислимо дисперсію сигналу
fprintf('D(r) = %4.3g\n', var(r)) % обчислимо дисперсію шуму
fprintf('D(x) = %4.3g\n', var(x))

%=== Завдання #1.3 ===
% Обчислення незміщеної оцінки АКФ змодельованого процесу
maxlag = fix(5); %максимальна затримка
[r, lags] = xcorr(x, maxlag, 'unbiased'); % функція, що повертає вектор з затримкою, на якій розраховується кореляція
figure(2);
subplot(211),plot(x);
title('White noise')
xlabel('Sample number')
subplot(212),plot(lags,r);
title('Correlation sequence')
xlabel('Lag number') %час затримки,с

%=== Завдання #1.4 ===
% Обчислення зміщеної оцінки АКФ змодельованого процесу 
maxlag = fix(5); %максимальна затримка
[r, lags] = xcorr(x, maxlag, 'biased'); % функція, що повертає вектор з затримкою, на якій розраховується кореляція
figure(3);
subplot(211),plot(x); title('White noise'); xlabel('Sample number')
subplot(212),plot(lags,r); title('Correlation sequence'); 
xlabel('Lag number') %час затримки, с

