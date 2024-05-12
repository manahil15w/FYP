function op =attitude_control(u)
global I

Kpphi=625;Kdphi=50;
Kptht=625;Kdtht=50;
Kppsi=625;Kdpsi=50;

phic=u(1);
pc=u(4);
thtc=u(2);
qc=u(5);
psic=u(3);
rc=u(6);

phi=u(7);
p=u(10);
tht=u(8);
q=u(11);
psi=u(9);
r=u(12);

op=I*[Kpphi*(phic-phi)+Kdphi*(pc-p);
    Kptht*(thtc-tht)+Kdtht*(qc-q);
    Kppsi*(psic-psi)+Kdpsi*(rc-r)];

end