%% Show Ks*pKs^-1 = w_g * Wg
syms theta_g;
Ks = (2/3)*([cos(theta_g), cos(theta_g - (2*pi/3)), cos(theta_g + (2*pi/3)); -sin(theta_g), -sin(theta_g - (2*pi/3)), -sin(theta_g + (2*pi/3)); 0.5, 0.5, 0.5 ]);
Ks_inv = [cos(theta_g), -sin(theta_g), 1; cos(theta_g - (2*pi/3)), -sin(theta_g - (2*pi/3)) 1; cos(theta_g + (2*pi/3)), -sin(theta_g + (2*pi/3)) 1];
pKs_inv = diff(Ks_inv)

fun1 = Ks*pKs_inv
KspKs_inv = simplify(fun1)

%% Show Kr*pKr^-1 = (w_g - w_r)*Wg
syms theta_r;
Kr = (2/3)*([cos(theta_g-theta_r),cos(theta_g-theta_r-(2*pi/3)),cos(theta_g-theta_r+(2*pi/3));-sin(theta_g-theta_r),-sin(theta_g-theta_r-(2*pi/3)),-sin(theta_g-theta_r+(2*pi/3));0.5 0.5 0.5]);
Kr_inv = [cos(theta_g-theta_r),-sin(theta_g-theta_r),1;cos(theta_g-theta_r-(2*pi/3)),-sin(theta_g-theta_r-(2*pi/3)),1;cos(theta_g-theta_r+(2*pi/3)),-sin(theta_g-theta_r+(2*pi/3)),1];
pKr_inv = diff(Kr_inv)

fun2 = Kr*pKr_inv
KrpKr_inv = simplify(fun2)

%% Show Ls = Ks*L_ABCs*Ks_inv
syms Lms Lls;
Lss = Lms + Lls;
L_abcs = [Lss,(-0.5)*Lms,(-0.5)*Lms;(-0.5)*Lms,Lss,(-0.5)*Lms;(-0.5)*Lms,(-0.5)*Lms,Lss];
Ls = Ks*L_abcs*Ks_inv
proof3 = simplify(Ls)

%% Show L'r = Kr*L'_ABCr*Kr_inv
syms Lmr Llr;
Lrr = Lmr + Llr;
L_abcr = [Lrr,(-0.5)*Lmr,(-0.5)*Lmr;(-0.5)*Lmr,Lrr,(-0.5)*Lmr;(-0.5)*Lmr,(-0.5)*Lmr,Lrr];
Lr = Kr*L_abcr*Kr_inv
proof4 = simplify(Lr)

%% Show Ks*L'_ABCsr*Kr_inv = M
L_abcsr = Lms.*[cos(theta_r),cos(theta_r+(2*pi/3)),cos(theta_r-(2*pi/3));cos(theta_r-(2*pi/3)),cos(theta_r),cos(theta_r+(2*pi/3));cos(theta_r+(2*pi/3)),cos(theta_r-(2*pi/3)),cos(theta_r)];
fun5 = Ks*L_abcsr*Kr_inv
proof5 = simplify(fun5)

%% Show Kr*L'_ABCrs*Ks_inv
L_abcrs = Lms.*[cos(-theta_r),cos(-theta_r+(2*pi/3)),cos(-theta_r-(2*pi/3));cos(-theta_r-(2*pi/3)),cos(-theta_r),cos(-theta_r+(2*pi/3));cos(-theta_r+(2*pi/3)),cos(-theta_r-(2*pi/3)),cos(-theta_r)];
fun6 = Kr*L_abcrs*Ks_inv;
proof6 = simplify(fun6)