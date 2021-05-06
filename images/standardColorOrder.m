function colorDef = standardColorOrder(n)
% USAGE colorDef = standardColorOrder(n);
% returns the rgb values for the standard color order. This definition has
% up to 7 colors

% standardColors = ...
%    [     0         0    1.0000;
%          0    0.5000         0;
%     1.0000         0         0;
%          0    0.7500    0.7500;
%     0.7500         0    0.7500;
%     0.7500    0.7500         0;
%     0.2500    0.2500    0.2500];

standardColors = ...
        [    0    0.4470    0.7410
    0.8500    0.3250    0.0980
    0.9290    0.6940    0.1250
    0.4940    0.1840    0.5560
    0.4660    0.6740    0.1880
    0.3010    0.7450    0.9330
    0.6350    0.0780    0.1840];

numSC = size(standardColors , 1);
colorDef = standardColors(mod(n-1,numSC)+1,:);
end