!BOF
!
!Region Generate
!
! Dictionary:   C:\_GIT_\RobertArtigas\RYB\examples\NameAttributes\rybNameAttributes.dct
! File:         .\grpque_gtNameAttr.inc
! Date-Time:    2025-06-19 - 09:12:40AM
! Purpose:      Generated File Records as Groups
! Created:      Generate GROUP and QUEUE Template
! Author:       Copyright © 1999-2999 by Roberto Artigas y Soler
!               All rights reserved world wide.
! Narative:     This template is used to pass records structures
!               back and forth between DLL's when the tables
!               might not be shared. Since table definitions are not
!               available, data has to be passed in areas.
!
!EndRegion
!Region Header
! Name:         gtNameAttr
! Prefix:       gtNAMEATTR
! Description:  Name Attributes
!EndRegion
!Region GroupDefinition
!
!-Group-
!
gtNAMEATTRGT                              GROUP,TYPE,NAME('gtNAMEATTRGT')
FieldNumber                                 SHORT,NAME('Number|SHORT|@N4B|ATTRIBUTE')                                                                                              ! [00001-00002] Field number.
FieldSalt                                   BYTE,NAME('Salt|BYTE|@N1B|BOOLEAN|ATTRIBUTE')                                                                                          ! [00003-00003] Is a SALT encryption?
FieldHash                                   BYTE,NAME('Hash|BYTE|@N1B|BOOLEAN|ATTRIBUTE')                                                                                          ! [00004-00004] Is a HASH encryption?
FieldEncrypt                                BYTE,NAME('Encrypt|BYTE|@N1B|BOOLEAN|ATTRIBUTE')                                                                                       ! [00005-00005] Is a FIELD encryption?
FieldFrom                                   CSTRING(6),NAME('From|CSTRING(6)|@S5|ATTRIBUTE')                                                                                       ! [00006-00011] Field starting location.
FieldTo                                     CSTRING(6),NAME('To|CSTRING(6)|@S5|ATTRIBUTE')                                                                                         ! [00012-00017] Field ending location.
FieldName                                   CSTRING(49),NAME('Name|CSTRING(49)|@S48|ATTRIBUTE')                                                                                    ! [00018-00066] Field name.
FieldWhom                                   CSTRING(49),NAME('Whom|CSTRING(49)|@S48|ATTRIBUTE')                                                                                    ! [00067-00115] Field whom it is.
FieldType                                   CSTRING(49),NAME('Type|CSTRING(49)|@S48|ATTRIBUTE')                                                                                    ! [00116-00164] Field type clarion.
FieldFormat                                 CSTRING(49),NAME('Format|CSTRING(49)|@S48|ATTRIBUTE')                                                                                  ! [00165-00213] Field format clarion.
FieldRange                                  CSTRING(49),NAME('Range|CSTRING(49)|@S48|ATTRIBUTE')                                                                                   ! [00214-00262] Field range location.
FieldPrompt                                 CSTRING(129),NAME('Prompt|CSTRING(129)|@S128|ATTRIBUTE')                                                                               ! [00263-00391] Field prompt literal.
FieldColumn                                 CSTRING(129),NAME('Column|CSTRING(129)|@S128|ATTRIBUTE')                                                                               ! [00392-00520] Field column literal.
FieldTypeSQL                                CSTRING(129),NAME('SQLType|CSTRING(129)|@S128|ATTRIBUTE')                                                                              ! [00521-00649] Field type SQL.
FieldFormatSQL                              CSTRING(129),NAME('SQLFormat|CSTRING(129)|@S128|ATTRIBUTE')                                                                            ! [00650-00778] Field format SQL.
FieldLength                                 LONG,NAME('Field Length|LONG|@N-4|ATTRIBUTE')                                                                                          ! [00779-00782] Name attribute string length.
FieldTemp                                   CSTRING(241),NAME('Temp|CSTRING(241)|@S240|ATTRIBUTE')                                                                                 ! [00783-01023] Field attributes temporary.
                                          END
!EndRegion
!Region QueueDefinition
!
!-Queue-
!
gtNAMEATTRQT                              QUEUE(gtNAMEATTRGT),TYPE,NAME('gtNAMEATTRQT')
                                          END
!EndRegion
!Region FieldEquates
!
!-Equates-
!
C_GTNAMEATTR_FIELDNUMBER                                      EQUATE(1)
C_GTNAMEATTR_FIELDSALT                                        EQUATE(2)
C_GTNAMEATTR_FIELDHASH                                        EQUATE(3)
C_GTNAMEATTR_FIELDENCRYPT                                     EQUATE(4)
C_GTNAMEATTR_FIELDFROM                                        EQUATE(5)
C_GTNAMEATTR_FIELDTO                                          EQUATE(6)
C_GTNAMEATTR_FIELDNAME                                        EQUATE(7)
C_GTNAMEATTR_FIELDWHOM                                        EQUATE(8)
C_GTNAMEATTR_FIELDTYPE                                        EQUATE(9)
C_GTNAMEATTR_FIELDFORMAT                                      EQUATE(10)
C_GTNAMEATTR_FIELDRANGE                                       EQUATE(11)
C_GTNAMEATTR_FIELDPROMPT                                      EQUATE(12)
C_GTNAMEATTR_FIELDCOLUMN                                      EQUATE(13)
C_GTNAMEATTR_FIELDTYPESQL                                     EQUATE(14)
C_GTNAMEATTR_FIELDFORMATSQL                                   EQUATE(15)
C_GTNAMEATTR_FIELDLENGTH                                      EQUATE(16)
C_GTNAMEATTR_FIELDTEMP                                        EQUATE(17)
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
!   '20L(0)|M~From~@S5@#5#' & |
!   '20L(0)|M~To~@S5@#6#' & |
!   '120L(2)|M~Name~@s48@#7#' & |
!   '120L(2)|M~Whom~@s48@#8#' & |
!   '120L(2)|M~Type~@s48@#9#' & |
!   '120L(2)|M~Format~@s48@#10#' & |
!   '120L(2)|M~Range~@s48@#11#' & |
!   '120L(2)|M~Prompt~@s128@#12#' & |
!   '120L(2)|M~Column~@s128@#13#' & |
!   '120L(2)|M~SQLType~@s128@#14#' & |
!   '120L(2)|M~SQLFormat~@s128@#15#' & |
!   '56R(1)|M~Field Length~@n-4@#16#' & |
!   '120L(2)|M~Temp~@s240@#17#' & |
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
!   gtNAMEATTR_oListClass.ListQ.FieldLength, |
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
!   '20L(0)|M~From~@S5@#5#' & |
!   '20L(0)|M~To~@S5@#6#' & |
!   '120L(2)|M~Name~@s48@#7#' & |
!   '120L(2)|M~Whom~@s48@#8#' & |
!   '120L(2)|M~Type~@s48@#9#' & |
!   '120L(2)|M~Format~@s48@#10#' & |
!   '120L(2)|M~Range~@s48@#11#' & |
!   '120L(2)|M~Prompt~@s128@#12#' & |
!   '120L(2)|M~Column~@s128@#13#' & |
!   '120L(2)|M~SQLType~@s128@#14#' & |
!   '120L(2)|M~SQLFormat~@s128@#15#' & |
!   '56R(1)|M~Field Length~@n-4@#16#' & |
!   '120L(2)|M~Temp~@s240@#17#' & |
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
!   ListQ.FieldLength, |
!   ListQ.FieldTemp)
!
!EndRegion
!
!EOF
