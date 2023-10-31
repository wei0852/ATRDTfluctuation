clear,clc

RP=atringparam('RING', 2.2e9);
RP2=atringparam('RING', 2.2e9);

atring1 =[{RP};sevenBA(1)];
atring2 = [{RP2};sevenBA(14)];

rdt1 = computeRDT(atring2,1)
[RDT2,buildupRDT_cell,natural_fluct_cell] = computeRDTfluctuation(atring1, 'nslices', 1.0, 'nperiods', 14);
RDT2
[RDT3,buildupRDT_ring,natural_fluct_ring] = computeRDTfluctuation(atring2, 'nslices', 1.0, 'nperiods', 1);
RDT3

rdt_keys = {'h21000' 'h30000' 'h10110' 'h10020' 'h10200' 'h20001' 'h00201' 'h10002' 'h31000' 'h40000' 'h20110' 'h11200' 'h20020' 'h20200' 'h00310' 'h00400'};
for i=1:16
    key = rdt_keys{1,i};
    subplot(4,4,i)
    scatter(real(buildupRDT_ring.(key)), imag(buildupRDT_ring.(key)), '.')
    title(key)
    xlabel('real')
    ylabel('imag')
end
pause

fields = fieldnames(buildupRDT_ring);
for i=1:length(fields)
    k = fields(i);
    key=k{1};
    figure(i)
    [xo, yo] = stairs(buildupRDT_cell.s, abs(buildupRDT_cell.(key)), '*r');
    [xo2, yo2] = stairs(buildupRDT_ring.s, abs(buildupRDT_ring.(key)));
    plot(xo, yo, '*r')
    hold on
    plot(xo2, yo2, 'b')
    title(key)
    pause
end
fields = fieldnames(natural_fluct_ring);
for i=1:length(fields)
    k = fields(i);
    key=k{1};
    figure(i+30)
    [xo, yo] = stairs(natural_fluct_cell.s, abs(natural_fluct_cell.(key)), '*r');
    [xo2, yo2] = stairs(natural_fluct_ring.s, abs(natural_fluct_ring.(key)));
    plot(xo, yo, '*r')
    hold on
    plot(xo2, yo2, 'b')
    title(key)
    pause
end
