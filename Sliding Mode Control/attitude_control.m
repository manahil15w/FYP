function op = attitude_control(u)
global I tuning_parameter

Ix = I(1,1);
Iy = I(2,2);
Iz = I(3,3);

dphi = u(1);
dtht = u(2);
dpsi = u(3);

s1 = u(4);
s2 = u(5);
s3 = u(6);
s = [s1; s2; s3];

dang = [dphi;dtht;dpsi];
alpha = [(Iy-Iz)*dpsi*dtht/Ix; (Iz-Ix)*dpsi*dphi/Iy; (Ix-Iy)*dphi*dtht/Iz] + tuning_parameter*dang;
beta = inv(I);
gain = 5;
k1 = gain;
k2 = gain;
k3 = gain;
k = [k1; k2; k3];
seq1 = [-k1*sign(s1); -k2*sign(s2); -k3*sign(s3)];
seq2 = -k.*(s./(abs(s) + 1));

% seq3 = -k.*abs(s).*s;
% seq4 = -k.*s;

seq5 = -k.*(s./(abs(s) + exp(-abs(s)/1)));
% seq6 = -k.*(s./(abs(s) + 1 + (1 - exp(-abs(s)))));
seq6 = -k.*(s./(abs(s) + 2 - exp(-abs(s))));
op = inv(beta)*(-alpha + seq6);
end