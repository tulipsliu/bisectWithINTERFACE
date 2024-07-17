
MODULE USOLVE
INTERFACE
    SUBROUTINE bisection(a,b,fa,fb,fx)
      USE KINDTYPE
      IMPLICIT NONE
      REAL(DP), INTENT(IN) :: a, b
      REAL(DP), INTENT(OUT) :: fa, fb, fx
    END SUBROUTINE bisection
END INTERFACE
END MODULE USOLVE

SUBROUTINE bisection(a,b,fa,fb,fx)
USE KINDTYPE
USE INTFACE, ONLY:umap
REAL(DP), INTENT(IN) :: a,b
REAL(DP), INTENT(OUT) :: fa, fb, fx
!LOCAL VARIABLES
INTEGER :: iter  
REAL(DP) :: x, lb, ub
  !-------------------------------------------------------------------------------------------------
  fa = umap(a)
  fb = umap(b)
  
  ! check whether there is a root in [a,b]
  IF(fa*fb >= 0.0) THEN
    STOP 'error: there is no root in [a,b]'
  END IF  
  
  lb = a
  ub = b
  !--------------------------------------------------------
  DO iter = 1, 30
    x=(lb+ub)/2.0_dp
    fx = umap(x)
    
    write(*,'(i4,f12.7)')iter, abs(x-a)
    
    ! check for convergence
    if(abs(x-lb) < 1d-6)then
        write(*,'(/a,f12.7,a,f12.9)')' x = ',x,'    f = ',fx
        return
    endif
    
        ! calculate new interval
        if(fa*fx < 0d0)then
            ub = x
            fb = fx
        else
            lb = x
            fa = fx
        endif
    
  END DO
    
END SUBROUTINE bisection
!---------------------------------------------------------------------------------------------------
FUNCTION umap(c)
USE KINDTYPE
IMPLICIT NONE
REAL(DP) :: umap
REAL(DP) :: c
  umap = 0.5_dp*c**(-0.2_dp) + 0.5_dp*c**(-0.5_dp) - 2.00_dp
END FUNCTION umap
!---------------------------------------------------------------------------------------------------
