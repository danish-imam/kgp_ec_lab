                            %Question 1(a)%
fs=12000;
i=1;
for n=[64,128,256]
    t=(0:n-1)/fs;
    x=10*cos(2*pi*10^3*t)+6*cos(2*pi*2*10^3*t)+2*cos(2*pi*4*10^3*t);
    w=fft(x,n);
    w=abs(w)/n;
    w=fftshift(w);
    f = (fs/2)*linspace(-1,1,n);
    figure(i);
    plot(f,w);
    xlabel('frequency');
    ylabel('fourier transform');
    i=i+1;
end

              %Question 1(b)%
i=1;
for fs = [8000,5000,4000]
	for n=[64,128,256]
		t=(0:n-1)/fs;
		x=10*cos(2*pi*10^3*t)+6*cos(2*pi*2*10^3*t)+2*cos(2*pi*4*10^3*t);
		w=fft(x,n);
		w=abs(w)/n;
		w=fftshift(w);
		f = (fs/2)*linspace(-1,1,n);
		figure(i);
		plot(f,w);
		xlabel('frequency');
		ylabel('fourier transform');
		i=i+1;
	end
end
                         %question 1(c)%
fs = 20000 ;
f = 1000 ;
n = 256 ;
t = (0 : n-1)/fs ;
x = square(2*pi*f*t) ;
w=fft(x,n);
w=abs(w)/n;
w=fftshift(w);
f = (fs/2)*linspace(-1,1,n);
plot(f,w);
xlabel('frequency');
ylabel('fourier transform');


						%question 1(d)%
f1 = 2; f2 = 5 ;    
fs1 = 12000;           % initial sampling frequency
N1 = 64;            
t = (0:N1-1)/fs1;
x = cos(2*pi*f1*10^3*t) + cos(2*pi*f2*10^3*t) ;  % signal sampled with fs1
figure(1)
plot(x)
grid on
title('original sampled signal')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fs2 = 24000;               %  desired sampling frequency            
N2 =128;
t = (0:N2-1)/fs2;
w = cos(2*pi*f1*10^3*t) + cos(2*pi*f2*10^3*t) ;  % signal sampled with fs2
figure(2)
plot(w)
grid on
title('desired sampled signal')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k = 2 ;                      %  up-sampling factor
y = upsample(x,k);           %  inserting k-1 zeros
figure(3)
plot(y)
grid on
title('upsampled signal')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fc = 6000;                   %  cut-off frequency of filter
Ff = (k*fs1)/2;              %  filter frequency
[b,a] = butter(1,fc/Ff);     %  butterworth filter of 1st order
z = filter(b,a,y);           %  implementing the butterworth
figure(4)
plot(z)
grid on
title(' filter output')