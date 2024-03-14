function [proportion] = reality3(sims, round_per_sim,stat_strat,alpha)
wins = 0;
for n = 2:sims
    [money_out_hist,outcome_hist,q_hist] = reality2(round_per_sim,stat_strat,[100, 100],alpha);
    %wins = wins + money_out_hist(end, 1) / sum(money_out_hist(end,:));
    if money_out_hist(end, 1) == money_out_hist(end, 2)
        wins = wins + 0.5;
    elseif money_out_hist(end, 1) > money_out_hist(end, 2)
        wins = wins + 1;
    else end
end
proportion = wins / sims;
