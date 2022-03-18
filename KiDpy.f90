! *****************************COPYRIGHT*******************************
! (C) Crown copyright Met Office. All rights reserved.
! For further details please refer to the file COPYRIGHT.txt
! which you should have received as part of this distribution.
! *****************************COPYRIGHT*******************************
!
! Driver for 1D Kinematic Driver (KiD) model 
!
! Author: Ben Shipway
!
! For version details see header_data.f90
!f2py -c -m kidpy KiDpy.f90 obj/*.o   -I/home/grecu/netcdf-gfortran2//include -L/home/grecu/netcdf-gfortran2//lib -lnetcdff -lnetcdf

module pykid
  integer :: ntimes_py
  real :: time_py
  integer :: nx_py, nz_py
end module pykid
subroutine initKiD
  Use runtime, only : time, time_step, n_times
  Use main
  use pykid
  use parameters
  call init_loop
  ntimes_py=n_times
  nx_py=nx
  nz_py=nz
end subroutine initKiD

subroutine pyloop
  Use main
  use pykid
  Use runtime, only : time, time_step, n_times
  
  call main_loop
  time_py=time
end subroutine pyloop


subroutine write_diag
  Use diagnostics,   only : save_diagnostics_1d, save_diagnostics_2d, &
       write_diagnostics, query_dgstep
  Use switches
  if (l_write_dgs) call write_diagnostics
end subroutine write_diag
