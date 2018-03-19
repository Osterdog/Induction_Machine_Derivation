fs = 50; %Hz
wg = 2*pi*fs;
Vxs = 400/(sqrt(3)); %V
Vys = 0;
P = 2; %poles
Rs = 0.12; %Stator Resistance
Rr = 0.02; %Rotor Resistance
Lls = 0.0001; %Stator Leakage Inductance
Llr = 0.0001; %Rotor Leakage Inductance
Lm = 0.01; %Magnetizing Inductance
we = wg;
wr1 = 0.98*we; % 2% slip
wr2 = 0.97*we; % 3% slip
Ls = Lls + Lm;
Lr = Llr + Lm;

load_system('InductionMachine_system')
set_param('InductionMachine_system','SimulationCommand','Start');
%% Calculate Torque
Te = -(3/2)*(P/2)*Lm*((iys*ixr) - (ixs*iyr))
plot(Te)