function perf = myfun(x,t)
%create a network
hiddenLayerSize=15;
net=fitnet(hiddenLayerSize);
xx=x'; tt=t';
net.trainParam.showWindow = 0;
% train the network
[net,tr]=train(net,xx,tt);
% test the network
y=net(xx);
perf=perform(net,tt,y);
end