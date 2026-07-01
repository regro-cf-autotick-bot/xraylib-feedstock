program test_xraylib

use, intrinsic :: iso_c_binding
use :: xraylib
implicit none

real (c_double) :: weight, energy

call XRayInit()

weight = AtomicWeight(26)
write (*, '(A,F12.6)') 'Fortran: AtomicWeight(Fe) = ', weight
if (abs(weight - 55.850_c_double) .gt. 1e-3_c_double) then
    WRITE (*, '(A)') 'Fortran: unexpected AtomicWeight value'
    call exit(1)
endif

end program test_xraylib
