hold off
LEL=@(t) 3-0.75/327.6*(t-25); %t : degrees celcius
UEL=@(t) 19+0.75/327.6*(t-25); %t : same;

LEL=@(t) 3-0.8*10^-3
line([12.8 365], [LEL(12.8) LEL(36.5)],'LineWidth',3)
% line([12.8 365], [UEL(12.8) UEL(36.5)],'LineWidth',3)
hold on

% for dosu=17.8:10:95.6
dosu=17.8;
water=350*(1-dosu/100); %ml
ethanol=350*(dosu/100);
n=76;
A=(0.75/2)^2*pi+0.99*10^-2; % m^2
V=2.3*330.579*1000*0.02; %m^3*1000L/m^3 -> L
%input-===========================
de=0.789;
water=water/18.01*n; %mol
ethanol=ethanol*de/46.08*n; %mol


y1=[];
y2=[];
y1(1)=water; %mol
y2(1)=ethanol; %mol
dy1=[];
dy2=[];
T=[];

pw=0.0230; %atm
pe=0.0574; %atm

T(1)=298.15; %K

NA=6.022*10^23;
mw=18.01/NA/1000; %kg
me=46.08/NA/1000; %kg
kb=1.38064852*10^-23;  %m^2 kg/ s^2 K
Rj=8.314;


R=0.08206; %atm L / K mol

equilibrium_ethanol=[];
aw=1;
ae=1;
dt=0.01;
len=1;
for t=13:10:365
    T(len)=t+273.15;
    len=len+1;
    for i=1:20000
        xw=y1(i)/(y1(i)+y2(i));
        xe=y2(i)/(y1(i)+y2(i));
        cw1=(xw*pw-pw*0.45*0-(y1(1)-y1(i))/V*R*T(len-1))*101325;
        ce1=(xe*pe-(y2(1)-y2(i))/V*R*T(len-1))*101325;
        dy1(i)=A*cw1/sqrt(2*pi*(mw*kb*T(len-1)))/NA*aw*dt;
        dy2(i)=A*ce1/sqrt(2*pi*(me*kb*T(len-1)))/NA*ae*dt;
        
        y1(i+1)=y1(i)-dy1(i);
        y2(i+1)=y2(i)-dy2(i);
        
        if y1(i+1)<=0 && y2(i+1)<=0
        y1(i+1:100001)=0;
        y2(i+1:100001)=0;
        break;
        else
            if y1(i+1)<0
                y1(i+1)=0;
            end
            if y2(i+1)<0
                y2(i+1)=0;
            end
        end
    end
%     equilibrium_ethanol(len-1)=(y2(1)-y2(20000))/(y1(1)-y1(20000)+y2(1)-y2(20000)+V/R/t)*100;
    equilibrium_ethanol(len-1)=(y2(1)-y2(20000))/(y1(1)-y1(20000)+V/R/t)*100;
    e_e(len-1)=y2(20000)/(y1(20000)+y2(20000))*100;
    y1=[];
    y2=[];
    y1(1)=water; %mol
    y2(1)=ethanol; %mol
    dy1=[];
    dy2=[];
end
plot(T-273.15,equilibrium_ethanol,'LineWidth',2)
hold on
% end
% hold off

