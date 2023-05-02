B = 10; u = 2;
KT = u*B./x;
N = 100000; 
uz = zeros(1,N); A = zeros(1,N); E = zeros(1,N); H = zeros(1,N);
Sumuz = zeros(1,size(x,2)); sumz = zeros(1,size(x,2)); uzprom = zeros(1,size(x,2)); 
Z = zeros(1,size(x,2)); D = zeros(1,size(x,2)); 
for i =1:1:size(x,2)

for c = 1:1:N
uz(c) = u*(2*rand - 1); E(c) = -B*uz(c);
A(c) = uz(c).*exp(-E(c)./KT(i)); H(c) = exp(-E(c)./KT(i));
end
Sumuz(i) = sum(A); sumz(i) =  sum(H);
uzprom(i) = Sumuz(i)/N; Z(i) = sumz(i)/N; D(i) = uzprom(i)/Z(i);
end
TEO = u*(coth(x) - 1./x);

plot(x,TEO,'LineWidth',2,'Color','#FF0000');hold on; 
plot(x,D,'o','MarkerEdgeColor','#7E2F8E','MarkerFaceColor','#7E2F8E');grid on;
legend('Curva teorico','Monte Carlo'); xlabel('x'); ylabel('<u_z>')
