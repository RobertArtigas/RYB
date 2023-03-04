#TEMPLATE(zRYB_zrybGlobalClass,'RYB | GLOBAL: rybGlobalClass'),FAMILY('ABC')
#!------------------------------------------------------------------------------
#Include('cape01.tpw')
#Include('cape02.tpw')
#!------------------------------------------------------------------------------
#GROUP(%ReadGlobal,%pa,%force)
  #INSERT(%SetFamily)
  #insert(%ReadClassesPR,'rybGlobalClass.inc',%pa,%force)
#!------------------------------------------------------------------------------
#System
  #EQUATE(%rybGlobalClassTPLVersion,'1.00')
#!------------------------------------------------------------------------------
#EXTENSION(rybGlobalClass,'RA.2020.06.13: GLOBAL: rybGlobalClass'),DESCRIPTION('RYB | GLOBAL: rybGlobalClass, Version: ' & %rybGlobalClassTPLVersion),APPLICATION
#PREPARE
#ENDPREPARE
#!
#BOXED('rybGlobalClass: Version: ' & %rybGlobalClassTPLVersion),AT(,,,55)
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
      #PROMPT('Disable All rybGlobalClass Features',CHECK),%DisablerybGlobalClass,AT(10)
    #ENDBOXED
  #ENDTAB
  #TAB('Multi-Dll'),WHERE(%DisablerybGlobalClass=0)
    #PROMPT('This is part of a Multi-DLL program',CHECK),%MultiDLL,DEFAULT(%ProgramExtension='DLL'),AT(10)
    #ENABLE(%MultiDLL=1)
      #ENABLE(%ProgramExtension='DLL')
        #Prompt('Export Class from this DLL',CHECK),%RootDLL,AT(10)
      #ENDENABLE
    #ENDENABLE
  #ENDTAB
  #TAB('Classes')
    #INSERT(%GlobalDeclareClassesPR)
    #PROMPT('Object Name',@s100),%rybGlobalClassObjectName,DEFAULT('oGLO')
    #PROMPT('Class Name',@s100),%rybGlobalClassName,DEFAULT('rybGlobalClass')
  #ENDTAB
#ENDSHEET
#!
#!------------------------------------------------------------------------------
#AT(%AfterGlobalIncludes),WHERE(%DisablerybGlobalClass=0)
  INCLUDE('rybGlobalClass.inc'),ONCE
#ENDAT
#!------------------------------------------------------------------------------
#ATSTART
  #IF(%DisablerybGlobalClass=0)
    #INSERT(%ReadGlobal,2,0)
    #INSERT(%AtStartInitialisation)
    #INSERT(%AddObjectPR,%rybGlobalClassName,%rybGlobalClassObjectName,'Global Objects')
  #ENDIF
#ENDAT
#!------------------------------------------------------------------------------
#ATEND
  #IF(%DisablerybGlobalClass = 0)
    #INSERT(%EndGlobal)
  #ENDIF
#ENDAT
#!------------------------------------------------------------------------------
#AT(%DllExportList),WHERE(%programExtension = 'DLL' and %RootDLL=1 and %MultiDll=1 and %DisablerybGlobalClass=0)
#INSERT(%ExportClassesPR,'rybGlobalClass.inc')
$%rybGlobalClassObjectName   @?
#ENDAT
#!------------------------------------------------------------------------------
#AT(%CustomGlobalDeclarations),WHERE(%DisablerybGlobalClass=0)
  #INSERT(%Defines,1,'_RYBLink_','_RYBDLL_',%MultiDLL,%RootDll)
#ENDAT
#!------------------------------------------------------------------------------
#AT(%mpDefineAll),WHERE(%DisablerybGlobalClass=0)
#INSERT(%Defines,2,'_RYBLink_','_RYBDLL_',%MultiDLL,%RootDll)
#ENDAT
#!------------------------------------------------------------------------------
#AT(%mpDefineAll7),WHERE(%DisablerybGlobalClass=0)
#INSERT(%Defines,3,'_RYBLink_','_RYBDLL_',%MultiDLL,%RootDll)
#ENDAT
#!------------------------------------------------------------------------------
#AT(%AfterFileDeclarations),WHERE(%DisablerybGlobalClass=0)
  #IF(%Family='cw20')
    #INSERT(%AtStartInitialisation)
  #ENDIF
  #IF(%MultiDLL=1 and %RootDll=0)
%rybGlobalClassObjectName   %rybGlobalClassName,External,DLL(dll_mode)
  #ELSE
#INSERT(%GlobalDeclaration)
#INSERT(%GenerateClassDeclaration,%rybGlobalClassName,%rybGlobalClassObjectName,'Global Objects','_RYB_ Objects')
  #ENDIF
#ENDAT
#!------------------------------------------------------------------------------
#AT(%ProgramProcedures),WHERE(%DisablerybGlobalClass=0)
  #IF(%Family='abc')
    #INSERT(%AtStartInitialisation)
  #ENDIF
  #IF(%MultiDLL=0 or %RootDll=1)
#INSERT(%GlobalMethods)
#INSERT(%GenerateMethods,%rybGlobalClassName,%rybGlobalClassObjectName,'Global Objects','_RYB_ Objects')
  #ENDIF
#ENDAT
#!------------------------------------------------------------------------------
#AT(%dMethodCodeSection,%rybGlobalClassObjectName & ' (' & %rybGlobalClassName & ')',%eMethodID),priority(5000),DESCRIPTION('Parent Call')
#INSERT(%ParentCall)
#ENDAT
#!#################################################################################################
#! End of GLOBAL EXTENSION
#!#################################################################################################
