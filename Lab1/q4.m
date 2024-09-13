N = 100;

p = [0.001 0.999]; % probability of transmission success transmission error
P = [0 cumsum(p)] ;
Transmission = zeros(N,1); % vector to hold results of each Transmission
% (the memory is "pre-allocated" in this
% way to speed up Matlab processing


for i=1:N % loop over number of Transmission
    x=rand(1,1);
    for j=2:length(P), % determine result of each Transmission
        if( (P(j-1)<x) & (x<P(j)) )
            Transmission(i) = j-1;
            break
        end
    end
end

Prob_signal = zeros(1,length(p));

for i=1:length(p)
    Prob_signal(1,i) = length(find(Transmission==i))/N;
end

Prob_signal