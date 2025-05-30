!-----------------------------------------------------------------------
! Solve tridiagonal matrix equation
!-----------------------------------------------------------------------
subroutine TRIDIAG(Nvec,Nmax,a,b,c,r,x)

implicit none

integer, intent(in) :: &
  Nvec,              &! Vector length
  Nmax                ! Maximum vector length

real, intent(in) :: &
  a(Nmax),           &! Below-diagonal matrix elements
  b(Nmax),           &! Diagonal matrix elements
  c(Nmax),           &! Above-diagonal matrix elements
  r(Nmax)             ! Matrix equation rhs

real, intent(out) :: &
  x(Nmax)             ! Solution vector

integer :: n          ! Loop counter 
   
real :: beta, g(Nvec) ! Work space 

beta = b(1)
x(1) = r(1) / beta

do n = 2, Nvec
  g(n) = c(n-1) / beta
  beta = b(n) - a(n)*g(n)
  x(n) = (r(n) - a(n)*x(n-1)) / beta
end do

do n = Nvec - 1, 1, -1
  x(n) = x(n) - g(n+1)*x(n+1)
end do

end subroutine TRIDIAG
