dosu=89;
water=350*(1-dosu/100); %ml
ethanol=350*(dosu/100);
n=76;
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

pw=0.0230; %atm
pe=0.0574; %atm

T=298.15; %K

NA=6.022*10^23;
mw=18.01/NA/1000; %kg
me=46.08/NA/1000; %kg
kb=1.38064852*10^-23;  %m^2 kg/ s^2 K
Rj=8.314;
A=(0.75/2)^2*pi+0.99*10^-2; % m^2
V=2.3*330.579*1000*0.02; %m^3*1000L/m^3 -> L
R=0.08206; %atm L / K mol

aw=1;
ae=1;
dt=0.01;
for i=1:100000
    xw=y1(i)/(y1(i)+y2(i));
    xe=y2(i)/(y1(i)+y2(i));
    cw1=(xw*pw-pw*0.45-(y1(1)-y1(i))/V*R*T)*101325;
    ce1=(xe*pe-(y2(1)-y2(i))/V*R*T)*101325;
    dy1(i)=A*cw1/sqrt(2*pi*(mw*kb*T))/NA*aw*dt;
    dy2(i)=A*ce1/sqrt(2*pi*(me*kb*T))/NA*ae*dt;
    
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
range=1:100001;
plot(range,y1)
hold on
plot(range,y2);
hold off


na=1*V/R/T;
disp(na*0.03<y2(100000))