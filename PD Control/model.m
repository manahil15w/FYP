function op=model(u)
global m I g
u1=u(1);
u2=[u(2);u(3);u(4)];
phi=u(5);
tht=u(6);
psi=u(7);

ddx=g*(tht*cos(psi)+phi*sin(psi));
ddy=g*(tht*sin(psi)-phi*cos(psi));
ddz=-g+u1/m;

dBangles=inv(I)*u2;

dp=dBangles(1);
dq=dBangles(2);
dr=dBangles(3);

op=[ddx;ddy;ddz;dp;dq;dr];

end