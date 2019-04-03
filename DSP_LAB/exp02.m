f = 1000;
fs=5000;
N = 512 ;
k =(N-1)/2;
hd = zeros(1,5*N);
for n= 1:N
        hd(n) = (sin(2*pi*f*(n-k)/fs))/(pi*(n-k)/fs);
end
figure(1)
plot(hd);


%%%%%%%%%%%%%%%%%%%%%%%%%   rectangular   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
w1 =  zeros(1,5*N);
for n= 1:N
       w1(n) = 1;
end
y1 = hd.*w1 ;
figure(2)
plot(20*(log(fftshift(abs(fft(y1)))/max(fftshift(abs(fft(y1)))))/log(10)),'b') ;
title('rectangular window');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%  triangular  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
w2 =  zeros(1,5*N);
for m = 1:N
    if m <= N/2
    w2(m) = 2*(m-1)/(N-1) ; 
    end
    if m >= N/2
    w2(m) = 2-2*(m-1)/(N-1) ;   
    end
end
y2 = hd.*w2 ;
figure(3)
plot(20*(log(fftshift(abs(fft(y2)))/max(fftshift(abs(fft(y2)))))/log(10)),'b') ;
title('triangular window');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%  hanning  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
w3 =  zeros(1,5*N);
for n= 1:N
       w3(n) = 0.5-0.5*cos(2*pi*n/(N-1));
end
y3 =  hd.*w3 ;
figure(4)
plot(20*(log(fftshift(abs(fft(y3)))/max(fftshift(abs(fft(y3)))))/log(10)),'b') ;
title('hanning window');


%%%%%%%%%%%%%%%%%%%%%%%%%%     hamming    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
w4 =  zeros(1,5*N);
for n= 1:N
       w4(n) = 0.54-0.46*cos(2*pi*n/(N-1));
end
y4 =  hd.*w4 ;
figure(5)
plot(20*(log(fftshift(abs(fft(y4)))/max(fftshift(abs(fft(y4)))))/log(10)),'b') ;
title('hamming window');


%%%%%%%%%%%%%%%%%%%%%%%%%    blackmann    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
w5 =  zeros(1,5*N);
for n= 1:N
       w5(n) = 0.42-0.5*cos(2*pi*n/(N-1))+0.08*cos(4*pi*n/(N-1));
end
y5 = hd.*w5 ;
figure(6)
plot(20*(log(fftshift(abs(fft(y5)))/max(fftshift(abs(fft(y5)))))/log(10)),'b') ;
title('blackmann window');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   kaiser   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
w6 =  zeros(1,5*N);
for n= 1:N
       w6(n) = besseli(0,pi*0.5*sqrt(1-((2*n/N-1)-1)^2))/besseli(0,pi*0.5);
end
y6 = hd.*w6 ;
figure(7)
plot(20*(log(fftshift(abs(fft(y6)))/max(fftshift(abs(fft(y6)))))/log(10)),'b') ;
title('kaiser window');


%%%%%%%%%%%%   FIR Implementation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t = (0:5*N-1)*(1/fs);
s = cos(2*pi*0.4*10^3*t) +cos(2*pi*2*10^3*t) +cos(2*pi*0.8*10^3*t) ;
fir_fltr = conv(s,y5,'same');
figure(8);
plot(fir_fltr) ;
figure(9);
plot(s);


%%%%%%%%%%%%%%%%%% Noisy signal(White Noise) with FIR  %%%%%%%%%%%%%%%%%%%%
t = (0:5*N-1)*(1/fs);
r = 3; 
whitenoise = 2*r*rand(1,5*N) - r ; 
s = cos(2*pi*0.5*10^3*t) + whitenoise ; 
fir_fltr = conv(s,y1,'same'); 

figure(10);
plot(abs(fft(fir_fltr)));
title('filtered');
figure(11);
plot(abs(fft(s))) ;
title('noisy signal');
figure(12);
plot(abs(fft(whitenoise)));
title('white noise');

