function [] = graph_times()
avg_arrive_interval = 1/5;
avg_transaction_time = 4;
shopping_time = 15;

sims = 1000;
    
plot_data = cell(1, 20); % Enable holding of the current plot

for cashiers = 21:40
    avg_times = zeros(1, 100);
    for shoppers = 1:100
        [avg_time, ~, ~] = supermarket2(avg_arrive_interval, avg_transaction_time, shopping_time, cashiers, shoppers, sims);
        avg_times(shoppers) = avg_time;
    end

    plot_data{cashiers - 20} = avg_times;

end

hold on; % Enable holding of the current plot

for i = 21:40
    plot(1:100, plot_data{i - 20}, 'DisplayName', sprintf('cashiers=%d', i));
end

hold off
    
title('Average Time vs. Number of Customers');
xlabel('Number of Customers');
ylabel('Average Time');
%legend('cashiers=1', 'cashiers=2', 'cashiers=3', 'cashiers=4', 'cashiers=5', 'cashiers=6', 'cashiers=7', 'cashiers=8', 'cashiers=9', 'cashiers=10', 'cashiers=11', 'cashiers=12', 'cashiers=13', 'cashiers=14', 'cashiers=15', 'cashiers=16', 'cashiers=17', 'cashiers=18', 'cashiers=19', 'cashiers=20');
grid on;