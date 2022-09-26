

   MEMBER('NameAttributes.clw')                            ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('NAMEATTRIBUTES001.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('NAMEATTRIBUTES002.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Frame
!!! Name Attribute Class Test Application [???]; Segoe UI, 10
!!! </summary>
_main_NameAttributes PROCEDURE 

! RA.2022.07.23: Application created
                                                           ! === Frame ===
TD_TRACE            EQUATE(1)                              ! Thread Debug TRACE is ON
UD_TRACE            EQUATE(0)                              ! Thread Debug TRACE is OFF
DB_TRACE            EQUATE(0)                              ! Thread Debug TRACE is OFF
                                                           ! === Frame ===
  MAP
  END
!
TD                  ThreadDebugLocal                       ! Thread Debug Local Class Name 1
AppFrame             APPLICATION('Name Attribute Class Test Application'),AT(,,300,200),FONT('Segoe UI',10,,FONT:regular, |
  CHARSET:ANSI),RESIZE,CENTER,ICON('ryb.ico'),MAX,STATUS(-1,80,120,45),SYSTEM,IMM
                       MENUBAR,USE(?Menubar)
                         MENU('&File'),USE(?FileMenu)
                           ITEM('&Print Setup ...'),USE(?PrintSetup),MSG('Setup printer'),STD(STD:PrintSetup)
                           ITEM,USE(?SEPARATOR1),SEPARATOR
                           ITEM('E&xit'),USE(?Exit),MSG('Exit this application'),STD(STD:Close)
                         END
                         MENU('&Edit'),USE(?EditMenu),HIDE
                           ITEM('Cu&t'),USE(?Cut),MSG('Cut Selection To Clipboard'),STD(STD:Cut)
                           ITEM('&Copy'),USE(?Copy),MSG('Copy Selection To Clipboard'),STD(STD:Copy)
                           ITEM('&Paste'),USE(?Paste),MSG('Paste From Clipboard'),STD(STD:Paste)
                         END
                         MENU('&Test'),USE(?MENU_Test)
                           ITEM('Name Attributes Simple'),USE(?ITEM_NameAttributesSimple)
                         END
                         MENU('&Window'),USE(?WindowMenu),HIDE,STD(STD:WindowList)
                           ITEM('T&ile'),USE(?Tile),MSG('Arrange multiple opened windows'),STD(STD:TileWindow)
                           ITEM('&Cascade'),USE(?Cascade),MSG('Arrange multiple opened windows'),STD(STD:CascadeWindow)
                           ITEM('&Arrange Icons'),USE(?Arrange),MSG('Arrange the icons for minimized windows'),STD(STD:ArrangeIcons)
                         END
                         MENU('&Help'),USE(?HelpMenu),HIDE
                           ITEM('&Contents'),USE(?Helpindex),MSG('View the contents of the help file'),STD(STD:HelpIndex)
                           ITEM('&Search for Help On...'),USE(?HelpSearch),MSG('Search for help on a subject'),STD(STD:HelpSearch)
                           ITEM('&How to Use Help'),USE(?HelpOnHelp),MSG('Provides general instructions on using help'), |
  STD(STD:HelpOnHelp)
                         END
                       END
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
Menu::Menubar ROUTINE                                      ! Code for menu items on ?Menubar
Menu::FileMenu ROUTINE                                     ! Code for menu items on ?FileMenu
Menu::EditMenu ROUTINE                                     ! Code for menu items on ?EditMenu
Menu::MENU_Test ROUTINE                                    ! Code for menu items on ?MENU_Test
  CASE ACCEPTED()
  OF ?ITEM_NameAttributesSimple
    NameAttributesSimple()
  END
Menu::WindowMenu ROUTINE                                   ! Code for menu items on ?WindowMenu
Menu::HelpMenu ROUTINE                                     ! Code for menu items on ?HelpMenu

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('_main_NameAttributes')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = 1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.Open(AppFrame)                                      ! Open window
  0{PROP:Text} = '[ ' & THREAD() & ' ]: ' & 0{PROP:Text}
  Do DefineListboxStyle
  INIMgr.Fetch('_main_NameAttributes',AppFrame)            ! Restore window settings from non-volatile store
  SELF.SetAlerts()
      AppFrame{PROP:TabBarVisible}  = False
  ALERT(CtrlAltF9)                                         ! Appplication, Module, Procedure (HotKey CtrlAltF9)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('_main_NameAttributes',AppFrame)         ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  TD.SetCounters(TDC, '_main_NameAttributes')              ! Thread Debug Global Counters
  TD.Enter('NameAttributes','NameAttributes001.clw','_main_NameAttributes') ! === Frame ===
  ReturnValue = PARENT.Run()
  TD.Exits('NameAttributes','NameAttributes001.clw','_main_NameAttributes') ! === Frame ===
  RETURN ReturnValue


ThisWindow.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receive all EVENT:Accepted's
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE ACCEPTED()
    ELSE
      DO Menu::Menubar                                     ! Process menu items on ?Menubar menu
      DO Menu::FileMenu                                    ! Process menu items on ?FileMenu menu
      DO Menu::EditMenu                                    ! Process menu items on ?EditMenu menu
      DO Menu::MENU_Test                                   ! Process menu items on ?MENU_Test menu
      DO Menu::WindowMenu                                  ! Process menu items on ?WindowMenu menu
      DO Menu::HelpMenu                                    ! Process menu items on ?HelpMenu menu
    END
  ReturnValue = PARENT.TakeAccepted()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
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
          '|MODULE NAME|NameAttributes001.clw' & |
          '|PROCEDURE NAME|_main_NameAttributes' & |
          '|PROCEDURE CREATED|' & FORMAT(80924,@D010-) & |
          '|PROCEDURE UPDATED|' & FORMAT(80927,@D010-) & |
          '|','Procedure Information',Icon:Exclamation)
      END                                                  ! IF KEYCODE() = CtrlAltF9
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

