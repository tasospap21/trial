% Create the plots in each of the four cases: Hinge distance vs simulation
% time: B24-B15 Ca atoms
clc
close all

figa=figure();
figa.OuterPosition=[1400 200 2500 1300];
figa.Color='white';

subplot(3,1,1)
plot(timevar_ins, b24,'k');
set(gca, 'FontSize', 45);
axis([0 600 5.5 10.5])
set(gca,'YTick', 6:3:18);
set(gca,'XTick', 0:150:900);
%axis([0 30 6 13])
xlabel('Simulation time [ns]  [WT-Insulin]','FontSize',45);
ylabel({'B24(C_{a})-B15(C_{a})','Distance [Å]'},'FontSize',45);
ax=gca;
ax.XMinorTick='on';
ax.YMinorTick='on';
ax.FontName='Arial';
%pbaspect([1 0.55 0.7])

subplot(3,1,2)
plot(timevar, B24B15_CA_sb31,'r');
set(gca, 'FontSize', 45);
axis([0 600 5.5 10.5])
set(gca,'YTick', 6:3:18);
set(gca,'XTick', 0:150:900);
%axis([0 30 6 13])
xlabel('Simulation time [ns] [SB31-Insulin]','FontSize',45);
ylabel({'S24(C_{a})-L15(C_{a})','Distance [Å]'},'FontSize',45);
ax=gca;
ax.XMinorTick='on';
ax.YMinorTick='on';
ax.FontName='Arial';
%pbaspect([1 0.55 0.7])

subplot(3,1,3)
plot(timevar, B24B15_CA_skb32,'b');
set(gca, 'FontSize', 45);
axis([0 600 5.5 10.5])
set(gca,'YTick', 6:3:18);
set(gca,'XTick', 0:150:900);
%axis([0 30 0 11])
xlabel('Simulation time [ns] [SKB32-Insulin]','FontSize',45);
ylabel({'F24(C_{a})-L15(C_{a})','Distance [Å]'},'FontSize',45);
ax=gca;
ax.XMinorTick='on';
ax.YMinorTick='on';
ax.FontName='Arial';
%pbaspect([1 0.55 0.7])



%% Put all the plots together and use averages to smooth the data: Hinge distance vs simulation
% time: B24-B15 Ca atoms
close all

sizesb31=length(B24B15_CA_sb31);
sizeskb32=length(B24B15_CA_skb32);

sizeins=length(b24);

stepsb31=20; % 2 7 14
stepskb32=20;
stepins=40;

newhinge_sb31=[];
newhinge_skb32=[];
newhinge_ins=[];

newtimevar=[];
newtimevarins=[];


for i=1:stepskb32:sizeskb32
    value=(sum(B24B15_CA_skb32(i:(i+(stepskb32-1)))))/stepskb32;
    newhinge_skb32=[newhinge_skb32 value];
end

for i=1:stepsb31:sizesb31
    value=(sum(B24B15_CA_sb31(i:(i+(stepsb31-1)))))/stepsb31;
    value2=(sum(timevar(i:(i+(stepsb31-1)))))/stepsb31;
    newhinge_sb31=[newhinge_sb31 value];
    newtimevar=[newtimevar value2];
end

for i=1:stepins:sizeins
    value=(sum(b24(i:(i+(stepins-1)))))/stepins;
    value2=(sum(timevar_ins(i:(i+(stepins-1)))))/stepins;
    newhinge_ins=[newhinge_ins value];
    newtimevarins=[newtimevarins value2];
end



figa=figure();
figa.OuterPosition=[1400 200 1300 1100];
figa.Color='white';

plot(newtimevarins,newhinge_ins,'k','LineWidth',5);
hold on
plot(newtimevar,newhinge_sb31,'r','LineWidth',5);
plot(newtimevar,newhinge_skb32,'b','LineWidth',5);
set(gca, 'FontSize', 55, 'TickLength',[0.025 0.025], 'TickDir','out');
axis([0 600 6 11.5])
set(gca,'YTick', 5:1:14);
set(gca,'XTick', 0:100:1100);
%axis([0 30 6 13])
xlabel('Simulation time [ns]','FontSize',55);
ylabel({'B24(C_{?})-B15(C_{?})','Distance [Å]'},'FontSize',55);
ax=gca;
ax.XMinorTick='on';
ax.YMinorTick='on';
ax.XAxis.MinorTickValues = 0:25:900;
ax.YAxis.MinorTickValues = 0:0.5:35;
ax.FontName='Arial';
legend({'WT','S^{B31}','S^{B31}K^{B32}'},'FontSize',55,'Location','northwest','Orientation','Horizontal');
%pbaspect([1 0.6 0.7])


% This is a new comment in MAtlab
