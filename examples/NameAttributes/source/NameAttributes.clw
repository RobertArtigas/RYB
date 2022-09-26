   PROGRAM



   INCLUDE('ABERROR.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ERRORS.CLW'),ONCE
   INCLUDE('KEYCODES.CLW'),ONCE
   INCLUDE('ABFUZZY.INC'),ONCE
  INCLUDE('ThreadDebug.inc'),ONCE                          ! Thread Debug Classes

   MAP
     MODULE('NAMEATTRIBUTES_BC.CLW')
DctInit     PROCEDURE                                      ! Initializes the dictionary definition module
DctKill     PROCEDURE                                      ! Kills the dictionary definition module
     END
!--- Application Global and Exported Procedure Definitions --------------------------------------------
     MODULE('NAMEATTRIBUTES001.CLW')
_main_NameAttributes   PROCEDURE   !Name Attribute Class Test Application [???]; Segoe UI, 10
     END

DumpGlobalInformation_NameAttributes    PROCEDURE()                                      ! Thread Debug Prototype
DumpGlobalVariables_NameAttributes      PROCEDURE()                                      ! Thread Debug Prototype

   END

SilentRunning        BYTE(0)                               ! Set true when application is running in 'silent mode'

!region File Declaration
!endregion

!  INCLUDE('grprec_gtNameAttr.inc'),ONCE
  INCLUDE('NameAttributeClass.inc'),ONCE
!
TD_TplVersion                           CSTRING('0.03')
TD_TplRelease                           CSTRING('2019.03.03')
TDC                                     CLASS(ThreadDebugCounters)
                                        END
TDG                                     CLASS(ThreadDebugGlobal)
                                        END
!

FuzzyMatcher         FuzzyClass                            ! Global fuzzy matcher
GlobalErrorStatus    ErrorStatusClass,THREAD
GlobalErrors         ErrorClass                            ! Global error manager
INIMgr               INIClass                              ! Global non-volatile storage manager
GlobalRequest        BYTE(0),THREAD                        ! Set when a browse calls a form, to let it know action to perform
GlobalResponse       BYTE(0),THREAD                        ! Set to the response from the form
VCRRequest           LONG(0),THREAD                        ! Set to the request from the VCR buttons

Dictionary           CLASS,THREAD
Construct              PROCEDURE
Destruct               PROCEDURE
                     END


  CODE
  GlobalErrors.Init(GlobalErrorStatus)
  FuzzyMatcher.Init                                        ! Initilaize the browse 'fuzzy matcher'
  FuzzyMatcher.SetOption(MatchOption:NoCase, 1)            ! Configure case matching
  FuzzyMatcher.SetOption(MatchOption:WordOnly, 0)          ! Configure 'word only' matching
  INIMgr.Init('.\NameAttributes.INI', NVD_INI)             ! Configure INIManager to use INI file
  DctInit()
  _main_NameAttributes
  INIMgr.Update
  TDG.Kill()                                               ! Thread Debug Global Class Name 1
  INIMgr.Kill                                              ! Destroy INI manager
  FuzzyMatcher.Kill                                        ! Destroy fuzzy matcher
    

!BOE: Thread Global Dump Information
DumpGlobalInformation_NameAttributes    PROCEDURE()
  CODE
  RETURN
DumpGlobalVariables_NameAttributes      PROCEDURE()
  CODE
  RETURN
!EOE: Thread Global Dump Information



Dictionary.Construct PROCEDURE

  CODE
  IF THREAD()<>1
     DctInit()
  END


Dictionary.Destruct PROCEDURE

  CODE
  DctKill()

