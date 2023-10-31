% This script compares the computation time of computeRDT and
% computeRDTfluctuation.
% This script also compares the computation time for different number of
% sextupole slices.
% time of computeRDT ~ nslices^2
% time of computeRDTfluctuation ~ nslices
clear, clc
maxslices = 8;
time_new = zeros(maxslices, 1);
time_old = zeros(maxslices, 1);
n_magnet = zeros(maxslices, 1);
profile on
profile clear
for nslices=1:maxslices
    ring = sevenBA_sliced(nslices);
    RP=atringparam('RING', 2.2e9);
    atring =[{RP};ring];
    indDQSO=findcells(ring,'Class','Bend','Quadrupole','Sextupole','Octupole','Multipole');
    n_magnet(nslices)=length(indDQSO);
    tic
    computeRDT(atring, 1);
    time_old(nslices)=toc;
    tic
    computeRDTfluctuation(atring, 'nslices', 1);
    time_new(nslices) = toc;
    % f = @() computeRDT(atring, 1);
    % time_old(nslices) = timeit(f);
    % g = @() computeRDTFluctuation(atring, 'nslices', 1);
    % time_new(nslices) = timeit(g);
end
profile viewer

figure(1)
plot(n_magnet, time_old, 'DisplayName', 'computeRDT')
hold on
plot(n_magnet, time_new, 'DisplayName', 'computeRDTfluctuation')
xlabel('number of magnets')
ylabel('time (s)')
legend
set(gca,'FontName','Times New Rome','FontSize',20);
figure(2)
plot(time_old, 'DisplayName', 'computeRDT')
hold on
plot(time_new, 'DisplayName', 'computeRDTfluctuation')
xlabel('number of sextupole slices')
ylabel('time (s)')
set(gca,'FontName','Times New Rome','FontSize',20);
legend
