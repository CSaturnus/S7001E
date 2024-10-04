num_samples = 10000;
uniform_samples = rand(num_samples, 12);  
gaussian_samples = sum(uniform_samples, 2) - 6;  

bin_width = 0.1; % 20/0.1 = 200 (=) 200 bins
bin_edges = -10:bin_width:10; 
histogram(gaussian_samples, 'BinEdges', bin_edges, 'Normalization', 'pdf'); 

hold on;  

x_values = -10:0.1:10; 
mu = 0;  
sigma = 1;  
theoretical_gaussian = (1/(sigma * sqrt(2*pi))) * exp(-((x_values - mu).^2) / (2 * sigma^2));

plot(x_values, theoretical_gaussian, 'LineWidth', 2);  

xlabel('Value');
ylabel('Probability Density');
grid on;