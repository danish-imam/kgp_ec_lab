clear all;close all;
mu=10^-4;
err_max=10^-3;
fs=3000;
t=0:1/fs:(100/fs);
N=length(t);
m=2*sin(2*pi*1000*t);
n=normrnd(0,1,[1,length(m)]);
X=m+n;
w=zeros(N,1);
error=1;
x=zeros(N,1);
x_new=zeros(N,1);
i=1;
while(error>err_max)
    y=w'*x;
    e=X(i)-y;
    w_new=w+mu*x*e;
    if(i==1) error=1;
    else error=(sumsqr(w_new-w))/(sumsqr(w));
    end
    w=w_new;
    x_new(1)=X(i);
    %x(1) = X(i);
    for k=2:N
        x_new(k)=x(k-1);
    end
    x=x_new;
    i=i+1;
end
figure(1);
f=(fs/2)*linspace(-1,1,512);
plot(f,(abs(fftshift(fft(w,512)))).^2);
%plotting the noisy signal
figure(2);
plot(t,X);
title('Input signal containing sine wave added with noise');
xlabel('t');
ylabel('x(t)');
%plotting the output of filter
figure(3);
plot(t,filter(w,1,X));
title('Output of filter');
xlabel('t');
ylabel('y(t)');