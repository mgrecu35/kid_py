subroutine getvars(z_o,x_o,exner_o,w_o,v_o,rho_o,theta_o,qv_o,&
nx_o,nz_o)
use column_variables
implicit none
integer :: nx_o,nz_o
real, intent(out) :: z_o(nz_o)
real, intent(out) :: x_o(0:nx_o+1)
real, intent(out) :: exner_o(nz_o, 0:nx_o+1)
real, intent(out) :: w_o(nz_o, 0:nx_o+1)
real, intent(out) :: v_o(nz_o, 0:nx_o+1)
real, intent(out) :: rho_o(nz_o)
real, intent(out) :: theta_o(nz_o, 0:nx_o+1)
real, intent(out) :: qv_o(nz_o, 0:nx_o+1)
z_o=z
x_o=x
exner_o=exner
w_o=w
v_o=v
rho_o=rho
theta_o=theta
qv_o=qv
end subroutine getvars
