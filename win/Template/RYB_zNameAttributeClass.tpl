#TEMPLATE(zRYB_zNameAttributeClass,'RYB | GLOBAL: NameAttributeClass'),FAMILY('ABC')
#!------------------------------------------------------------------------------
#Include('cape01.tpw')
#Include('cape02.tpw')
#!------------------------------------------------------------------------------
#GROUP(%ReadGlobal,%pa,%force)
  #INSERT(%SetFamily)
  #insert(%ReadClassesPR,'NameAttributeClass.inc',%pa,%force)
#!------------------------------------------------------------------------------
#System
  #EQUATE(%NameAttributeClassTPLVersion,'1.00')
#!------------------------------------------------------------------------------
#EXTENSION(NameAttributeClass,'RA.2020.06.13: GLOBAL: NameAttributeClass'),DESCRIPTION('RYB | GLOBAL: NameAttributeClass, Version: ' & %NameAttributeClassTPLVersion),APPLICATION
#PREPARE
#ENDPREPARE
#!
#BOXED('NameAttributeClass: Version: ' & %NameAttributeClassTPLVersion),AT(,,,55)
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
      #PROMPT('Disable All NameAttributeClass Features',CHECK),%DisableNameAttributeClass,AT(10)
    #ENDBOXED
  #ENDTAB
  #TAB('Multi-Dll'),WHERE(%DisableNameAttributeClass=0)
    #PROMPT('This is part of a Multi-DLL program',CHECK),%MultiDLL,DEFAULT(%ProgramExtension='DLL'),AT(10)
    #ENABLE(%MultiDLL=1)
      #ENABLE(%ProgramExtension='DLL')
        #Prompt('Export Class from this DLL',CHECK),%RootDLL,AT(10)
      #ENDENABLE
    #ENDENABLE
  #ENDTAB
  #TAB('Classes')
    #INSERT(%GlobalDeclareClassesPR)
    #PROMPT('Object Name',@s100),%NameAttributeClassObjectName,DEFAULT('oGLO')
    #PROMPT('Class Name',@s100),%NameAttributeClassName,DEFAULT('NameAttributeClass')
  #ENDTAB
#ENDSHEET
#!
#!------------------------------------------------------------------------------
#AT(%AfterGlobalIncludes),WHERE(%DisableNameAttributeClass=0)
  INCLUDE('NameAttributeClass.inc'),ONCE
#ENDAT
#!------------------------------------------------------------------------------
#ATSTART
  #IF(%DisableNameAttributeClass=0)
    #INSERT(%ReadGlobal,2,0)
    #INSERT(%AtStartInitialisation)
    #INSERT(%AddObjectPR,%NameAttributeClassName,%NameAttributeClassObjectName,'Global Objects')
  #ENDIF
#ENDAT
#!------------------------------------------------------------------------------
#ATEND
  #IF(%DisableNameAttributeClass = 0)
    #INSERT(%EndGlobal)
  #ENDIF
#ENDAT
#!------------------------------------------------------------------------------
#AT(%DllExportList),WHERE(%programExtension = 'DLL' and %RootDLL=1 and %MultiDll=1 and %DisableNameAttributeClass=0)
#INSERT(%ExportClassesPR,'NameAttributeClass.inc')
$%NameAttributeClassObjectName   @?
#ENDAT
#!------------------------------------------------------------------------------
#AT(%CustomGlobalDeclarations),WHERE(%DisableNameAttributeClass=0)
  #INSERT(%Defines,1,'_RYBLink_','_RYBDLL_',%MultiDLL,%RootDll)
#ENDAT
#!------------------------------------------------------------------------------
#AT(%mpDefineAll),WHERE(%DisableNameAttributeClass=0)
#INSERT(%Defines,2,'_RYBLink_','_RYBDLL_',%MultiDLL,%RootDll)
#ENDAT
#!------------------------------------------------------------------------------
#AT(%mpDefineAll7),WHERE(%DisableNameAttributeClass=0)
#INSERT(%Defines,3,'_RYBLink_','_RYBDLL_',%MultiDLL,%RootDll)
#ENDAT
#!------------------------------------------------------------------------------
#AT(%AfterFileDeclarations),WHERE(%DisableNameAttributeClass=0)
  #IF(%Family='cw20')
    #INSERT(%AtStartInitialisation)
  #ENDIF
  #IF(%MultiDLL=1 and %RootDll=0)
%NameAttributeClassObjectName   %NameAttributeClassName,External,DLL(dll_mode)
  #ELSE
#INSERT(%GlobalDeclaration)
#INSERT(%GenerateClassDeclaration,%NameAttributeClassName,%NameAttributeClassObjectName,'Global Objects','_RYB_ Objects')
  #ENDIF
#ENDAT
#!------------------------------------------------------------------------------
#AT(%ProgramProcedures),WHERE(%DisableNameAttributeClass=0)
  #IF(%Family='abc')
    #INSERT(%AtStartInitialisation)
  #ENDIF
  #IF(%MultiDLL=0 or %RootDll=1)
#INSERT(%GlobalMethods)
#INSERT(%GenerateMethods,%NameAttributeClassName,%NameAttributeClassObjectName,'Global Objects','_RYB_ Objects')
  #ENDIF
#ENDAT
#!------------------------------------------------------------------------------
#AT(%dMethodCodeSection,%NameAttributeClassObjectName & ' (' & %NameAttributeClassName & ')',%eMethodID),priority(5000),DESCRIPTION('Parent Call')
#INSERT(%ParentCall)
#ENDAT
#!#################################################################################################
#! End of GLOBAL EXTENSION
#!#################################################################################################
