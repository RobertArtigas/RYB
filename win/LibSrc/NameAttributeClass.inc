!ClassIncludeFile(_RYB_)

OMIT('_EndOfInclude_',_NameAttributeClass_)

_NameAttributeClass_ EQUATE(1)

  INCLUDE('EQUATES.CLW'),ONCE
  INCLUDE('ERRORS.CLW'),ONCE
  INCLUDE('StringTheory.Inc'),ONCE

gtNameAttr                GROUP,TYPE
FieldNumber                 SHORT,NAME('FieldNumber|SHORT|@N4B|[0001-0004]|PR(''Field Number:'')|CO(''Number'')')                                                  ! [0001-0004] Field number.
FieldSalt                   BYTE,NAME('FieldSalt|BYTE|@N1B|[0005-0005]|PR(''Field Salt:'')|CO(''Salt'')')                                                          ! [0005-0005] Is a SALT encryption?
FieldFrom                   LONG,NAME('FieldFrom|LONG|@N04|[0006-0009]|PR(''Field From:'')|CO(''From'')')                                                          ! [0006-0009] Field starting location.
FieldTo                     LONG,NAME('FieldTo|LONG|@N04|[0010-0013]|PR(''Field To:'')|CO(''To'')')                                                                ! [0010-0013] Field ending location.
FieldName                   CSTRING(49),NAME('FieldName|CSTRING(49)|@S48|[0014-0062]|PR(''Field Name:'')|CO(''Name'')')                                            ! [0014-0062] Field name.
FieldWhom                   CSTRING(49),NAME('FieldWhom|CSTRING(49)|@S48|[0063-0111]|PR(''Field Whom:'')|CO(''Whom'')')                                            ! [0063-0111] Field whom it is.
FieldType                   CSTRING(49),NAME('FieldType|CSTRING(49)|@S48|[0112-0160]|PR(''Field Type:'')|CO(''Type'')')                                            ! [0112-0160] Field type clarion.
FieldFormat                 CSTRING(49),NAME('FieldFormat|CSTRING(49)|@S48|[0161-0209]|PR(''Field Format:'')|CO(''Format'')')                                      ! [0161-0209] Field format clarion.
FieldRange                  CSTRING(49),NAME('FieldRange|CSTRING(49)|@S48|[0210-0258]|PR(''Field Range:'')|CO(''Range'')')                                         ! [0210-0258] Field range location.
FieldPrompt                 CSTRING(129),NAME('FieldPrompt|CSTRING(129)|@S128|[0259-0387]|PR(''Field Prompt:'')|CO(''Prompt'')')                                   ! [0259-0387] Field prompt literal.
FieldColumn                 CSTRING(129),NAME('FieldColumn|CSTRING(129)|@S128|[0388-0516]|PR(''Field Column:'')|CO(''Column'')')                                   ! [0388-0516] Field column literal.
FieldTypeSQL                CSTRING(129),NAME('FieldTypeSQL|CSTRING(129)|@S128|[0517-0645]|PR(''SQL Type:'')|CO(''SQLType'')')                                     ! [0517-0645] Field type SQL.
FieldFormatSQL              CSTRING(129),NAME('FieldFormatSQL|CSTRING(129)|@S128|[0646-0774]|PR(''SQL Format:'')|CO(''SQLFormat'')')                               ! [0646-0774] Field format SQL.
FieldTemp                   CSTRING(241),NAME('FieldTemp|CSTRING(241)|@S240|[0775-1015]|PR(''Field Temp:'')|CO(''Temp'')')                                         ! [0775-1015] Field attributes temporary.
                          END

qtNameAttr                QUEUE(gtNameAttr),TYPE
                          END
					 
C_NAMEATTR_FIELDNUMBER      EQUATE(1)
C_NAMEATTR_FIELDSALT        EQUATE(2)
C_NAMEATTR_FIELDFROM        EQUATE(3)
C_NAMEATTR_FIELDTO          EQUATE(4)
C_NAMEATTR_FIELDNAME        EQUATE(5)
C_NAMEATTR_FIELDWHOM        EQUATE(6)
C_NAMEATTR_FIELDTYPE        EQUATE(7)
C_NAMEATTR_FIELDFORMAT      EQUATE(8)
C_NAMEATTR_FIELDRANGE       EQUATE(9)
C_NAMEATTR_FIELDPROMPT      EQUATE(10)
C_NAMEATTR_FIELDCOLUMN      EQUATE(11)
C_NAMEATTR_FIELDTYPESQL     EQUATE(12)
C_NAMEATTR_FIELDFORMATSQL   EQUATE(13)
C_NAMEATTR_FIELDTEMP        EQUATE(14)

!================================================================
NameAttributeClass        CLASS(),MODULE('NameAttributeClass.clw'),LINK('NameAttributeClass.clw')  !,_RYBLink_),DLL(_RYBDLL_)
!================================================================
!-- Properties
WhatAmI                     STRING('NameAttributeClass')
ShowDebug                   BYTE
CntFields                   SHORT
ItemNumber                  LONG
naG                         GROUP(gtNameAttr) END                           
naQ                         &qtNameAttr
!-- Methods
Construct                   PROCEDURE()
Destruct                    PROCEDURE()
SetDebug                    PROCEDURE(BYTE xShowDebug)
Debug                       PROCEDURE(STRING xMsg)
WhatAmI                     PROCEDURE(),STRING
Init                        PROCEDURE(*GROUP xGroup),BYTE,PROC
ValueDebug                  PROCEDURE()
ValueSetItem                PROCEDURE(BYTE xAttribute,STRING xData)
ValueGetItem                PROCEDURE(BYTE xAttribute),STRING
ValueClear                  PROCEDURE()
DataSetItem                 PROCEDURE(LONG xFieldNumber,BYTE xAttribute,STRING xData)
DataGetItem                 PROCEDURE(LONG xFieldNumber,BYTE xAttribute),STRING
IsSalt                      PROCEDURE(LONG xFieldNumber),BYTE
_CountFields                PROCEDURE(*GROUP xGroup),SHORT        
                          END!NameAttributeClass


!Region Testing Group
! ================================================================================
gtTestBase                GROUP,TYPE                                                           ! TEST: + Base
timestamp                   REAL,NAME('ts|REAL|@N15.0B|[0001-0008]|PR(''TS:'')|CO(''TS'')')                                                                        ! [0001-0008] Local time stamp.
servertimestamp             REAL,NAME('sts|REAL|@N15.0B|[0009-0016]|PR(''STS:'')|CO(''STS'')')                                                                     ! [0009-0016] Server time stamp.
deletedtimestamp            REAL,NAME('dts|REAL|@N15.0B|[0017-0024]|PR(''DTS:'')|CO(''DTS'')')                                                                     ! [0017-0024] Deleted time stamp.
encryptionversion           LONG,NAME('encryptionversion|LONG|@N-14|[0025-0028]|PR(''Encryption Version:'')|CO(''EV'')')                                           ! [0025-0028] Encryption version.
date_update                 DATE,NAME('date_update|DATE|@D010-B|[0029-0032]|PR(''Date update:'')|CO(''DateUp'')')                                                  ! [0029-0032] Date update.
time_update                 TIME,NAME('time_update|TIME|@T04B|[0033-0036]|PR(''Time update:'')|CO(''TimeUp'')')                                                    ! [0033-0036] Time update.
user_update                 STRING(20),NAME('user_update|STRING(20)|@S20|[0037-0056]|PR(''User Update:'')|CO(''UserUp'')')                                         ! [0037-0056] User update.
active_flag                 STRING(1),NAME('active_flag|STRING(1)|@S1|[0057-0057]|PR(''Active flag:'')|CO(''A'')')                                                 ! [0057-0057] Active flag.
guid                        STRING(16),NAME('guid|STRING(16)|@S16|[0058-0073]|PR(''GUID:'')|CO(''GUID'')|Salt')                                                    ! [0058-0073] Primary identifier.
p_order                     SHORT,NAME('p_order|SHORT|@N-4|[0074-0075]|PR(''Order:'')|CO(''Order'')')                                                              ! [0074-0075] Presentation order.
data_code                   STRING(9),NAME('data_code|STRING(9)|@S9|[0076-0084]|PR(''Code:'')|CO(''Code'')')                                                       ! [0076-0084] Data code.
data_name                   STRING(240),NAME('data_name|STRING(240)|@S240|[0085-0324]|PR(''Name:'')|CO(''Name'')')                                                 ! [0085-0324] Data name.
                          END                                                                  ! gtTestBase
! ================================================================================
!EndRegion

! _EndOfInclude_

