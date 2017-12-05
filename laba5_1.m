%=== �������� #1.1 ===
% ����������� ������������� ����������� �������
fs = 200;
f0 = 5;
A = 0.5;
D = 0.25;
t=0:1/fs:5; % ������ ����
n = 0:1000-1;
r = randn(size(n))*sqrt(D); %��������� ��� �� ������ ���������� ����� � ���������� ���������
s = A*cos(2*pi*f0*t);
x=s+r;
figure(1)
subplot(211), plot(x);
title('Stationary signal')
xlabel('t'), ylabel('x(t)');
subplot(212), plot(r);
title('Noise')
xlabel('t'), ylabel('r(t)');

%=== �������� #1.2 ===
% ���������� ������ ������� ����, ������� ������� �� ��������� ���/������
fprintf('D(s) = %4.3g\n', var(s)) % ��������� �������� �������
fprintf('D(r) = %4.3g\n', var(r)) % ��������� �������� ����
fprintf('D(x) = %4.3g\n', var(x))

%=== �������� #1.3 ===
% ���������� �������� ������ ��� �������������� �������
maxlag = fix(5); %����������� ��������
[r, lags] = xcorr(x, maxlag, 'unbiased'); % �������, �� ������� ������ � ���������, �� ��� ������������� ���������
figure(2);
subplot(211),plot(x);
title('White noise')
xlabel('Sample number')
subplot(212),plot(lags,r);
title('Correlation sequence')
xlabel('Lag number') %��� ��������,�

%=== �������� #1.4 ===
% ���������� ������ ������ ��� �������������� ������� 
maxlag = fix(5); %����������� ��������
[r, lags] = xcorr(x, maxlag, 'biased'); % �������, �� ������� ������ � ���������, �� ��� ������������� ���������
figure(3);
subplot(211),plot(x); title('White noise'); xlabel('Sample number')
subplot(212),plot(lags,r); title('Correlation sequence'); 
xlabel('Lag number') %��� ��������, �

