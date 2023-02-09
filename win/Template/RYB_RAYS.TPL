#TEMPLATE(RYB_RAYS,'2018.01.21: Run Your Business Template Collection'),FAMILY('ABC')
#!-----------------------------------------------------------------------------------------------------
#!-----------------------------------------------------------------------------------------------------
#!-----------------------------------------------------------------------------------------------------
#! File Name:   RYB_RAYS.TPL
#! Purpose:     Run Your Business, Inc. - Template collection
#! Collector:   Roberto Artigas y Soler
#! Author:      Roberto Artigas y Soler
#! Changes:
#! 2019.01.27.SUN     Roberto Artigas y Soler
#!  *   Mark Riffey now gets a copy of these templates (Skype 11:11AM). Need some feedback.
#!      Keep those cards and letters comming. DCT to CLASS template with GUID based keys.
#! 2018.12.27.THU     Roberto Artigas y Soler
#!  *   Adjusted template width to the C11 wider templates
#! 2018.01.21	Roberto Artigas y Soler
#!  *   Created this template collection from assorted items in the wild
#!      and specific template items that were created at different locations.
#!      Copyrighted by the individual authors as needed.
#!-----------------------------------------------------------------------------------------------------
#!-----------------------------------------------------------------------------------------------------
#!-----------------------------------------------------------------------------------------------------
#SYSTEM
#EQUATE(%tplVersionRYB  , '1.00')
#EQUATE(%tplReleaseRYB  , '2018.01.21')
#!-----------------------------------------------------------------------------------------------------
#EQUATE(%rybVersion     ,'Version '&%tplVersionRYB&' [ '&%tplReleaseRYB&' ]' )
#EQUATE(%rybVerName     ,'Run Your Business (RYB) template collection.'      )
#EQUATE(%rybVerCpyRghts ,'Templates copyright © by each individual author.'  )
#EQUATE(%rybVerRsrvAll  ,'Collection created by Roberto Artigas y Soler.'    )
#EQUATE(%rybVerEmail    ,'E-MAIL: roberto.artigas.dev@gmail.com'             )
#!-----------------------------------------------------------------------------------------------------
#EQUATE(%tplVersionPROTOEXP                 , '1.01' )                        #! Prototype Explorer
#EQUATE(%tplReleasePROTOEXP                 , '2021.12.17' )
#EQUATE(%tplVersionICONS                    , '1.00' )
#EQUATE(%tplReleaseICONS                    , '2010.11.09' )
#EQUATE(%tplVersionWINPIECES                , '1.01' )
#EQUATE(%tplReleaseWINPIECES                , '2020.01.16' )
#EQUATE(%tplVersionPATHSR                   , '1.00' )
#EQUATE(%tplReleasePATHSR                   , '2018.06.01' )
#EQUATE(%tplVersionCLASSDCT                 , '1.00' )
#EQUATE(%tplReleaseCLASSDCT                 , '2018.11.17' )
#EQUATE(%tplVersionWHOAMI                   , '1.00' )
#EQUATE(%tplReleaseWHOAMI                   , '2018.12.02' )
#EQUATE(%tplVersionGLOBALINC                , '1.00' )
#EQUATE(%tplReleaseGLOBALINC                , '2018.12.31' )
#EQUATE(%tplVersionCLASSOBJ                 , '1.00' )
#EQUATE(%tplReleaseCLASSOBJ                 , '2018.12.31' )
#EQUATE(%tplVersionSQLPIECES                , '1.00' )
#EQUATE(%tplReleaseSQLPIECES                , '2019.01.01' )
#EQUATE(%tplVersionSQLDISCONNECT            , '1.00' )
#EQUATE(%tplReleaseSQLDISCONNECT            , '2017.12.01' )
#EQUATE(%tplVersionEGC                      , '1.00' )
#EQUATE(%tplReleaseEGC                      , '2019.12.13' )
#EQUATE(%tplVersionTHREADME                 , '1.00' )
#EQUATE(%tplReleaseTHREADME                 , '2019.12.31' )
#EQUATE(%tplVersionSQLRECONNECT             , '1.00' )
#EQUATE(%tplReleaseSQLRECONNECT             , '2020.06.26' )
#EQUATE(%tplVersionGENRECORDS               , '1.00' )          #! TEMPORARY
#EQUATE(%tplReleaseGENRECORDS               , '1999.01.31' )    #! TEMPORARY
#EQUATE(%tplVersionGROUPS                   , '1.00' )
#EQUATE(%tplReleaseGROUPS                   , '1999.01.31' )
#EQUATE(%tplVersionTRACERUN                 , '1.00' )
#EQUATE(%tplReleaseTRACERUN                 , '2019.12.31' )
#EQUATE(%tplVersionNOGLOBALDATA             , '1.00' )
#EQUATE(%tplReleaseNOGLOBALDATA             , '2000.01.29' )
#EQUATE(%tplVersionTRYANDEXPIRE             , '1.00' )
#EQUATE(%tplReleaseTRYANDEXPIRE             , '2000.08.02' )
#EQUATE(%tplVersionRYBTABLES                , '1.00' )
#EQUATE(%tplReleaseRYBTABLES                , '2021.03.14' )
#EQUATE(%tplVersionTPLINSTANCE              , '1.00' )
#EQUATE(%tplReleaseTPLINSTANCE              , '2021.05.06' )
#EQUATE(%tplVersionGRPFLD                   , '1.00' )
#EQUATE(%tplReleaseGRPFLD                   , '2021.11.18' )
#EQUATE(%tplVersionLISTBOX                  , '1.01' )
#EQUATE(%tplReleaseLISTBOX                  , '2021.11.26' )
#EQUATE(%tplVersionGRPREC                   , '2.00' )
#EQUATE(%tplReleaseGRPREC                   , '2022.11.05' )
#EQUATE(%tplVersion001DCT                   , '1.00' )
#EQUATE(%tplRelease001DCT                   , '2023.02.01' )
#EQUATE(%tplVersion002APP                   , '1.00' )
#EQUATE(%tplRelease002APP                   , '2023.02.03' )
#!-----------------------------------------------------------------------------------------------------
#!-----------------------------------------------------------------------------------------------------
#!-----------------------------------------------------------------------------------------------------
#!-----------------------------------------------------------------------------------------------------
#GROUP(%ReplaceSubString,*%pString,%OldSubString,%NewSubString,%pCaseSensitive=0) #!,AUTO
#DECLARE(%lPosition,LONG)
#DECLARE(%lLen,LONG)
#SET(%lPosition,1)
#SET(%lLen,LEN(%OldSubString))
#LOOP
#!! REPLACE 0 !! pString(%pString)
#!! REPLACE 0 !! OldSubString(%OldSubString)
#!! REPLACE 0 !! NewSubString(%NewSubString)
#!! REPLACE 0 !! lPosition(%lPosition)
#!! REPLACE 0 !! lLen(%lLen)
  #IF(%pCaseSensitive)
     #SET(%lPosition,INSTRING(%OldSubString,%pString,1,%lPosition))
  #ELSE
     #SET(%lPosition,INSTRING(UPPER(%OldSubString),UPPER(%pString),1,%lPosition))
  #ENDIF
#!! REPLACE 5 !! lPosition(%lPosition)
  #IF (%lPosition=0)
    #BREAK
  #ELSE
    #SET(%pString,SUB(%pString,1,%lPosition-1)&%NewSubString&SUB(%pString,%lPosition+%lLen,LEN(CLIP(%pString))-%lPosition))
    #SET(%lPosition,%lPosition+LEN(%NewSubString))
  #ENDIF
#ENDLOOP
#!! REPLACE 9 !! pString(%pString)
#!! REPLACE 9 !! OldSubString(%OldSubString)
#!! REPLACE 9 !! NewSubString(%NewSubString)
#!! REPLACE 9 !! lPosition(%lPosition)
#!! REPLACE 9 !! lLen(%lLen)
#!-----------------------------------------------------------------------------------------------------
#GROUP(%FamilyFind, *%FamilyFound)
#IF(VarExists(%AppTemplateFamily))
  #IF(%AppTemplateFamily='CLARION')
    #SET(%FamilyFound,'LEGACY')
  #ELSE
    #SET(%FamilyFound,'ABC')
  #ENDIF
#ELSIF(VarExists(%cwtemplateversion))
  #IF(%cwtemplateversion = 'v5.5')
    #IF(VarExists(%ABCVersion))
      #SET(%FamilyFound,'ABC')
    #ELSE
      #SET(%FamilyFound,'LEGACY')
    #ENDIF
  #ELSE
    #IF(%cwtemplateversion = 'v2.003')
      #SET(%FamilyFound,'LEGACY')
    #ELSE
      #SET(%FamilyFound,'ABC')
    #ENDIF
  #ENDIF
#ENDIF
#!-----------------------------------------------------------------------------------------------------
#GROUP(%ClarionFamily)
#PREPARE
  #IF(NOT VAREXISTS(%FamilyFound))
    #DECLARE(%FamilyFound)
  #ENDIF
  #!INSERT(%FamilyFind, %FamilyFound)
  #CALL(%FamilyFind, %FamilyFound)
  #IF(NOT VAREXISTS(%FamilyTextRYB))
    #DECLARE(%FamilyTextRYB)
  #ENDIF
  #SET(%FamilyTextRYB,                  'Template Family being used by this application.')
  #!SET(%FamilyTextRYB, %FamilyTextRYB & '<13,10><13,10>')
  #SET(%FamilyTextRYB, %FamilyTextRYB & ' This will be set automatically once a compile has been performed.')
  #SET(%FamilyTextRYB, %FamilyTextRYB & '')
#ENDPREPARE
#!BOXED(''),AT(,,278)
#BOXED(UPPER(%Application) & '.' & UPPER(%ProgramExtension)),AT(,,454),PROP(PROP:FontStyle,700)
  #DISPLAY(''),AT(,,,1)
  #!DISPLAY(%FamilyTextRYB),AT(,,260,34)
  #DISPLAY(%FamilyTextRYB),AT(,,436,14)
  #ENABLE(%FALSE)
    #!PROMPT('Template Family:',@S10),%FamilyFound,DEFAULT(''),AT(80,,100,10)
    #PROMPT('Template Family:',@S10),%FamilyFound,DEFAULT(''),AT(80,,100,10),PROP(PROP:READONLY,1),PROP(PROP:FontStyle,700),PROP(PROP:FontColor,0C79A3H)
  #ENDENABLE
  #DISPLAY(''),AT(,,,1)
#ENDBOXED
#!-----------------------------------------------------------------------------------------------------
#GROUP(%TabClarionVersion)
#TAB('Family')
#INSERT(%ClarionFamily)
#ENDTAB
#!-----------------------------------------------------------------------------------------------------
#!-----------------------------------------------------------------------------------------------------
#GROUP(%PreambleRYB)
#PREPARE
  #IF(NOT VAREXISTS(%PreambleTextRYB))
    #DECLARE(%PreambleTextRYB)
  #ENDIF
  #SET(%PreambleTextRYB,                    'Run Your Business (RYB) template collection.')
  #SET(%PreambleTextRYB, %PreambleTextRYB & '<13,10>Templates copyright © by each individual author.')
  #SET(%PreambleTextRYB, %PreambleTextRYB & '<13,10>Collection created by Roberto Artigas y Soler.')
  #SET(%PreambleTextRYB, %PreambleTextRYB & '<13,10>E-MAIL: roberto.artigas.dev@gmail.com')
#ENDPREPARE
#BOXED(%rybVersion),AT(,,,55),PROP(PROP:FontStyle,700)
  #DISPLAY(''),AT(,,,1)
  #DISPLAY(%rybVerName    ),AT(10,10)
  #DISPLAY(%rybVerCpyRghts),AT(10,20)
  #DISPLAY(%rybVerRsrvAll ),AT(10,30)
  #DISPLAY(%rybVerEmail   ),AT(10,40)
  #!DISPLAY(%PreambleTextRYB),AT(,,260,44)
#ENDBOXED
#!-----------------------------------------------------------------------------------------------------
#!-----------------------------------------------------------------------------------------------------
#GROUP(%MITLicenseText)
#PREPARE
  #IF(NOT VAREXISTS(%MITLicenseText01))
    #DECLARE(%MITLicenseText01)
  #ENDIF
  #IF(NOT VAREXISTS(%MITLicenseText02))
    #DECLARE(%MITLicenseText02)
  #ENDIF
  #IF(NOT VAREXISTS(%MITLicenseText03))
    #DECLARE(%MITLicenseText03)
  #ENDIF
  #SET(%MITLicenseText01, '')
  #SET(%MITLicenseText01, %MITLicenseText01 & 'Permission is hereby granted, free of charge, to any person')
  #SET(%MITLicenseText01, %MITLicenseText01 & ' obtaining a copy of this software and associated documentation')
  #SET(%MITLicenseText01, %MITLicenseText01 & ' files (the "Software"), to deal in the software without')
  #SET(%MITLicenseText01, %MITLicenseText01 & ' restriction, including without limitation the rights to use,')
  #SET(%MITLicenseText01, %MITLicenseText01 & ' copy, modify, merge, publish, distribute, sublicense, and/or sell')
  #SET(%MITLicenseText01, %MITLicenseText01 & ' copies of the Software, and to permit persons to whom the Software')
  #SET(%MITLicenseText01, %MITLicenseText01 & ' is furnished to do so, subject to the following conditions:')
  #SET(%MITLicenseText02, '')
  #SET(%MITLicenseText02, %MITLicenseText02 & 'The above copyright notice and this permission notice shall be')
  #SET(%MITLicenseText02, %MITLicenseText02 & ' included in all copies or substantial portions of the Software.')
  #SET(%MITLicenseText03, '')
  #SET(%MITLicenseText03, %MITLicenseText03 & 'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,')
  #SET(%MITLicenseText03, %MITLicenseText03 & ' EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF')
  #SET(%MITLicenseText03, %MITLicenseText03 & ' MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND')
  #SET(%MITLicenseText03, %MITLicenseText03 & ' NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT')
  #SET(%MITLicenseText03, %MITLicenseText03 & ' HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,')
  #SET(%MITLicenseText03, %MITLicenseText03 & ' WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,')
  #SET(%MITLicenseText03, %MITLicenseText03 & ' OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER')
  #SET(%MITLicenseText03, %MITLicenseText03 & ' DEALINGS IN THE SOFTWARE.')
  #SET(%MITLicenseText03, %MITLicenseText03 & '')
#ENDPREPARE
#!-----------------------------------------------------------------------------------------------------
#!-----------------------------------------------------------------------------------------------------
#GROUP(%MITLicense)
#INSERT(%MITLicenseText)
#!BOXED('MIT License'),AT(,,278),PROP(PROP:FontStyle,700)
#BOXED('MIT License'),AT(,,454),PROP(PROP:FontStyle,700)
  #DISPLAY(''),AT(,,,1)
  #DISPLAY('Copyright © ' & YEAR(TODAY()) & ' by Roberto Artigas y Soler.'),PROP(PROP:FontStyle,700)
  #DISPLAY(''),AT(,,,1)
  #!DISPLAY(%MITLicenseText01),AT(,,260,54)
  #!DISPLAY(%MITLicenseText02),AT(,,260,24),PROP(PROP:FontStyle,700)
  #!DISPLAY(%MITLicenseText03),AT(,,260,64)
  #DISPLAY(%MITLicenseText01),AT(,,436,36)
  #DISPLAY(%MITLicenseText02),AT(,,436,14),PROP(PROP:FontStyle,700)
  #DISPLAY(%MITLicenseText03),AT(,,436,44)
#ENDBOXED
#!-----------------------------------------------------------------------------------------------------
#!-----------------------------------------------------------------------------------------------------
#GROUP(%MITLicenseUnknown)
#INSERT(%MITLicenseText)
#BOXED('MIT License'),AT(,,454),PROP(PROP:FontStyle,700)
  #DISPLAY(''),AT(,,,1)
  #DISPLAY('Copyright © ' & YEAR(TODAY()) & ' by Unknown Developer.'),PROP(PROP:FontStyle,700)
  #DISPLAY(''),AT(,,,1)
  #DISPLAY(%MITLicenseText01),AT(,,436,36)
  #DISPLAY(%MITLicenseText02),AT(,,436,14),PROP(PROP:FontStyle,700)
  #DISPLAY(%MITLicenseText03),AT(,,436,44)
#ENDBOXED
#!-----------------------------------------------------------------------------------------------------
#!-----------------------------------------------------------------------------------------------------
#GROUP(%rybVariablesCommon)                                                     #! Need a few simple variables
#PREPARE
#DECLARE(%TheDate             ,STRING)                                          #! Display current date
#DECLARE(%TheTime             ,STRING)                                          #! Display current time
#!---------------------------------------------------------------------
#DECLARE(%DictPath            ,STRING)
#DECLARE(%DictName            ,STRING)
#DECLARE(%nLoc1               ,LONG)
#DECLARE(%nLoc2               ,LONG)
#ENDPREPARE
#!-----------------------------------------------------------------------------------------------------
#!-----------------------------------------------------------------------------------------------------
#GROUP(%rybVariablesSetup)                                                      #! Setup output file names
#PREPARE
#SET(%TheDate                 ,FORMAT(TODAY(),@D010))                           #! Set current date
#SET(%TheTime                 ,FORMAT(CLOCK(),@T06))                            #! Set current time
#ENDPREPARE
#!-----------------------------------------------------------------------------------------------------
#!-----------------------------------------------------------------------------------------------------
#GROUP(%rybDictionaryPath)                                                      #! Get dictionary path and names
#PREPARE
#SET(%nLoc1,INSTRING('\',%DictionaryFile,1,1))
#LOOP,WHILE(%nLoc1)
  #SET(%nLoc2,%nLoc1)
  #SET(%nLoc1,INSTRING('\',%DictionaryFile,1,%nLoc1+1))
#ENDLOOP
#SET(%DictName,UPPER(SUB(%DictionaryFile,%nLoc2+1,LEN(%DictionaryFile)-%nLoc2-4)))
#SET(%DictPath,UPPER(SUB(%DictionaryFile,1,%nLoc2)))
#ENDPREPARE
#!-----------------------------------------------------------------------------------------------------
#!-----------------------------------------------------------------------------------------------------
#INCLUDE('RYB_DLLS.TPW')                    #! RA.2001.02.12: DLLs templates prototypes
#INCLUDE('RYB_ICONS.TPW')                   #! RA.2010.11.09: Set some icons up
#INCLUDE('RYB_WINPIECES.TPW')               #! RA.2018.03.11: Assorted window cosmetics
#INCLUDE('RYB_PATHSAVERESTORE.TPW')         #! RA.2018.06.01: LONGPATH save and restore
#INCLUDE('RYB_WHOAMI.TPW')                  #! RA.2018.12.02: Application, Module, Procedure
#INCLUDE('RYB_GLOBALINC.TPW')               #! RA.2018.12.31: Global Includes and Equates
#INCLUDE('RYB_CLASSOBJ.TPW')                #! RA.2018.12.31: Procedure class object definitions
#INCLUDE('RYB_SQLPIECES.TPW')               #! RA.2018.02.22: SQL template pieces
#INCLUDE('RYB_SQLDISCONNECT.TPW')           #! RA.2019.03.01: SQL Handling Disconnect
#INCLUDE('RYB_EXCLUDEGLOBALCLASS.TPW')      #! RA.2019.12.13: Exclude GLOBAL classes
#INCLUDE('RYB_THREADME.TPW')                #! RA.2019.12.31: Thread number on title bar
#INCLUDE('RYB_SQLRECONNECT.TPW')            #! RA.2020.06.26: SQL Handling Reconnect
#INCLUDE('RYB_GENERATEGROUPS.TPW')          #! RA.1999.01.31: Generate Record Groups
#INCLUDE('RYB_TRACERUNPROCEDURE.TPW')       #! RA.2019.12.31: Trace RUN procedure (UD Version)
#INCLUDE('RYB_NOGLOBALDATA.TPW')            #! RA.2000.01.29: Suppress Global Data Exports
#INCLUDE('RYB_TRYOUTANDEXPIRE.TPW')         #! RA.2000.08.02: Expire application on a date
#INCLUDE('RYB_CTABLES.TPW')                 #! RA.2021.03.14: Equates for system wide tables
#INCLUDE('RYB_TEMPLATEINSTANCES.TPW')       #! EL.2021.05.06: Show template instances
#INCLUDE('RYB_GROUPSFIELDS.TPW')            #! RA.2021.11.20: Groups with name attributes
#INCLUDE('RYB_CREATELISTBOX.TPW')           #! RA.2021.11.26: Create List Box for Clarion
#INCLUDE('RYB_GROUPSTRUCTURE.TPW')          #! RA.2022.04.26: Generate Record Groups
#INCLUDE('RYB_AUDIT001DCT.TPW')             #! RA.2023.01.31: Audit 001 DCT (NetTalk-Crossover)
#INCLUDE('RYB_AUDIT002APP.TPW')             #! RA.2023.02.02: Audit 002 APP (NetTalk-Crossover)
#!
#!INCLUDE('RYB_TESTING.TPW')                #! RA.2019.04.21: TESTING STRAP - TEMPORARY
#!INCLUDE('RYB_GLOBAL_TEST.TPW')            #! RA.2022.05.01: TESTING STRAP - TEMPORARY
#!-----------------------------------------------------------------------------------------------------
#!-----------------------------------------------------------------------------------------------------
