% This script shows that the number of sextupole slices affects
% the calculation of the RDTs.
% 
% For the 3rd-order RDTs, the deviation of different number of sextupole
% slices is small.
%
% For the 4rd-order RDTs, the deviation is large.
%
% For h22000, h11110 and h00220, which drive amplitude-dependent tune
% shifts, the results can be quite different.

clear, clc
for nslices=1:8
    cell = sevenBA_sliced(nslices);
    RP=atringparam('CELL', 2.2e9);
    atcell =[{RP};cell];
    RDT = computeRDT(atcell, 1);
    h21000(nslices) = abs(RDT.h21000);
    h30000(nslices) = abs(RDT.h30000);
    h10110(nslices) = abs(RDT.h10110);
    h10020(nslices) = abs(RDT.h10020);
    h10200(nslices) = abs(RDT.h10200);
    h20001(nslices) = abs(RDT.h20001);
    h00201(nslices) = abs(RDT.h00201);
    h10002(nslices) = abs(RDT.h10002);
    h22000(nslices) = real(RDT.h22000);
    h11110(nslices) = real(RDT.h11110);
    h00220(nslices) = real(RDT.h00220);
    dnuxdJx(nslices) = real(RDT.dnux_dJx);
    dnuxdJy(nslices) = real(RDT.dnux_dJy);
    dnuydJy(nslices) = real(RDT.dnuy_dJy);
    h31000(nslices) = abs(RDT.h31000);
    h40000(nslices) = abs(RDT.h40000);
    h20110(nslices) = abs(RDT.h20110);
    h11200(nslices) = abs(RDT.h11200);
    h20020(nslices) = abs(RDT.h20020);
    h20200(nslices) = abs(RDT.h20200);
    h00310(nslices) = abs(RDT.h00310);
    h00400(nslices) = abs(RDT.h00400);
end

h21000 = h21000 / h21000(end);
h30000 = h30000 / h30000(end);
h10110 = h10110 / h10110(end);
h10020 = h10020 / h10020(end);
h10200 = h10200 / h10200(end);
h20001 = h20001 / h20001(end);
h00201 = h00201 / h00201(end);
h10002 = h10002 / h10002(end);
h22000 = h22000 / h22000(end);
h11110 = h11110 / h11110(end);
h00220 = h00220 / h00220(end);
dnuxdJx = dnuxdJx / dnuxdJx(end);
dnuxdJy = dnuxdJy / dnuxdJy(end);
dnuydJy = dnuydJy / dnuydJy(end);
h31000 = h31000 / h31000(end);
h40000 = h40000 / h40000(end);
h20110 = h20110 / h20110(end);
h11200 = h11200 / h11200(end);
h20020 = h20020 / h20020(end);
h20200 = h20200 / h20200(end);
h00310 = h00310 / h00310(end);
h00400 = h00400 / h00400(end);

figure(1)
set(gca,'FontName','Times New Rome','FontSize',50);
plot(h21000, 'DisplayName', 'h21000')
hold on
plot(h30000, 'DisplayName', 'h30000')
hold on
plot(h10110, 'DisplayName', 'h10110')
hold on
plot(h10020, 'DisplayName', 'h10020')
hold on
plot(h10200, 'DisplayName', 'h10200')
hold on
plot(h20001, 'DisplayName', 'h20001')
hold on
plot(h00201, 'DisplayName', 'h00201')
hold on
plot(h10002, 'DisplayName', 'h10002')
xlabel('number of sextupole slices', 'FontSize', 20)
ylabel('RDT (relative value)', 'FontSize', 20)
legend
set(gca,'FontName','Times New Rome','FontSize',20);
axis([1, 8, 0.95, 1.05])

figure(2)
plot(h31000, 'DisplayName', 'h31000')
hold on
plot(h40000, 'DisplayName', 'h40000')
hold on
plot(h20110, 'DisplayName', 'h20110')
hold on
plot(h11200, 'DisplayName', 'h11200')
hold on
plot(h20020, 'DisplayName', 'h20020')
hold on
plot(h20200, 'DisplayName', 'h20200')
hold on
plot(h00310, 'DisplayName', 'h00310')
hold on
plot(h00400, 'DisplayName', 'h00400')
xlabel('number of sextupole slices', 'FontSize', 20)
ylabel('RDT (relative value)', 'FontSize', 20)
legend
set(gca,'FontName','Times New Rome','FontSize',20);
axis([1, 8, 0.7, 1.4])

figure(3)
plot(h22000, 'DisplayName', 'h22000')
hold on
plot(h11110, 'DisplayName', 'h11110')
hold on
plot(h00220, 'DisplayName', 'h00220')
hold on
plot(dnuxdJx, 'DisplayName', 'dnux/dJx')
hold on
plot(dnuxdJy, 'DisplayName', 'dnux/dJy')
hold on
plot(dnuydJy, 'DisplayName', 'dnuy/dJy')
hold on
xlabel('number of sextupole slices', 'FontSize', 20)
ylabel('RDT (relative value)', 'FontSize', 20)
legend
set(gca,'FontName','Times New Rome','FontSize',20);
axis([1, 8, -0.5, 1.5])

