!BOF
!
!Region Generate
!
! Dictionary:   C:\_GIT_\RobertArtigas\real\Dictionary\rybabc.dct
! File:         C:\_GIT_\RobertArtigas\real\Include\grprec_gtNameAttr.inc
! Date-Time:    2022/07/14 - 10:44:54AM
! Purpose:      Generated File Records as Groups
! Author:       GenerateGroups Template
! Narative:     This template is used to pass records structures
!               back and forth between DLL's when the files
!               are not shared. Since file definitions are not
!               available, data has to be passed in areas.
!
!EndRegion
!Region Header
! Name:         gtNameAttr
! Prefix:       gtNAMEATTR
! Description:  Name Attributes
!EndRegion
!Region RecordDefinition
!
!-Record-
!
GTNAMEATTR_tRec                           GROUP,TYPE,BINDABLE,PRE(rGTNAMEATTR)
FieldNumber                                 SHORT,NAME('FieldNumber|SHORT|@N4B|[0001-0002]|PR(''Field Number:'')|CO(''Number'')')                                                  ! [0001-0002] Field number.
FieldSalt                                   BYTE,NAME('FieldSalt|BYTE|@N1B|[0003-0003]|PR(''Field Salt:'')|CO(''Salt'')')                                                          ! [0003-0003] Is a SALT encryption?
FieldHash                                   BYTE,NAME('FieldHash|BYTE|@N1B|[0004-0004]|PR(''Field Hash'')|CO(''Hash'')')                                                           ! [0004-0004] Is a HASH encryption?
FieldEncrypt                                BYTE,NAME('FieldEncrypt|BYTE|@N1B|[0005-0005]|PR(''Field Encrypt'')|CO(''Encrypt'')')                                                  ! [0005-0005] Is a FIELD encryption?
FieldFrom                                   LONG,NAME('FieldFrom|LONG|@N04|[0006-0009]|PR(''Field From:'')|CO(''From'')')                                                          ! [0006-0009] Field starting location.
FieldTo                                     LONG,NAME('FieldTo|LONG|@N04|[0010-0013]|PR(''Field To:'')|CO(''To'')')                                                                ! [0010-0013] Field ending location.
FieldName                                   CSTRING(49),NAME('FieldName|CSTRING(49)|@S48|[0014-0062]|PR(''Field Name:'')|CO(''Name'')')                                            ! [0014-0062] Field name.
FieldWhom                                   CSTRING(49),NAME('FieldWhom|CSTRING(49)|@S48|[0063-0111]|PR(''Field Whom:'')|CO(''Whom'')')                                            ! [0063-0111] Field whom it is.
FieldType                                   CSTRING(49),NAME('FieldType|CSTRING(49)|@S48|[0112-0160]|PR(''Field Type:'')|CO(''Type'')')                                            ! [0112-0160] Field type clarion.
FieldFormat                                 CSTRING(49),NAME('FieldFormat|CSTRING(49)|@S48|[0161-0209]|PR(''Field Format:'')|CO(''Format'')')                                      ! [0161-0209] Field format clarion.
FieldRange                                  CSTRING(49),NAME('FieldRange|CSTRING(49)|@S48|[0210-0258]|PR(''Field Range:'')|CO(''Range'')')                                         ! [0210-0258] Field range location.
FieldPrompt                                 CSTRING(129),NAME('FieldPrompt|CSTRING(129)|@S128|[0259-0387]|PR(''Field Prompt:'')|CO(''Prompt'')')                                   ! [0259-0387] Field prompt literal.
FieldColumn                                 CSTRING(129),NAME('FieldColumn|CSTRING(129)|@S128|[0388-0516]|PR(''Field Column:'')|CO(''Column'')')                                   ! [0388-0516] Field column literal.
FieldTypeSQL                                CSTRING(129),NAME('FieldTypeSQL|CSTRING(129)|@S128|[0517-0645]|PR(''SQL Type:'')|CO(''SQLType'')')                                     ! [0517-0645] Field type SQL.
FieldFormatSQL                              CSTRING(129),NAME('FieldFormatSQL|CSTRING(129)|@S128|[0646-0774]|PR(''SQL Format:'')|CO(''SQLFormat'')')                               ! [0646-0774] Field format SQL.
FieldTemp                                   CSTRING(241),NAME('FieldTemp|CSTRING(241)|@S240|[0775-1015]|PR(''Field Temp:'')|CO(''Temp'')')                                         ! [0775-1015] Field attributes temporary.
                                          END
!EndRegion
!Region QueueDefinition
!
!-Queue-
!
GTNAMEATTR_qRec                           QUEUE(GTNAMEATTR_tRec),TYPE,BINDABLE,PRE(qGTNAMEATTR)
                                          END
!EndRegion
!Region FieldEquates
!
!-Equates-
!
C_GTNAMEATTR_FIELDNUMBER                    EQUATE(1)
C_GTNAMEATTR_FIELDSALT                      EQUATE(2)
C_GTNAMEATTR_FIELDHASH                      EQUATE(3)
C_GTNAMEATTR_FIELDENCRYPT                   EQUATE(4)
C_GTNAMEATTR_FIELDFROM                      EQUATE(5)
C_GTNAMEATTR_FIELDTO                        EQUATE(6)
C_GTNAMEATTR_FIELDNAME                      EQUATE(7)
C_GTNAMEATTR_FIELDWHOM                      EQUATE(8)
C_GTNAMEATTR_FIELDTYPE                      EQUATE(9)
C_GTNAMEATTR_FIELDFORMAT                    EQUATE(10)
C_GTNAMEATTR_FIELDRANGE                     EQUATE(11)
C_GTNAMEATTR_FIELDPROMPT                    EQUATE(12)
C_GTNAMEATTR_FIELDCOLUMN                    EQUATE(13)
C_GTNAMEATTR_FIELDTYPESQL                   EQUATE(14)
C_GTNAMEATTR_FIELDFORMATSQL                 EQUATE(15)
C_GTNAMEATTR_FIELDTEMP                      EQUATE(16)
!
!EndRegion
!Region Class_YES
!-------------------------------------------------------------------------------------------------!
! Control:      ?gtNAMEATTR_ListQ                                                                 !
! Object Name:  gtNAMEATTR_oListClass                                                             !
! Queue List:   ListQ                                                                             !
!-------------------------------------------------------------------------------------------------!
! This LIST structure is created to replace the one generated by the ABC templates.               !
! Save your generated window structure first, then cut and paste replacing your LIST structure.   !
!-------------------------------------------------------------------------------------------------!
! LIST,AT(4,40,400,40),USE(?gtNAMEATTR_ListQ),HVSCROLL, |
!   FORMAT('' & |
!   '32L(2)|M~Number~@n4B@#1#' & |
!   '24L(2)|M~Salt~@n1B@#2#' & |
!   '24L(2)|M~Hash~@n1B@#3#' & |
!   '36L(2)|M~Encrypt~@n1B@#4#' & |
!   '16L(2)|M~From~@n04@#5#' & |
!   '16L(2)|M~To~@n04@#6#' & |
!   '120L(2)|M~Name~@s48@#7#' & |
!   '120L(2)|M~Whom~@s48@#8#' & |
!   '120L(2)|M~Type~@s48@#9#' & |
!   '120L(2)|M~Format~@s48@#10#' & |
!   '120L(2)|M~Range~@s48@#11#' & |
!   '120L(2)|M~Prompt~@s128@#12#' & |
!   '120L(2)|M~Column~@s128@#13#' & |
!   '120L(2)|M~SQLType~@s128@#14#' & |
!   '120L(2)|M~SQLFormat~@s128@#15#' & |
!   '120L(2)|M~Temp~@s240@#16#' & |
!   ''), |
!   FROM(gtNAMEATTR_oListClass.ListQ), |
!   #FIELDS(gtNAMEATTR_oListClass.ListQ.FieldNumber, |
!   gtNAMEATTR_oListClass.ListQ.FieldSalt, |
!   gtNAMEATTR_oListClass.ListQ.FieldHash, |
!   gtNAMEATTR_oListClass.ListQ.FieldEncrypt, |
!   gtNAMEATTR_oListClass.ListQ.FieldFrom, |
!   gtNAMEATTR_oListClass.ListQ.FieldTo, |
!   gtNAMEATTR_oListClass.ListQ.FieldName, |
!   gtNAMEATTR_oListClass.ListQ.FieldWhom, |
!   gtNAMEATTR_oListClass.ListQ.FieldType, |
!   gtNAMEATTR_oListClass.ListQ.FieldFormat, |
!   gtNAMEATTR_oListClass.ListQ.FieldRange, |
!   gtNAMEATTR_oListClass.ListQ.FieldPrompt, |
!   gtNAMEATTR_oListClass.ListQ.FieldColumn, |
!   gtNAMEATTR_oListClass.ListQ.FieldTypeSQL, |
!   gtNAMEATTR_oListClass.ListQ.FieldFormatSQL, |
!   gtNAMEATTR_oListClass.ListQ.FieldTemp)
!
!EndRegion
!Region Class_NO
!-------------------------------------------------------------------------------------------------!
! Control:      ?gtNAMEATTR_ListQ                                                                 !
! Queue List:   ListQ                                                                             !
!-------------------------------------------------------------------------------------------------!
! This LIST structure is created to replace the one generated by the ABC templates.               !
! Save your generated window structure first, then cut and paste replacing your LIST structure.   !
!-------------------------------------------------------------------------------------------------!
! LIST,AT(4,40,400,40),USE(?gtNAMEATTR_ListQ),HVSCROLL, |
!   FORMAT('' & |
!   '32L(2)|M~Number~@n4B@#1#' & |
!   '24L(2)|M~Salt~@n1B@#2#' & |
!   '24L(2)|M~Hash~@n1B@#3#' & |
!   '36L(2)|M~Encrypt~@n1B@#4#' & |
!   '16L(2)|M~From~@n04@#5#' & |
!   '16L(2)|M~To~@n04@#6#' & |
!   '120L(2)|M~Name~@s48@#7#' & |
!   '120L(2)|M~Whom~@s48@#8#' & |
!   '120L(2)|M~Type~@s48@#9#' & |
!   '120L(2)|M~Format~@s48@#10#' & |
!   '120L(2)|M~Range~@s48@#11#' & |
!   '120L(2)|M~Prompt~@s128@#12#' & |
!   '120L(2)|M~Column~@s128@#13#' & |
!   '120L(2)|M~SQLType~@s128@#14#' & |
!   '120L(2)|M~SQLFormat~@s128@#15#' & |
!   '120L(2)|M~Temp~@s240@#16#' & |
!   ''), |
!   FROM(ListQ), |
!   #FIELDS(ListQ.FieldNumber, |
!   ListQ.FieldSalt, |
!   ListQ.FieldHash, |
!   ListQ.FieldEncrypt, |
!   ListQ.FieldFrom, |
!   ListQ.FieldTo, |
!   ListQ.FieldName, |
!   ListQ.FieldWhom, |
!   ListQ.FieldType, |
!   ListQ.FieldFormat, |
!   ListQ.FieldRange, |
!   ListQ.FieldPrompt, |
!   ListQ.FieldColumn, |
!   ListQ.FieldTypeSQL, |
!   ListQ.FieldFormatSQL, |
!   ListQ.FieldTemp)
!
!EndRegion
!
!EOF
