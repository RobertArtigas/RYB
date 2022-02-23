!ABCIncludeFile(_RYB_)

OMIT('_EndOfInclude_',_GlobalClass)

_GlobalClass_ EQUATE(1)

  INCLUDE('EQUATES.CLW'),ONCE
  INCLUDE('ERRORS.CLW'),ONCE
  INCLUDE('CWSYNCHM.INC'),ONCE
  INCLUDE('CWSYNCHC.INC'),ONCE

!================================================================
GlobalClass   CLASS(CriticalSection),MODULE('GlobalClass.clw'),LINK('GlobalClass.clw')  !,_RYBLink_),DLL(_RYBDLL_)
!================================================================
!-- Properties
WhatAmI              STRING('GlobalClass')
ShowDebug            BYTE(FALSE)
!-- Methods
Construct            PROCEDURE()
Destruct             PROCEDURE()
SetDebug             PROCEDURE(BYTE pShowDebug)
Debug                PROCEDURE(STRING pMsg)
WhatAmI              PROCEDURE(),STRING
LockGetIt            PROCEDURE(STRING pFromWhere)
LockLetGo            PROCEDURE(STRING pFromWhere)
                END!GlobalClass

! _EndOfInclude_

