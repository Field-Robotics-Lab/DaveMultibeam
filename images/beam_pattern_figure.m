% Derek Olson
% Beam pattern illustration

bw = 20*pi/180;
alph = 0.889;
th = linspace(-pi/2,pi/2,1000);
bp = sinc(alph.*sin(th)./bw);

bp_floor = -30;
bp(20*log10(abs(bp)) <=bp_floor) = NaN;

figure(1)
clf
polarplot(th,20*log10(abs(bp)),'LineWidth',2)
rlim([bp_floor 5])
ax = gca;
ax.ThetaZeroLocation = 'top';
ax.RAxisLocation = -90;
% ax.ThetaTick = [(0:10:60) (360 - 60:10:350)];
ax.ThetaTick = [-90 :10:90];

thetalim([-90 90])

thTick = ax.ThetaTick;
thTick(thTick > 180) = -(180 - thTick(thTick > 180) + 180);
for ii = 1 : length(thTick)
    thTL{ii} = num2str(thTick(ii));
end

% ax.ThetaTickLabel = thTL;

ax.RAxis.TickValues = [ -20 -10 -3 0];

hold on
polarplot(bw*[1 1]/2,[bp_floor -3],'--','LineWidth',2,'Color',standardColorOrder(2))

% polarplot(0*[1 1],[bp_floor 0],'k-','LineWidth',2)


polarplot(-bw*[1 1]/2,[bp_floor -3],'--','LineWidth',2,'Color',standardColorOrder(2))
polarplot(linspace(-bw/2,bw/2,100),-10*ones(1,100),'LineWidth',2,'Color',standardColorOrder(5))

polarplot(linspace(-bw/2,0,100),-3*ones(1,100),'LineWidth',2,'Color',standardColorOrder(4))
txt = text(0,-10 + 1.5,'$\theta_{{bw}}$');
tSize = 20;
txt.Interpreter = 'latex';

txt.FontSize = tSize;
txt.Color = standardColorOrder(5);

txt = text(-bw/10,-3 + 1,'$\theta_{{w}}$');
txt.Interpreter = 'latex';
txt.FontSize = tSize;
txt.Color = standardColorOrder(4);

txt = text(bw/4,1,'Main Lobe','FontSize',16);
txt = text(-28*pi/180,-12,'Side Lobe','FontSize',16);
txt = text(40*pi/180,-10,'Side Lobe','FontSize',16);

rruler = ax.RAxis;
rruler.Label.String = 'Beam Pattern [dB re max]';
rruler.Label.FontSize = 16;

text(10*pi/180,9,'Azimuthal Angle [Deg]','FontSize',16)

% thruler = ax.ThetaAxis;
% thruler.Label.String = 'Azimuthal Angle [Deg]';




print('-dpng','beam_pattern_plot_w_annotations')
print('-depsc','beam_pattern_plot_w_annotations')
savefig('beam_pattern_plot_w_annotations')