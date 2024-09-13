N = 1000;

p = [0.1 0.2 0.4 0.3]; % probability of each face
P = [0 cumsum(p)] ;
roll = zeros(N,1); % vector to hold results of each roll
% (the memory is "pre-allocated" in this
% way to speed up Matlab processing
for i=1:N % loop over number of rolls
    x=rand(1,1);
    for j=2:length(P), % determine result of each roll
        if( (P(j-1)<x) & (x<P(j)) )
            roll(i) = j-1;
            break
        end
    end
end

Prob_roll = zeros(1,length(p));

for i=1:length(p)
    Prob_roll(1,i) = length(find(roll==i))/N;
end

Prob_roll
total_Prob_roll = sum(Prob_roll)

figure(1)
histogram(roll,4)

figure(2)
x=linspace(1,4,1000)
y = pdf('Normal',x,mean(roll),std(roll))
plot(x,y)

figure(3)
histogram(roll,4,'Normalization','pdf')
hold on
plot(x,y)
hold off

