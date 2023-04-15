function y = MutatePop(x,mu,mn)
%MUTATEPOP 单点变异函数
%x : 待变异的染色体
%mu : 单点变异的概率

for i = 1 : mn
    %rand为一个0-1之间的伪随机数
    if rand <= mu
        n = numel(x);
        s = randi([1,n]);

        if x(s) == 0
            x(s) = 1;
        else
            x(s) = 0;
        end
    end
end

y = x;

end

