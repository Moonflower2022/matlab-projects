function [money_out_hist,outcome_hist,q_hist] = reality2(rounds,stat_strat,money_in,alpha)

Nplayers = numel(stat_strat);
money_out_hist = zeros(rounds,Nplayers);
outcome_hist = zeros(rounds,1);
q_hist = zeros(rounds,1);
[money_out,outcome,q] = reality1(stat_strat,money_in,alpha);
money_out_hist(1,:) = money_out;
outcome_hist(1) = outcome;
q_hist(1) = q;
for k = 2:rounds
    [money_out,outcome,q] = reality1(stat_strat,money_out_hist(k-1,:),alpha);
    money_out_hist(k,:) = money_out;
    outcome_hist(k) = outcome;
    q_hist(k) = q;
end

%plot(money_out_hist);