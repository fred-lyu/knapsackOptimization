function parent = InitPop(nPop,nVar)
%INITPOP 初始化第一代种群
%nPop : 种群数
%nVar ： 每个个体的染色体DNA数

%声明parent数组内存空间，每行为每个个体的适应度水平以及对应的DNA数据
parent = cell([nPop,2]);

for i = 1 : nPop
    temp = randi([0 1], 1, nVar);
    parent(i,:) = {FunPack(temp),temp};
end

end

