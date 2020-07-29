% RBF for valence

X = sensor_valence';
T = labels_valence';
mn = min(min(X));
mx = max(max(X));
span  =  mx - mn;
net = newrb(X,T,0.7,span/2);
Y = net(X);
view(net)
figure, plotregression(T,Y)
