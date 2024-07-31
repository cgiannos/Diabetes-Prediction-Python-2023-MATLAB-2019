pin = readtable('C:\Users\Giannos\Desktop\thewria apofasewn\diabetes.csv');
for i=1:8 
    norm(:,i)=2.*mat2gray(table2array(pin(:,i)))-1;  
end

norm(:,9) = table2array(pin(:,9));   
for j=1:200
    for C=1:5:200   %gia to kalytero c
        [~,accuracyC(j,C)]=trainClassifierSVM(norm,C,0.5);
    end
end

C = find(mean(accuracyC)==max(mean(accuracyC)));  
for j=1:200
    for gamma=0.5:0.5:10  
        [~,accuracygamma(j,1+gamma*10)]=trainClassifierSVM(norm,C,gamma);
    end
end
gamma = (find(mean(accuracygamma)==max(mean(accuracygamma)))-1)/10; 
[classifier,akriveia] = trainClassifierSVM(data,C,gamma);








    