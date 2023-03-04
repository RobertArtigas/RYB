#TEMPLATE(zRYB_zrybNameAttributeClass,'RYB | GLOBAL: rybNameAttributeClass'),FAMILY('ABC')
#!------------------------------------------------------------------------------
#Include('cape01.tpw')
#Include('cape02.tpw')
#!------------------------------------------------------------------------------
#GROUP(%ReadGlobal,%pa,%force)
  #INSERT(%SetFamily)
  #insert(%ReadClassesPR,'rybNameAttributeClass.inc',%pa,%force)
#!------------------------------------------------------------------------------
#System
  #EQUATE(%rybNameAttributeClassTPLVersion,'1.00')
#!------------------------------------------------------------------------------
#! RA.2022.11.07: Start code changes log
#!------------------------------------------------------------------------------
#EXTENSION(rybNameAttributeClass,'RA.2020.06.13: GLOBAL: rybNameAttributeClass'),DESCRIPTION('RYB | GLOBAL: rybNameAttributeClass, Version: ' & %rybNameAttributeClassTPLVersion),APPLICATION
#PREPARE
#ENDPREPARE
#!
#BOXED('rybNameAttributeClass: Version: ' & %rybNameAttributeClassTPLVersion),AT(,,,55)
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
      #PROMPT('Disable All rybNameAttributeClass Features',CHECK),%DisablerybNameAttributeClass,AT(10)
    #ENDBOXED
  #ENDTAB
  #TAB('Multi-Dll'),WHERE(%DisablerybNameAttributeClass=0)
    #PROMPT('This is part of a Multi-DLL program',CHECK),%MultiDLL,DEFAULT(%ProgramExtension='DLL'),AT(10)
    #ENABLE(%MultiDLL=1)
      #ENABLE(%ProgramExtension='DLL')
        #Prompt('Export Class from this DLL',CHECK),%RootDLL,AT(10)
      #ENDENABLE
    #ENDENABLE
  #ENDTAB
  #TAB('Classes')
    #INSERT(%GlobalDeclareClassesPR)
    #PROMPT('Object Name',@s100),%rybNameAttributeClassObjectName,DEFAULT('oNameAttr')
    #PROMPT('Class Name',@s100),%rybNameAttributeClassName,DEFAULT('rybNameAttributeClass')
  #ENDTAB
#ENDSHEET
#!
#!------------------------------------------------------------------------------
#AT(%AfterGlobalIncludes),WHERE(%DisablerybNameAttributeClass=0)
  INCLUDE('rybNameAttributeClass.inc'),ONCE
#ENDAT
#!------------------------------------------------------------------------------
#ATSTART
  #IF(%DisablerybNameAttributeClass=0)
    #INSERT(%ReadGlobal,2,0)
    #INSERT(%AtStartInitialisation)
    #INSERT(%AddObjectPR,%rybNameAttributeClassName,%rybNameAttributeClassObjectName,'Global Objects')
  #ENDIF
#ENDAT
#!------------------------------------------------------------------------------
#ATEND
  #IF(%DisablerybNameAttributeClass = 0)
    #INSERT(%EndGlobal)
  #ENDIF
#ENDAT
#!------------------------------------------------------------------------------
#AT(%DllExportList),WHERE(%programExtension = 'DLL' and %RootDLL=1 and %MultiDll=1 and %DisablerybNameAttributeClass=0)
#INSERT(%ExportClassesPR,'rybNameAttributeClass.inc')
$%rybNameAttributeClassObjectName   @?
#ENDAT
#!------------------------------------------------------------------------------
#AT(%CustomGlobalDeclarations),WHERE(%DisablerybNameAttributeClass=0)
  #INSERT(%Defines,1,'_RYBLink_','_RYBDLL_',%MultiDLL,%RootDll)
#ENDAT
#!------------------------------------------------------------------------------
#AT(%mpDefineAll),WHERE(%DisablerybNameAttributeClass=0)
#INSERT(%Defines,2,'_RYBLink_','_RYBDLL_',%MultiDLL,%RootDll)
#ENDAT
#!------------------------------------------------------------------------------
#AT(%mpDefineAll7),WHERE(%DisablerybNameAttributeClass=0)
#INSERT(%Defines,3,'_RYBLink_','_RYBDLL_',%MultiDLL,%RootDll)
#ENDAT
#!------------------------------------------------------------------------------
#AT(%AfterFileDeclarations),WHERE(%DisablerybNameAttributeClass=0)
  #IF(%Family='cw20')
    #INSERT(%AtStartInitialisation)
  #ENDIF
  #IF(%MultiDLL=1 and %RootDll=0)
%rybNameAttributeClassObjectName   %rybNameAttributeClassName,External,DLL(dll_mode)
  #ELSE
#INSERT(%GlobalDeclaration)
#INSERT(%GenerateClassDeclaration,%rybNameAttributeClassName,%rybNameAttributeClassObjectName,'Global Objects','_RYB_ Objects')
  #ENDIF
#ENDAT
#!------------------------------------------------------------------------------
#AT(%ProgramProcedures),WHERE(%DisablerybNameAttributeClass=0)
  #IF(%Family='abc')
    #INSERT(%AtStartInitialisation)
  #ENDIF
  #IF(%MultiDLL=0 or %RootDll=1)
#INSERT(%GlobalMethods)
#INSERT(%GenerateMethods,%rybNameAttributeClassName,%rybNameAttributeClassObjectName,'Global Objects','_RYB_ Objects')
  #ENDIF
#ENDAT
#!------------------------------------------------------------------------------
#AT(%dMethodCodeSection,%rybNameAttributeClassObjectName & ' (' & %rybNameAttributeClassName & ')',%eMethodID),priority(5000),DESCRIPTION('Parent Call')
#INSERT(%ParentCall)
#ENDAT
#!#################################################################################################
#! End of GLOBAL EXTENSION
#!#################################################################################################
