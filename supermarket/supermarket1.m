function [queue_times, in_market_times, avg_time, a, b] = supermarket1(avg_arrive_interval, avg_transaction_time, shopping_time, cashiers, shoppers)
%unit is minutes
transaction_times = exprnd(avg_transaction_time, 1, shoppers);
arrive_intervals = exprnd(avg_arrive_interval, 1, shoppers);
arrive_times = zeros(1, shoppers);
if shoppers < cashiers
    queue_times(:) = 0;
    in_market_times = transaction_times + shopping_time;
    avg_time = sum(in_market_times)/shoppers;
    return
end
for n = 1:shoppers
    arrive_times(n) = sum(arrive_intervals(1:n));
end
queue_times = zeros(1, shoppers);
cashier_availability = arrive_times(1:cashiers) + shopping_time;

queue_times(1:cashiers) = 0;
queue = [];
k = 1+cashiers;
while k <= shoppers
    [M, min_index] = min(cashier_availability);
    
    if arrive_times(k) + shopping_time > M
        if isempty(queue) == 1
            cashier_availability(min_index) = arrive_times(k) + shopping_time + transaction_times(k);
            queue_times(k) = 0;
        else
            while arrive_times(k) + shopping_time > min(cashier_availability) & isempty(queue) == 0
                cashier_availability(min_index) = M + transaction_times(queue(1));
                queue_times(queue(1)) = cashier_availability(min_index) + transaction_times(queue(1)) - arrive_times(queue(1));
                queue(1) = [];
                [M, min_index] = min(cashier_availability);
            end
            k = k - 1;
        end
    else
        queue = [queue, k];
    end
    k = k + 1;
end
while isempty(queue) == 0
    [M, min_index] = min(cashier_availability);
    cashier_availability(min_index) = M + transaction_times(queue(1));
            
    queue_times(queue(1)) = cashier_availability(min_index) + transaction_times(queue(1)) - arrive_times(queue(1));
    queue(1) = [];
end
in_market_times = shopping_time + transaction_times + queue_times;
avg_time = sum(in_market_times)/shoppers;
