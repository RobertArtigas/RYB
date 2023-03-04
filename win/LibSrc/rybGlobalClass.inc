!Category(_RYB_)
!ABCIncludeFile(_RYB_)
!ClassIncludeFile(_RYB_)

OMIT('_EndOfInclude_',_rybGlobalClass_)

_rybGlobalClass_ EQUATE(1)

  INCLUDE('EQUATES.CLW'),ONCE
  INCLUDE('ERRORS.CLW'),ONCE
  INCLUDE('CWSYNCHM.INC'),ONCE
  INCLUDE('CWSYNCHC.INC'),ONCE

!================================================================
rybGlobalClass      CLASS(CriticalSection),MODULE('rybGlobalClass.clw'),LINK('rybGlobalClass.clw')  !,_RYBLink_),DLL(_RYBDLL_)
!================================================================
!-- Properties
WhatAmI               STRING('rybGlobalClass')
ShowDebug             BYTE(FALSE)
!-- Methods
Construct             PROCEDURE()
Destruct              PROCEDURE()
SetDebug              PROCEDURE(BYTE pShowDebug)
Debug                 PROCEDURE(STRING pMsg)
WhatAmI               PROCEDURE(),STRING
LockGetIt             PROCEDURE(STRING pFromWhere)
LockLetGo             PROCEDURE(STRING pFromWhere)
                    END!rybGlobalClass

! _EndOfInclude_

