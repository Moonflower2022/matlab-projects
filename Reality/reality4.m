function [matchup_matrix] = reality4(sims, round_per_sim,alpha)
matchup_matrix = zeros(21, 21);
for i = 1:21
    for j = 1:21
        wins = 0;
        stat_strat = ([i, j] - 1) * 0.05;
        for n = 2:sims
            [money_out_hist,outcome_hist,q_hist] = reality2(round_per_sim,stat_strat,[100, 100],alpha);
            wins = wins + money_out_hist(end, 1) / sum(money_out_hist(end,:));
        end
        matchup_matrix(i, j) = wins/sims;
    end
end
imshow(matchup_matrix)