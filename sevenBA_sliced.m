function ring=sevenBA_sliced(sext_slices)
    d2r = pi / 180;
    D0 = atdrift('D0', 0.00000);
    D1 = atdrift('D1', 2.650000);
    D1A = atdrift('D1A', 2.475000);
    D1B = atdrift('D1B', 0.075000);
    D2 = atdrift('D2', 0.250000);
    D2A = atdrift('D2A', 0.075000);
    D2B = atdrift('D2B', 0.075000);
    D3 = atdrift('D3', 0.185000);
    D4 = atdrift('D4', 0.200000);
    D5 = atdrift('D5', 0.325000);
    D6 = atdrift('D6', 0.150000);
    D7 = atdrift('D7', 0.150000);
    D8 = atdrift('D8', 0.207000);
    D9 = atdrift('D9', 0.150000);

    Q1 = atquadrupole('Q1', 0.220000, 5.818824);
    Q2 = atquadrupole('Q2', 0.220000, -6.088408);
    Q3 = atquadrupole('Q3', 0.140000, 6.507626);

    B1 = atsbend('B1', 0.750000, 2.294735 * d2r, 0.000000, 'BndMPoleSymplectic4Pass', 'Energy', 2.2e9, 'EntranceAngle', 1.147368 * d2r, 'ExitAngle', 1.147368 * d2r);
    B2 = atsbend('B2', 0.890000, 4.790311 * d2r, -1.482985, 'BndMPoleSymplectic4Pass', 'Energy', 2.2e9, 'EntranceAngle', 2.395155 * d2r, 'ExitAngle', 2.395155 * d2r);
    RB = atsbend('RB', 0.160000, -0.282674 * d2r, 6.229233, 'BndMPoleSymplectic4Pass', 'Energy', 2.2e9, 'EntranceAngle', -0.141337 * d2r, 'ExitAngle', -0.141337 * d2r);

    % the number of slices affects the results of driving terms and higher-order chromaticities
    SF1_1 = atsextupole('SF1', 0.100000 / sext_slices, 98.385000);
    SD1_1 = atsextupole('SD1', 0.100000 / sext_slices, - 105.838000);
    SD2_1 = atsextupole('SD2', 0.150000 / sext_slices, -209.734000);
    SF2_1 = atsextupole('SF2', 0.150000 / sext_slices, 328.795000);
    SD3_1 = atsextupole('SD3', 0.150000 / sext_slices, -261.435000);
    SF3_1 = atsextupole('SF3', 0.150000 / sext_slices, 304.099000);

    SF1 = repmat({SF1_1}, sext_slices, 1);
    SD1 = repmat({SD1_1}, sext_slices, 1);
    SF2 = repmat({SF2_1}, sext_slices, 1);
    SD2 = repmat({SD2_1}, sext_slices, 1);
    SF3 = repmat({SF3_1}, sext_slices, 1);
    SD3 = repmat({SD3_1}, sext_slices, 1);

    CELL = [{D1A}; SF1; {D1B;Q1; D2A}; SD1; {D2B; Q2; D3; B1; D4}; SD2; ...
             {D5; Q3; D6}; SF2; {D7; RB; D8}; SD3; {D9; B2; D9}; SD3;...
             {D8; RB; D6}; SF3; {D7; RB; D8}; SD3; {D9; B2; D9}; SD3;...
             {D8; RB; D6}; SF3; {D7; RB; D8}; SD3; {D9; B2; D9}; SD3; ...
             {D8; RB; D7}; SF3; {D6; RB; D8}; SD3; {D9; B2; D9}; SD3; ...
             {D8; RB; D7}; SF3; {D6; RB; D8}; SD3; {D9; B2; D9}; SD3; ...
             {D8; RB; D7}; SF2; {D6; Q3; D5}; SD2; {D4; B1; D3; Q2; D2B};...
             SD1; {D2A; Q1; D1B}; SF1; {D1A}];
    
    ring = repmat(CELL, 14, 1);
end
