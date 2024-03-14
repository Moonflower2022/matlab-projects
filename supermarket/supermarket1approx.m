function [queue_times, in_market_times, avg_time] = supermarket1approx(avg_arrive_interval, avg_transaction_time, shopping_time, cashiers, shoppers)
%unit is minutes
transaction_times = exprnd(avg_transaction_time/cashiers, 1, shoppers);
arrive_intervals = exprnd(avg_arrive_interval, 1, shoppers);
arrive_times = zeros(1, shoppers);
for n = 1:shoppers
    arrive_times(n) = sum(arrive_intervals(1:n));
end
queue_times = zeros(1, shoppers);

queue_times(1) = 0;
for n = 2:shoppers
    queue_times(n) = max(0, arrive_times(n-1) + queue_times(n-1) + transaction_times(n-1) - arrive_times(n));
end

in_market_times = shopping_time + transaction_times + queue_times;
avg_time = sum(in_market_times)/shoppers;