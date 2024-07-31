pin = readtable('C:\Users\giannos\Desktop\machine\thewria apofasewn\diabetes.csv');
for i=1:8 
    norm(:,i)=2.*mat2gray(table2array(pin(:,i)))-1;  
end
norm(:,9) = table2array(pin(:,9));  

for j=1:200 
    for num_n=3:10  
        [~,accuracy(j, num_n)] = trainClassifierKNN(norm,num_n);
    end
end
k = find(mean(accuracy)==max(mean(accuracy))); 
[classifier,akriveia] = trainClassifierKNN(norm,k);
 fit = classifier.predictFcn(norm(2,1:end-1));