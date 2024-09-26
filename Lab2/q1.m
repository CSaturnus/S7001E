N = 10000; %Number of points
U = rand(N, 1); %Uniform random numbers

%a)
%Inverse CDF for triangular distribution
X = zeros(N, 1);
for i = 1:N
    if U(i) <= 0.5
        X(i) = -1 + sqrt(2 * U(i));
    else
        X(i) = 1 - sqrt(2 * (1 - U(i)));
    end
end

%b)
figure;
histogram(X, 'Normalization', 'pdf');
hold on;

x = linspace(-1, 1, 100); 
pdf_theoretical = zeros(size(x));
for i = 1:length(x)
    if x(i) < 0
        pdf_theoretical(i) = 1 + x(i);
    else
        pdf_theoretical(i) = 1 - x(i);
    end
end

plot(x, pdf_theoretical, 'LineWidth', 2);
xlabel('x');
ylabel('PDF');
hold off;
