N = 10000;

p = [1/6 1/6 1/6 1/6 1/6 1/6 ]; % probability of each face
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

%1.A
Prob_roll
total_Prob_roll = sum(Prob_roll)

%1.B
figure(1)
histogram(roll, 6, 'Normalization', 'probability');

theoretical_pdf = ones(1, 6) * 1/6;

figure(2);
bar(1:6, theoretical_pdf);
%1.C

figure(3);
histogram(roll, 6, 'Normalization', 'probability'); % Normalizing as a PDF
hold on;
bar(1:6, theoretical_pdf, 'LineWidth', 1.5); % Plotting the theoretical PDF on top
hold off
