N = 1000;

%2.A
faces = [1 2 3 4];
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


%2.B
figure(1)
histogram(roll, 4, 'Normalization', 'probability');

theoretical_pdf = p;

figure(2);
bar(1:4, theoretical_pdf);

% 2.C
figure(4);

bar(cumsum(p))
hold on
bar(1:4, p, 'LineWidth', 1.5); % Plotting the theoretical PDF on top
hold off