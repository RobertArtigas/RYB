!BOF
!
!Region Generate
!
! Dictionary:   C:\_GIT_\RobertArtigas\RYB\examples\GroupsAndQueus\rybGTQT.dct
! File:         .\grpque_gtFld.inc
! Date-Time:    2025-06-21 - 03:51:13PM
! Purpose:      Generated File Records as Groups
! Created:      Generate GROUP and QUEUE Template
! Author:       Copyright � 1999-2999 by Roberto Artigas y Soler
!               All rights reserved world wide.
! Narative:     This template is used to pass records structures
!               back and forth between DLL's when the tables
!               might not be shared. Since table definitions are not
!               available, data has to be passed in areas.
!
!EndRegion
!Region Header
! Name:         gtFld
! Prefix:       Field
! Description:  Field definition.
! Filename:     'zField.TPS'
!EndRegion
!Region KeyDocs
!
!-Keys Docs-
!
! fld_key0_pkey                           Name(ASCENDING)
!EndRegion
!Region KeyDefinitions
!
!-Keys-
!
Field_fld_key0_pkey                       GROUP,TYPE,NAME('Field_fld_key0_pkey')
Name                                        STRING(128),NAME('Name|STRING(128)|@S128|ATTRIBUTE')                                                                                   ! [00001-00128] Field name.
                                          END 
!EndRegion
!Region GroupDefinition
!
!-Group-
!
FieldGT                                   GROUP,TYPE,NAME('FieldGT')
Name                                        STRING(128),NAME('Name|STRING(128)|@S128|ATTRIBUTE')                                                                                   ! [00001-00128] Field name.
                                          END
!EndRegion
!Region QueueDefinition
!
!-Queue-
!
FieldQT                                   QUEUE(FieldGT),TYPE,NAME('FieldQT')
                                          END
!EndRegion
!Region FieldEquates
!
!-Equates-
!
C_FIELD_NAME                                                  EQUATE(1)
!
!EndRegion
!Region Class_YES
!-------------------------------------------------------------------------------------------------!
! Control:      ?Field_ListQ                                                                      !
! Object Name:  Field_oListClass                                                                  !
! Queue List:   ListQ                                                                             !
!-------------------------------------------------------------------------------------------------!
! This LIST structure is created to replace the one generated by the ABC templates.               !
! Save your generated window structure first, then cut and paste replacing your LIST structure.   !
!-------------------------------------------------------------------------------------------------!
! LIST,AT(4,40,400,40),USE(?Field_ListQ),HVSCROLL, |
!   FORMAT('' & |
!   '120L(0)|M~Name~@s128@#1#' & |
!   ''), |
!   FROM(Field_oListClass.ListQ), |
!   #FIELDS(Field_oListClass.ListQ.Name)
!
!EndRegion
!Region Class_NO
!-------------------------------------------------------------------------------------------------!
! Control:      ?Field_ListQ                                                                      !
! Queue List:   ListQ                                                                             !
!-------------------------------------------------------------------------------------------------!
! This LIST structure is created to replace the one generated by the ABC templates.               !
! Save your generated window structure first, then cut and paste replacing your LIST structure.   !
!-------------------------------------------------------------------------------------------------!
! LIST,AT(4,40,400,40),USE(?Field_ListQ),HVSCROLL, |
!   FORMAT('' & |
!   '120L(0)|M~Name~@s128@#1#' & |
!   ''), |
!   FROM(ListQ), |
!   #FIELDS(ListQ.Name)
!
!EndRegion
!
!EOF
