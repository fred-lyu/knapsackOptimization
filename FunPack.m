function y = FunPack(x)
%FUNPACK 背包问题适应度函数计算，即不同染色体分布对应的包内物体价值
%x : 染色体
%y : 背包物体价值

%初始化问题参数空间
MaxW = 100;                             %背包最大容量
% wi = [40 50 30 10 10 5 40 30 20 15];    %每个物品的重量1
% pi = [40 60 10 10 15 3 20 15 40 20];    %每个物品的价值1
% wi = [40 20 30 17 14 5 13 11 22 10];    %每个物品的重量2
% pi = [20 27 24 10 15 3 20 15 40 15];    %每个物品的价值2
% wi = [16 25 36 17 14 5 13 11 6 10];    %每个物品的重量3
% pi = [20 23 33 28 15 2 20 15 9 14];    %每个物品的价值3
% wi = [13 18 14 16 10 12 17 11 19 15];    %每个物品的重量4
% pi = [20 23 13 28 15 7 11 21 7 6];    %每个物品的价值4
wi = [27 25 23 21 29 27 25 22 26 30];    %每个物品的重量5
pi = [22 29 34 26 40 36 23 26 39 19];    %每个物品的价值5
a = pi./wi;                             % 每个物品的性价比

w = 0;
y = 0;
n = numel(x);
for i =1 : n
    if  x(i)
        w = w + wi(i);
        y = y + pi(i);
    end
end

%如果超过背包最大容量，给予惩罚:y=-10
if w > MaxW
    y = -10;
end

end

