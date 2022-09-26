

   MEMBER('NameAttributes.clw')                            ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('NAMEATTRIBUTES002.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Name Attributes Simple [???]; Segoe UI, 10
!!! </summary>
NameAttributesSimple PROCEDURE 

! RA.2022.07.24: Procedure 'NameAttributesSimple' created
                                                           ! === Window ===
TD_TRACE            EQUATE(1)                              ! Thread Debug TRACE is ON
UD_TRACE            EQUATE(0)                              ! Thread Debug TRACE is OFF
DB_TRACE            EQUATE(0)                              ! Thread Debug TRACE is OFF
                                                           ! === Window ===
  MAP
  END
!
gNameAttr           GROUP(gtNameAttr); END
gE301               GROUP(gtE301); END

oNameAttr           NameAttributeClass
TD                  ThreadDebugLocal                       ! Thread Debug Local Class Name 1
QuickWindow          WINDOW('Name Attributes Simple'),AT(,,500,260),FONT('Segoe UI',10,COLOR:Black,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,ICON('ryb.ico'),GRAY,IMM,HLP('NameAttributesSimple'),SYSTEM
                       BUTTON('&OK'),AT(373,241,60,14),USE(?Ok),LEFT,ICON('WAOK.ICO'),FLAT,MSG('Accept operation'), |
  TIP('Accept Operation')
                       BUTTON('&Cancel'),AT(437,241,60,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Operation'), |
  TIP('Cancel Operation')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('NameAttributesSimple')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Ok
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Ok,RequestCancelled)                    ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Ok,RequestCompleted)                    ! Add the close control to the window manger
  END
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  SELF.Open(QuickWindow)                                   ! Open window
  0{PROP:Text} = '[ ' & THREAD() & ' ]: ' & 0{PROP:Text}
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('NameAttributesSimple',QuickWindow)         ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  ALERT(CtrlAltF9)                                         ! Appplication, Module, Procedure (HotKey CtrlAltF9)
  oNameAttr.SetDebug(TRUE)
  
  STOP('001')
  oNameAttr.Init(gNameAttr)                         ! RA.2022.07.24: Testing
  STOP('002')
  oNameAttr.ValueDebug()                            ! RA.2022.07.24: Testing
  STOP('003')
  TD.DumpQueueWindow(oNameAttr.naQ)
  
  STOP('004')
  oNameAttr.Init(gE301)                             ! RA.2022.07.24: Testing
  STOP('005')
  oNameAttr.ValueDebug()                            ! RA.2022.07.24: Testing
  STOP('006')
  TD.DumpQueueWindow(oNameAttr.naQ)
  
  STOP('007')
  gNameAttr.FieldNumber = 1
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('NameAttributesSimple',QuickWindow)      ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  TD.SetCounters(TDC, 'NameAttributesSimple')              ! Thread Debug Global Counters
  TD.Enter('NameAttributes','NameAttributes002.clw','NameAttributesSimple') ! === Window ===
  ReturnValue = PARENT.Run()
  TD.Exits('NameAttributes','NameAttributes002.clw','NameAttributesSimple') ! === Window ===
  RETURN ReturnValue


ThisWindow.TakeWindowEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all window specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:AlertKey
      IF KEYCODE() = CtrlAltF9 THEN
        MESSAGE('APPLICATION NAME|NameAttributes' & |
          '|MODULE NAME|NameAttributes002.clw' & |
          '|PROCEDURE NAME|NameAttributesSimple' & |
          '|PROCEDURE CREATED|' & FORMAT(80927,@D010-) & |
          '|PROCEDURE UPDATED|' & FORMAT(80927,@D010-) & |
          '|','Procedure Information',Icon:Exclamation)
      END                                                  ! IF KEYCODE() = CtrlAltF9
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

