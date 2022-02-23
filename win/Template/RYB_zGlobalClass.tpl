#TEMPLATE(zRYB_zGlobalClass,'RYB | GLOBAL: GlobalClass'),FAMILY('ABC')
#!------------------------------------------------------------------------------
#Include('cape01.tpw')
#Include('cape02.tpw')
#!------------------------------------------------------------------------------
#GROUP(%ReadGlobal,%pa,%force)
  #INSERT(%SetFamily)
  #insert(%ReadClassesPR,'GlobalClass.inc',%pa,%force)
#!------------------------------------------------------------------------------
#System
  #EQUATE(%GlobalClassTPLVersion,'1.00')
#!------------------------------------------------------------------------------
#EXTENSION(GlobalClass,'RA.2020.06.13: GLOBAL: GlobalClass'),DESCRIPTION('RYB | GLOBAL: GlobalClass, Version: ' & %GlobalClassTPLVersion),APPLICATION
#PREPARE
#ENDPREPARE
#!
#BOXED('GlobalClass: Version: ' & %GlobalClassTPLVersion),AT(,,,55)
  #DISPLAY(''),AT(,,,1)
  #DISPLAY('RYB® is a Registered Trademark of Roberto Artigas y Soler'        )
  #DISPLAY('Copyright© 2021-' & YEAR(TODAY()) & ' by Roberto Artigas y Soler' )
  #DISPLAY('All copyrights reserved world wide.'                              )
  #!DISPLAY('WEBSITE: https://www.RYB.com'                                    )
  #DISPLAY(''),AT(,,,10)
#ENDBOXED
#!
#SHEET
  #PREPARE
    #INSERT(%ReadGlobal,1,0)
  #ENDPREPARE
  #TAB('General')
    #BOXED('Debugging')
      #DISPLAY(''),AT(,,,1)
      #PROMPT('Disable All GlobalClass Features',CHECK),%DisableGlobalClass,AT(10)
    #ENDBOXED
  #ENDTAB
  #TAB('Multi-Dll'),WHERE(%DisableGlobalClass=0)
    #PROMPT('This is part of a Multi-DLL program',CHECK),%MultiDLL,DEFAULT(%ProgramExtension='DLL'),AT(10)
    #ENABLE(%MultiDLL=1)
      #ENABLE(%ProgramExtension='DLL')
        #Prompt('Export Class from this DLL',CHECK),%RootDLL,AT(10)
      #ENDENABLE
    #ENDENABLE
  #ENDTAB
  #TAB('Classes')
    #INSERT(%GlobalDeclareClassesPR)
    #PROMPT('Object Name',@s100),%GlobalClassObjectName,DEFAULT('oGLO')
    #PROMPT('Class Name',@s100),%GlobalClassName,DEFAULT('GlobalClass')
  #ENDTAB
#ENDSHEET
#!
#!------------------------------------------------------------------------------
#AT(%AfterGlobalIncludes),WHERE(%DisableGlobalClass=0)
  INCLUDE('GlobalClass.inc'),ONCE
#ENDAT
#!------------------------------------------------------------------------------
#ATSTART
  #IF(%DisableGlobalClass=0)
    #INSERT(%ReadGlobal,2,0)
    #INSERT(%AtStartInitialisation)
    #INSERT(%AddObjectPR,%GlobalClassName,%GlobalClassObjectName,'Global Objects')
  #ENDIF
#ENDAT
#!------------------------------------------------------------------------------
#ATEND
  #IF(%DisableGlobalClass = 0)
    #INSERT(%EndGlobal)
  #ENDIF
#ENDAT
#!------------------------------------------------------------------------------
#AT(%DllExportList),WHERE(%programExtension = 'DLL' and %RootDLL=1 and %MultiDll=1 and %DisableGlobalClass=0)
#INSERT(%ExportClassesPR,'GlobalClass.inc')
$%GlobalClassObjectName   @?
#ENDAT
#!------------------------------------------------------------------------------
#AT(%CustomGlobalDeclarations),WHERE(%DisableGlobalClass=0)
  #INSERT(%Defines,1,'_RYBLink_','_RYBDLL_',%MultiDLL,%RootDll)
#ENDAT
#!------------------------------------------------------------------------------
#AT(%mpDefineAll),WHERE(%DisableGlobalClass=0)
#INSERT(%Defines,2,'_RYBLink_','_RYBDLL_',%MultiDLL,%RootDll)
#ENDAT
#!------------------------------------------------------------------------------
#AT(%mpDefineAll7),WHERE(%DisableGlobalClass=0)
#INSERT(%Defines,3,'_RYBLink_','_RYBDLL_',%MultiDLL,%RootDll)
#ENDAT
#!------------------------------------------------------------------------------
#AT(%AfterFileDeclarations),WHERE(%DisableGlobalClass=0)
  #IF(%Family='cw20')
    #INSERT(%AtStartInitialisation)
  #ENDIF
  #IF(%MultiDLL=1 and %RootDll=0)
%GlobalClassObjectName   %GlobalClassName,External,DLL(dll_mode)
  #ELSE
#INSERT(%GlobalDeclaration)
#INSERT(%GenerateClassDeclaration,%GlobalClassName,%GlobalClassObjectName,'Global Objects','_RYB_ Objects')
  #ENDIF
#ENDAT
#!------------------------------------------------------------------------------
#AT(%ProgramProcedures),WHERE(%DisableGlobalClass=0)
  #IF(%Family='abc')
    #INSERT(%AtStartInitialisation)
  #ENDIF
  #IF(%MultiDLL=0 or %RootDll=1)
#INSERT(%GlobalMethods)
#INSERT(%GenerateMethods,%GlobalClassName,%GlobalClassObjectName,'Global Objects','_RYB_ Objects')
  #ENDIF
#ENDAT
#!------------------------------------------------------------------------------
#AT(%dMethodCodeSection,%GlobalClassObjectName & ' (' & %GlobalClassName & ')',%eMethodID),priority(5000),DESCRIPTION('Parent Call')
#INSERT(%ParentCall)
#ENDAT
#!#################################################################################################
#! End of GLOBAL EXTENSION
#!#################################################################################################
