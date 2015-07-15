%% Example for SWA_MILP function
clear,close all
A(:,:,1) = [1 0.095;-25 -2];
A(:,:,2) = [1 0.1;-22.5 -2];
B(:,:,1) = [0; 1];
B(:,:,2) = [0; 1];
C(:,:,1) = [1 0];
C(:,:,2) = [1 0];
D(:,:,1) = 0;
D(:,:,2) = 0;
sys = StateSpace(A,B,C,D,[0 0;0 0],[0 0],inf,inf,zeros(2,2),1,inf,inf);
T = 100;
input = 10*randn(1,T);
switchseq = randi(2,1,T);
[y,p_noise,m_noise,switchseq]=simulates(sys,input,T,[],0,...
    0.5,0,switchseq);

Decision = SWA_MILP(sys,y,input,inf,1000,[10 100],0.3, 'cplex')

