function [] = graph_times2()
avg_arrive_interval = 1/5;
avg_transaction_time = 4;
shopping_time = 15;

sims = 1000;
shoppers = 100;

hold on

for cashiers = 5:5:35
    [~, a, b] = supermarket2(avg_arrive_interval, avg_transaction_time, shopping_time, cashiers, shoppers, sims);
    semilogy(b, a);
end

% Add legend
legend('5 Cashiers', '10 Cashiers', '15 Cashiers', '20 Cashiers', '25 Cashiers', '30 Cashiers', '35 Cashiers')
xlabel('Time (Minutes)');
ylabel('Number of Customers');