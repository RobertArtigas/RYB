  MEMBER
  
  MAP
    MODULE('kernel')
      DebugBreak(),PASCAL !,RAW,NAME('debugbreak')
      OutputDebugString(*CSTRING),PASCAL,RAW,NAME('OutputDebugStringA')  !32-bit only
    END
  END

  INCLUDE('GlobalClass.inc'),ONCE

!-------------------------------------------------------------------
GlobalClass.Construct    PROCEDURE()
!-------------------------------------------------------------------
  CODE
  SELF.Debug('CLASS(' & THREAD() & '): GlobalClass.Construct')
  SELF.ShowDebug  = FALSE
  RETURN

!-------------------------------------------------------------------
GlobalClass.Destruct     PROCEDURE()
!-------------------------------------------------------------------
  CODE
  SELF.Debug('CLASS(' & THREAD() & '): GlobalClass.Destruct')
  SELF.ShowDebug  = FALSE
  RETURN

!-------------------------------------------------------------------
GlobalClass.SetDebug     PROCEDURE(Byte pShowDebug = False)
!-------------------------------------------------------------------
  CODE
  SELF.ShowDebug  = pShowDebug
  RETURN

!-------------------------------------------------------------------
GlobalClass.Debug        PROCEDURE(String pMsg)
!-------------------------------------------------------------------
szMSG   &CSTRING
  CODE
  szMSG &= NEW CSTRING( SIZE(pMsg) + SIZE('<13,10,0>') )
  szMSG  =                   pMsg  &      '<13,10,0>'
  OutputDebugString(szMSG)
  DISPOSE(szMSG)
  RETURN

!-------------------------------------------------------------------
GlobalClass.WhatAmI      PROCEDURE() !,String
!-------------------------------------------------------------------
  CODE
  IF SELF.ShowDebug
    SELF.Debug(SELF.WhatAmI)
  END
  RETURN SELF.WhatAmI

!-------------------------------------------------------------------
GlobalClass.LockGetIt    PROCEDURE(STRING pFromWhere)
!-------------------------------------------------------------------
  CODE
  IF SELF.ShowDebug 
    SELF.Debug('CLASS(' & THREAD() & '): GlobalClass.LockGetIt(' & CLIP(pFromWhere) & ')')
  END
  PARENT.Wait()
  RETURN
  
!-------------------------------------------------------------------
GlobalClass.LockLetGo     PROCEDURE(STRING pFromWhere)
!-------------------------------------------------------------------
  CODE
  IF SELF.ShowDebug
    SELF.Debug('CLASS(' & THREAD() & '): GlobalClass.LockLetGo(' & CLIP(pFromWhere) & ')')
  END
  PARENT.Release()
  RETURN
