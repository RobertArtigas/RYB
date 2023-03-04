  MEMBER
  
  MAP
    MODULE('kernel')
      DebugBreak(),PASCAL !,RAW,NAME('debugbreak')
      OutputDebugString(*CSTRING),PASCAL,RAW,NAME('OutputDebugStringA')  !32-bit only
    END
  END

  INCLUDE('rybGlobalClass.inc'),ONCE

!-------------------------------------------------------------------
rybGlobalClass.Construct        PROCEDURE()
!-------------------------------------------------------------------
  CODE
  SELF.Debug('CLASS(' & THREAD() & '): rybGlobalClass.Construct')
  SELF.ShowDebug  = FALSE
  RETURN

!-------------------------------------------------------------------
rybGlobalClass.Destruct         PROCEDURE()
!-------------------------------------------------------------------
  CODE
  SELF.Debug('CLASS(' & THREAD() & '): rybGlobalClass.Destruct')
  SELF.ShowDebug  = FALSE
  RETURN

!-------------------------------------------------------------------
rybGlobalClass.SetDebug         PROCEDURE(Byte pShowDebug = False)
!-------------------------------------------------------------------
  CODE
  SELF.ShowDebug  = pShowDebug
  RETURN

!-------------------------------------------------------------------
rybGlobalClass.Debug            PROCEDURE(String pMsg)
!-------------------------------------------------------------------
szMSG   &CSTRING
  CODE
  szMSG &= NEW CSTRING( SIZE(pMsg) + SIZE('<13,10,0>') )
  szMSG  =                   pMsg  &      '<13,10,0>'
  OutputDebugString(szMSG)
  DISPOSE(szMSG)
  RETURN

!-------------------------------------------------------------------
rybGlobalClass.WhatAmI          PROCEDURE() !,String
!-------------------------------------------------------------------
  CODE
  IF SELF.ShowDebug
    SELF.Debug(SELF.WhatAmI)
  END
  RETURN SELF.WhatAmI

!-------------------------------------------------------------------
rybGlobalClass.LockGetIt        PROCEDURE(STRING pFromWhere)
!-------------------------------------------------------------------
  CODE
  IF SELF.ShowDebug 
    SELF.Debug('CLASS(' & THREAD() & '): rybGlobalClass.LockGetIt(' & CLIP(pFromWhere) & ')')
  END
  PARENT.Wait()
  RETURN
  
!-------------------------------------------------------------------
rybGlobalClass.LockLetGo         PROCEDURE(STRING pFromWhere)
!-------------------------------------------------------------------
  CODE
  IF SELF.ShowDebug
    SELF.Debug('CLASS(' & THREAD() & '): rybGlobalClass.LockLetGo(' & CLIP(pFromWhere) & ')')
  END
  PARENT.Release()
  RETURN
