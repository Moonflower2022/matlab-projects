function [money_out,outcome,q] = reality1(stat_strat,money_in,alpha)
%stat_strat is a vector of the percentage of money_in for each player that
%they bet on HEADS.  money_in is a vector of the money each player has
%coming into this round. 
%Nplayers = 9+unidrnd(41,1,1);
%money_in = 100*ones(1,Nplayers);
%stat_strat = unifrnd(0,1,1,Nplayers);

total_money = sum(money_in);
total_bet_HEADS = stat_strat*money_in'/total_money;
p = total_bet_HEADS;
if p==1
    q = 1;
elseif p==0
    q = 0;
elseif alpha==0
    q = 1/2;
else
    q = 1/2+(1/pi)*atan(pi*alpha*(p-1/2)/(1-(2*p-1)^2));
end
outcome = binornd(1,q,1,1); %1:HEADS, 0:TAILS
if outcome==1
    money_out = total_money*stat_strat.*money_in/(stat_strat*money_in');
elseif outcome==0
    money_out = total_money*(ones(size(stat_strat))-stat_strat).*money_in/(total_money-(stat_strat*money_in'));
else end