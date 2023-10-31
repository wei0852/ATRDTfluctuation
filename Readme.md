Computation of longitudinal RDT fluctuations on AT.
----------------------------

```matlab
[RDT,buildup_fluctuation,natural_fluctuation] = computeRDTfluctuation(ring, varargin)
```

computeRDTfluctuation.m is the function to compute RDT fluctuations, which calls RDTbuildupFluct.m and return three structs.
These functions are based on the Python codes [SimpleStorageRing](https://github.com/wei0852/simplestoragering).


RDTfluctuationIndicator.m is a function that provides one example to quantitatively represents the RDT fluctuations. 
People can try other quantitative representations.

Other files are example scripts.

## Features:
    
* Compute two kinds of longitudinal fluctuations of RDTs. 
    
  See test_RDT.m

* Slice sextupoles. 
  
  The number of sextupole slices affects the calculation of crossing terms, especially the ADTS terms. 
  
  See nslices_affect_result.m

* Faster calculation.
    
  This is because the RDT fluctuation data simplifies the calculation of crossing terms. The number of iterations is reduced from N^2 to N.

  See time_test.m

* multiple periods
  
  This function can calculate RDTs of multiple periods with the fluctuation data of one period.

## Noting:
Two differences between computeRDT and computeRDTfluctuation

* opposite numbers
  
  These are just differences of notations. We don't think it is a problem. Our functions followed the notation in SLS-Note 09/97. Usually we only care about the absolute values.

  
* Initial phases
  
  The initial phase in computeRDT is the average phase of the initial element.
  
  But in computeRDTfluctuation, the initial phase is zero. 
  This is because we think that the starting point should be a point and not a section.

  Therefore, **the results of the two functions agree only when the length of the initial element is 0**.

## Reference

[1] B. Wei, Z. Bai, J. Tan, L. Wang and G. Feng (2023). "Minimizing the fluctuation of resonance driving terms in dynamic aperture optimization." Physical Review Accelerators and Beams 26(8): 084001.

[2] Z. Bai, "Minimizing the fluctuation of resonance driving terms for storage ring dynamic aperture optimization and its implementation on AT." AT Workshop, 2023.10.
