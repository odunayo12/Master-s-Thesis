N = 10000;
% best N = 10000;
T=7; %Terminal Point
n=20; %number of partitions
lambda = T/n;  
u = rand(1,N-1);
delta_X = -log(1-u)/lambda;%generates an exponential distribution
%disp(delta_X)
t = zeros(1,N);
t(1) = 0;
for i = 1:N-1
    t(i+1)= t(i) + delta_X(i); %generates the random time
end
%disp(t(i+1))

syms x; %defining 'x' as a symbol for symbolic manipulation
a = @(x) cos(x); %setting a(X(t)) = cos(X(t)) with an anonymous function

Y = zeros(1,N);
Y_0 = 1;
Y(1) = Y_0;
for i = 1:N-1
    Y(i+1)= Y(i) + a(Y(i))*delta_X(i);%
end
%disp(Y(i+1))

h = plot(t, Y, '-');
set(h, 'Markersize', 20)
xlabel('t');
ylabel('Y(t)');
%title("Trajectories of the Euler Poisson Scheme")
