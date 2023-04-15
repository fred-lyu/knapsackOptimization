function y = SelectPop(parent)
%SELECTPOP 用二元锦标赛选择被复制的子代
%parent : 被传入的父代

%计算父代种群数
n = size(parent,1);

%随机打乱种群数排序
index = randperm(n);
%选取前两个个体的适应度进行比较，选取较高的个体遗传到子代
if parent{index(1)} < parent{index(2)}
    y = parent(index(2),:);
else
    y = parent(index(1),:);
end

end

