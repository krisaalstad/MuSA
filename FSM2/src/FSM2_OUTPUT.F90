!-----------------------------------------------------------------------
! Write output
!-----------------------------------------------------------------------
subroutine FSM2_OUTPUT(Ncols,Nrows,year,month,day,hour,                &
                       H,LE,LWout,LWsub,Melt,Roff,snd,snw,subl,svg,    &
                       SWout,SWsub,Tsoil,Tsnow,Tsrf,Tveg,Usub,VAI,fsnow,asrf)

#include "OPTS.h"

use IOUNITS, only: &
!  ucan,              &! Subcanopy diagnostics file unit number
!  uflx,              &! Flux output file unit number
  usta                ! State output file unit number

use LAYERS, only: &
  Ncnpy,             &! Number of canopy layers
  Nsoil,             &! Number of soil layers
  Nsmax               ! Maximum number of snow layers

implicit none

integer, intent(in) :: &
  Ncols,             &! Number of columns in grid
  Nrows,             &! Number of rows in grid
  year,              &! Year
  month,             &! Month of year
  day                 ! Day of month

real, intent(in) :: &
  hour,                     &! Hour of day
  H(Nrows,Ncols),           &! Sensible heat flux to the atmosphere (W/m^2)
  LE(Nrows,Ncols),          &! Latent heat flux to the atmosphere (W/m^2)
  LWout(Nrows,Ncols),       &! Outgoing LW radiation (W/m^2)
  LWsub(Nrows,Ncols),       &! Subcanopy downward LW radiation (W/m^2)
  Melt(Nrows,Ncols),        &! Surface melt rate (kg/m^2/s)
  Roff(Nrows,Ncols),        &! Runoff from snow (kg/m^2/s)
  snd(Nrows,Ncols),         &! Snow depth (m)
  subl(Nrows,Ncols),        &! Sublimation rate (kg/m^2/s)
  svg(Nrows,Ncols),         &! Total snow mass on vegetation (kg/m^2)
  snw(Nrows,Ncols),         &! Total snow mass on ground (kg/m^2) 
  SWout(Nrows,Ncols),       &! Outgoing SW radiation (W/m^2)
  SWsub(Nrows,Ncols),       &! Subcanopy downward SW radiation (W/m^2)
  Tsoil(Nsoil,Nrows,Ncols), &! Soil layer temperatures (K)
  Tsnow(Nsmax,Nrows,Ncols), &! Snow layer temperatures (K)
  Tsrf(Nrows,Ncols),        &! Snow/ground surface temperature (K)
  Tveg(Ncnpy,Nrows,Ncols),  &! Vegetation layer temperatures (K)
  Usub(Nrows,Ncols),        &! Subcanopy wind speed (m/s)
  VAI(Nrows,Ncols),         &! Vegetation area index
  fsnow(Nrows,Ncols),       &! Ground snowcover fraction
  asrf(Nrows,Ncols)          ! Snow/ground surface albedo
  
! Subcanopy diagnostic outputs
!if (maxval(VAI) > 0) write(ucan,100) year,month,day,hour,LWsub,SWsub,Usub

! Flux outputs
! write(uflx,100) year,month,day,hour,H,LE,LWout,Melt,Roff,subl,SWout

! State outputs
!write(usta,100) year,month,day,hour,snd,snw,svg,Tsoil,Tsnow,Tsrf,Tveg
    
!write(usta,100) year,month,day,hour,snd,snw,Tsrf,fsnow,asrf, H, LE

!100 format(i4,',',i4,',',i4,',',f8.0,',',e14.6,',',e14.6,',',e14.6,',', &
!           e14.6,',',e14.6,',',e14.6,',',e14.6)

!write(usta) year,month,day,hour,snd,snw,Tsrf,fsnow,asrf, H, LE
write(usta) snd,snw,Tsrf,fsnow,asrf, H, LE

end subroutine FSM2_OUTPUT
