function [avg_time,a,b] = supermarket2(avg_arrive_interval, avg_transaction_time, shopping_time, cashiers, shoppers, sims)
times = [];
for n = 1:sims
    [~, in_market_times, ~] = supermarket1(avg_arrive_interval, avg_transaction_time, shopping_time, cashiers, shoppers);
    times = [times, in_market_times];
end
avg_time = sum(times)/(sims*shoppers);
%hist(times, 200)
%xlabel('Time (Minutes)');
%ylabel('Number of Customers');
%title(sprintf('%d', cashiers) + " Cashiers");
[a,b] = hist(times, 200);
