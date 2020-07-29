% RBF for arousal

X = sensor_arousal';
T = labels_arousal';
mn = min(min(X));
mx = max(max(X));
span  =  mx - mn;
net = newrb(X,T,0.7,span/2);
Y = net(X);
view(net)
figure, plotregression(T,Y)
