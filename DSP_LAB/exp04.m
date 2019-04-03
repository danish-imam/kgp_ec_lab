var=2;
N=20000;
xn=var*randn(1,N);
yn=filter([1],[1,-.9,0.81,-.729],xn);
M=2048;
L=8;
D=0;
xp=zeros(L,M);
for j= 0:L-1
    %xp(j+1,:)=yn(1,1+j*(M-D):M+j*(M-D));
    xp(j+1,:) = yn(1, 1+j*D:M+j*D);
end
wn=hanning(M)';
U=1/M*sum(wn.^2);
pxx=zeros(L,M);
for i= 1:L
    pxx(i,:)=1/M/U*fftshift((abs(fft(xp(i,:).*wn))).^2);
end
pxxf=sum(pxx)/L;
plot(1:M,smooth(smooth(smooth(smooth(pxxf)))));


t=xcorr(xp(2,:),xp(2,:));
rxx=t(M:2*M-1);
B=zeros(M-1,M-1);
for i=1:M-1
    for j=1:M-1
        B(i,j)=rxx(abs(i-j)+1);
    end
end
A=-inv(B)*rxx(2:M)';
sigma_2=rxx(1)+sum(rxx(2:M).*A);
figure;
freqz([sigma_2],conv([1 A'],[1 A']),[-pi:0.001:pi]);
