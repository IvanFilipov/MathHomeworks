F = '((1-2*t)*cos(t) + (1+2*t)*sin(t))';
F_inl = inline(F, 't');

q = '2*t';
q_inl = inline(q,'t');

a = 0;
b = pi;

N = 100;

m1 = -1;
m2 = -1;

[xi yi] = progonka(F_inl, q_inl, a, b, m1, m2, N);

[xi_h2 yi_h2] = progonka(F_inl, q_inl, a, b, m1, m2, N*2);

[xi_h4 yi_h4] = progonka(F_inl, q_inl, a, b, m1, m2, N*4);

yH = yi(1:N);
yH2 = yi_h2(1:2:2*N);
yH4 = yi_h4(1:4:4*N);

alpha =  log( abs ( (yH - yH2) ./ (yH2 - yH4) ))/log(2);

printFormat = [xi(1:N)' yH' yH2' yH4' alpha']


