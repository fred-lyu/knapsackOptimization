clc
clear all
close all

%初始化参数
nPop = 50;   %种群数目（影响找到最优值的迭代次数，但也会相应减缓迭代时间）
nVal = 10;   %染色体DNA数（该题为物品数：10）
nSon = floor(nPop/2)*2;   %子代种群数目,向下取偶数
nMu = 0.8;     %变异概率为0.8
nMn = 5;       %变异次数
maxIt = 1000;  %最大迭代次数

parent = InitPop(nPop,nVal);

%数据库在FunPack.m文件中
%记录历史出现的适应度最大的个体  
%        最优染色体            价值
%数据库1：0 1 0 0 1 1 0 0 1 1  138
%数据库2：0 1 0 0 1 1 1 1 1 1  135
%数据库3：1 1 0 1 0 0 1 1 1 1  129
%数据库4：1 1 1 1 1 0 1 1 0 0  131
%数据库5：0 0 1 1 1 0 0 0 1 0  139(重量：99)   /   0 0 1 0 1 0 0 1 1 0  139(重量：100) 
maxPop = parent(1,:);

%迭代找最优解
for i = 1 : maxIt
    %初始化子代种群
    son = cell([nSon,2]);
    %复制种群并交叉
    for j = 1 : nSon/2
        p1 = SelectPop(parent);
        p2 = SelectPop(parent);
       [son(2*j-1,:),son(2*j,:)] = CrossPop(p1,p2);
    end
    %变异种群并计算子代种群适应度
    for k = 1 : nSon
        son{k,2} = MutatePop(son{k,2},nMu,nMn);
        son{k,1} = FunPack(son{k,2});
    end
    %筛选适应度最高的种群个体组成下一代种群
    newPop = [parent; son];

    %对适应度排序，获取排序索引
    index = zeros(1, length(newPop));
    for q = 1 : length(newPop)
        index(q) = newPop{q,1};
    end
    [~,I] = sort(index,'descend');
    
    %对数组排序 
    newPop = newPop(I,:);
    if maxPop{1,1} < newPop{1,1}
        maxPop = newPop(1,:);
    end
    parent = newPop(1:nPop,:);

end

parent
maxPop

