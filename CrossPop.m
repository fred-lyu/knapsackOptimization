function [y1,y2] = CrossPop(x1,x2)
%CROSSPOP 对传入的染色体分段进行多次交叉
%y1、y2 : 交叉后的染色体
%x1、x2 : 交叉前的染色体

%计算出单个染色体DNA数
n = numel(x1);

%代表最大允许m次交叉
m = randi([1, n]);
%m = 1;
for i = 1 : m 
    %随机选出一个交叉点
    s = randi([1, n-1]);

    %代表最多允许第s个DNA后的k个染色体进行交叉
    k = n - s;
    k = randi([1, k]);

    %进行交叉
    if k == 1
        y1 = [x1(1:s) x2(s+1:end)];
        y2 = [x2(1:s) x1(s+1:end)];
    else
        y1 = [x1(1:s) x2(s+1:s+k) x2(s+k+1:end)];
        y2 = [x2(1:s) x1(s+1:s+k) x1(s+k+1:end)];
    end

end

end

