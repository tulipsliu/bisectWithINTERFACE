!***************************************************************************************************
! Graduate Student:  Daniel Tulpen Liu
! Date:              Jul 17, 2024. Wednesday
!          Bisect searching ||  INTERFACE
!***************************************************************************************************

PROGRAM MAIN
USE KINDTYPE
USE USOLVE
USE IFPORT
!----------------------
INTEGER :: itermax
REAL(DP) :: a, b, fa, fb, fx
!----------------------------------------------------
  time_start  = DCLOCK() 
! set initial guesses and function values
  a = 0.05_dp
  b = 0.25_dp
  
  CALL bisection(a, b, fa, fb, fx)

  time_stop   = DCLOCK() 
  PRINT*,'Time Elapsed: ',time_stop - time_start

END PROGRAM MAIN
