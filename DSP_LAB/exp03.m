N = 512 ;
fs = 10000 ;
t = (0:N)*(1/fs) ;
prompt = 'Enter input: ';
ch = input(prompt, 's');
[a, b, v] = find(keypad==ch);%a and b gives the row index

keypad = ['1','2','3','A'; '4','5','6','B'; '7','8','9','C'; '*','0','#','D'];
F = [ 697, 770, 852, 941  ;  1209, 1336, 1477, 1633 ];
x = cos(2*pi*F(1,a)*t) + cos(2*pi*F(2,b)*t);
plot(t, x);

y = zeros(2,4) ;
 L=100;
 n = 0:L-1;
 
 for i = 1:2
     for j = 1:4
        h = cos(2*pi*(n/fs)*F(i,j)); %filter
        z = conv(x,h,'same'); %filtered signal
        y(i,j)=rms(z); %somewhat proportional to energy
     end
 end

[M,ind1] = max(y(1,:));
F1 = F(1,ind1);
[M,ind2] = max(y(2,:));
F2 = F(2,ind2);

disp(keypad(ind1,ind2));