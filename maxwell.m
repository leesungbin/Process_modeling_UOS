kb=1.38064852*10^-23;
t=293.15;
m=18.01/(6.022*10^23)/1000;
% 
% f=@(c) (4*pi*c.^2.*(m/(2*pi*kb*t))^(3/2)).*exp(-m.*c.^2/(2*kb*t));
% kk=@(c) c.*f(c);
% e=integral(kk,0,10000)
% kk2=@(c) c.^2.*f(c);
% e2=integral(kk2,0,10000);
% sigma=sqrt(e2-e^2)
% range=0:.1:2000;
% plot(range,f(range),'-k','LineWidth',6);
% int=integral(kk,0,10000)


 f=@(c) 8.1988*10^-6.*c.^2.*exp(-2.3632*10^-4.*c.^2);
 range=0:.1:500;
 plot(range,f(range),'-ok')
 int=integral(f,2058,10000)
% 
% hold on;
% 
% m=44/(6.022*10^23)/1000;
% f=@(c) (4*pi*c.^2.*(m/(2*pi*kb*t))^(3/2)).*exp(-m.*c.^2/(2*kb*t));
% plot(range,f(range));
% hold off
% 
% eqn='2/sqrt(pi)*erfc(65*sqrt(x))+65*exp((-4225*x)/(2*x))-0.01==0';
% solve(eqn,x)

% % syms f(x);
% syms g(x);
% g(x)=erfc(65*sqrt(x));
% range=0:.0001:1;
% k=g(range);
% % f(x)=2/sqrt(pi).*k+65*exp((-4225*x/(2*x)))-0.01;
% f=2/sqrt(pi).*k+65*exp((-4225.*range./(2.*range)))-0.01;
% plot(range,f,'-ok')

% min=0.0008106;
% max=0.0008107;
% range=min:.0000000001:max;
% k=g(range);
% f=2/sqrt(pi).*k+65*exp((-4225.*range./(2.*range)))-0.01;
% plot(range,f,'-ok')
% for i = 1:length(range)
%     if f(i)<0
%         range(i)
%         break
%     end
% end