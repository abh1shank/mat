 %ou tput input se tf
%wn^2/(s^2+2*zeta*wn+wn^2)
zeta=0.4 %damping factor
wn=5
total_time=5
sample_time=0.01
system=tf([wn^2],[1 2*zeta*wn wn^2])
timeVector=[0:sample_time:total_time];
initialstate=[0;0];
ip_step=ones(size(timeVector));
[simulatedOpStep,timeVectorSimulatedStep]=lsim(system,ip_step,timeVector,initialstate);
figure(1)
p1=plot(timeVectorSimulatedStep,simulatedOpStep);
xlabel('time [s]')
ylabel('StepResponse')
p1.LineWidth=2
grid on;

system_identification=iddata(simulatedOpStep,ip_step,sample_time)
n_poles=2
n_zeros=0
estimatedSystemStep=tfest(system_identification,n_poles,n_zeros);