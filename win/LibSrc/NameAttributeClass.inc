!ClassIncludeFile(_RYB_)

OMIT('_EndOfInclude_',_NameAttributeClass_)

_NameAttributeClass_ EQUATE(1)

  INCLUDE('EQUATES.CLW'),ONCE
  INCLUDE('ERRORS.CLW'),ONCE
  INCLUDE('StringTheory.Inc'),ONCE

GTNAMEATTR_tRec             GROUP,TYPE
FieldNumber                   SHORT,NAME('FieldNumber|SHORT|@N4B|[0001-0002]|PR(''Field Number:'')|CO(''Number'')')                                                  ! [0001-0002] Field number.
FieldSalt                     BYTE,NAME('FieldSalt|BYTE|@N1B|[0003-0003]|PR(''Field Salt:'')|CO(''Salt'')')                                                          ! [0003-0003] Is a SALT encryption?
FieldHash                     BYTE,NAME('FieldHash|BYTE|@N1B|[0004-0004]|PR(''Field Hash'')|CO(''Hash'')')                                                           ! [0004-0004] Is a HASH encryption?
FieldEncrypt                  BYTE,NAME('FieldEncrypt|BYTE|@N1B|[0005-0005]|PR(''Field Encrypt'')|CO(''Encrypt'')')                                                  ! [0005-0005] Is a FIELD encryption?
FieldFrom                     LONG,NAME('FieldFrom|LONG|@N04|[0006-0009]|PR(''Field From:'')|CO(''From'')')                                                          ! [0006-0009] Field starting location.
FieldTo                       LONG,NAME('FieldTo|LONG|@N04|[0010-0013]|PR(''Field To:'')|CO(''To'')')                                                                ! [0010-0013] Field ending location.
FieldName                     CSTRING(49),NAME('FieldName|CSTRING(49)|@S48|[0014-0062]|PR(''Field Name:'')|CO(''Name'')')                                            ! [0014-0062] Field name.
FieldWhom                     CSTRING(49),NAME('FieldWhom|CSTRING(49)|@S48|[0063-0111]|PR(''Field Whom:'')|CO(''Whom'')')                                            ! [0063-0111] Field whom it is.
FieldType                     CSTRING(49),NAME('FieldType|CSTRING(49)|@S48|[0112-0160]|PR(''Field Type:'')|CO(''Type'')')                                            ! [0112-0160] Field type clarion.
FieldFormat                   CSTRING(49),NAME('FieldFormat|CSTRING(49)|@S48|[0161-0209]|PR(''Field Format:'')|CO(''Format'')')                                      ! [0161-0209] Field format clarion.
FieldRange                    CSTRING(49),NAME('FieldRange|CSTRING(49)|@S48|[0210-0258]|PR(''Field Range:'')|CO(''Range'')')                                         ! [0210-0258] Field range location.
FieldPrompt                   CSTRING(129),NAME('FieldPrompt|CSTRING(129)|@S128|[0259-0387]|PR(''Field Prompt:'')|CO(''Prompt'')')                                   ! [0259-0387] Field prompt literal.
FieldColumn                   CSTRING(129),NAME('FieldColumn|CSTRING(129)|@S128|[0388-0516]|PR(''Field Column:'')|CO(''Column'')')                                   ! [0388-0516] Field column literal.
FieldTypeSQL                  CSTRING(129),NAME('FieldTypeSQL|CSTRING(129)|@S128|[0517-0645]|PR(''SQL Type:'')|CO(''SQLType'')')                                     ! [0517-0645] Field type SQL.
FieldFormatSQL                CSTRING(129),NAME('FieldFormatSQL|CSTRING(129)|@S128|[0646-0774]|PR(''SQL Format:'')|CO(''SQLFormat'')')                               ! [0646-0774] Field format SQL.
FieldTemp                     CSTRING(241),NAME('FieldTemp|CSTRING(241)|@S240|[0775-1015]|PR(''Field Temp:'')|CO(''Temp'')')                                         ! [0775-1015] Field attributes temporary.
                            END
!
GTNAMEATTR_qRec             QUEUE(GTNAMEATTR_tRec),TYPE
                            END
!
C_GTNAMEATTR_FIELDNUMBER      EQUATE(1)
C_GTNAMEATTR_FIELDSALT        EQUATE(2)
C_GTNAMEATTR_FIELDHASH        EQUATE(3)
C_GTNAMEATTR_FIELDENCRYPT     EQUATE(4)
C_GTNAMEATTR_FIELDFROM        EQUATE(5)
C_GTNAMEATTR_FIELDTO          EQUATE(6)
C_GTNAMEATTR_FIELDNAME        EQUATE(7)
C_GTNAMEATTR_FIELDWHOM        EQUATE(8)
C_GTNAMEATTR_FIELDTYPE        EQUATE(9)
C_GTNAMEATTR_FIELDFORMAT      EQUATE(10)
C_GTNAMEATTR_FIELDRANGE       EQUATE(11)
C_GTNAMEATTR_FIELDPROMPT      EQUATE(12)
C_GTNAMEATTR_FIELDCOLUMN      EQUATE(13)
C_GTNAMEATTR_FIELDTYPESQL     EQUATE(14)
C_GTNAMEATTR_FIELDFORMATSQL   EQUATE(15)
C_GTNAMEATTR_FIELDTEMP        EQUATE(16)


!================================================================
NameAttributeClass          CLASS(),MODULE('NameAttributeClass.clw'),LINK('NameAttributeClass.clw')  !,_RYBLink_),DLL(_RYBDLL_)
!================================================================
!-- Properties
WhatAmI                       STRING('NameAttributeClass')
ShowDebug                     BYTE
CntFields                     SHORT
ItemNumber                    LONG
naG                           GROUP(GTNAMEATTR_tRec) END                           
naQ                           &GTNAMEATTR_qRec
!-- Methods
Construct                     PROCEDURE()
Destruct                      PROCEDURE()
SetDebug                      PROCEDURE(BYTE xShowDebug)
Debug                         PROCEDURE(STRING xMsg)
WhatAmI                       PROCEDURE(),STRING
Init                          PROCEDURE(*GROUP xGroup),BYTE,PROC
ValueDebug                    PROCEDURE()
ValueSetItem                  PROCEDURE(BYTE xAttribute,STRING xData)
ValueGetItem                  PROCEDURE(BYTE xAttribute),STRING
ValueClear                    PROCEDURE()
DataSetItem                   PROCEDURE(LONG xFieldNumber,BYTE xAttribute,STRING xData)
DataGetItem                   PROCEDURE(LONG xFieldNumber,BYTE xAttribute),STRING
IsSalt                        PROCEDURE(LONG xFieldNumber),BYTE
IsHash                        PROCEDURE(LONG xFieldNumber),BYTE
IsEncrypt                     PROCEDURE(LONG xFieldNumber),BYTE
_CountFields                  PROCEDURE(*GROUP xGroup),SHORT        
                            END!NameAttributeClass


!Region Testing Group
! ================================================================================
gtE301_tRec                               GROUP,TYPE
timestamp                                   REAL,NAME('ts|REAL|@N15.0B|[0001-0008]|PR(''TS:'')|CO(''TS'')')                                                                        ! [0001-0008] Local time stamp.
servertimestamp                             REAL,NAME('sts|REAL|@N15.0B|[0009-0016]|PR(''STS:'')|CO(''STS'')')                                                                     ! [0009-0016] Server time stamp.
deletedtimestamp                            REAL,NAME('dts|REAL|@N15.0B|[0017-0024]|PR(''DTS:'')|CO(''DTS'')')                                                                     ! [0017-0024] Deleted time stamp.
encryptionversion                           LONG,NAME('encryptionversion|LONG|@N-14|[0025-0028]|PR(''Encryption Version:'')|CO(''EV'')')                                           ! [0025-0028] Encryption version.
date_update                                 DATE,NAME('date_update|DATE|@D010-B|[0029-0032]|PR(''Date update:'')|CO(''DateUp'')')                                                  ! [0029-0032] Date update.
time_update                                 TIME,NAME('time_update|TIME|@T04B|[0033-0036]|PR(''Time update:'')|CO(''TimeUp'')')                                                    ! [0033-0036] Time update.
user_update                                 STRING(20),NAME('user_update|STRING(20)|@S20|[0037-0056]|PR(''User Update:'')|CO(''UserUp'')')                                         ! [0037-0056] User update.
active_flag                                 STRING(1),NAME('active_flag|STRING(1)|@S1|[0057-0057]|PR(''Active flag:'')|CO(''A'')')                                                 ! [0057-0057] Active flag.
guid                                        STRING(16),NAME('guid|STRING(16)|@S16|[0058-0073]|PR(''GUID:'')|CO(''GUID'')|Salt')                                                    ! [0058-0073] Primary identifier.
guid_parent                                 STRING(16),NAME('guid_parent|STRING(16)|@S16|[0074-0089]|PR(''GUID Parent:'')|CO(''GUIDP'')')                                          ! [0074-0089] Primary parent identifier.
hash_name                                   STRING(128),NAME('hash_name|STRING(128)|@S128|[0090-0217]|PR(''Hash Name:'')|CO(''HashName'')')                                        ! [0090-0217] Name hash.
p_order                                     SHORT,NAME('p_order|SHORT|@N-4|[0218-0219]|PR(''Order:'')|CO(''Order'')')                                                              ! [0218-0219] Presentation order.
data_code                                   STRING(9),NAME('data_code|STRING(9)|@S9|[0220-0228]|PR(''Code:'')|CO(''Code'')')                                                       ! [0220-0228] Data code.
data_name                                   STRING(240),NAME('data_name|STRING(240)|@S240|[0229-0468]|PR(''Name:'')|CO(''Name'')|Hash(HASH_NAME)|Encrypted(MYTABLE)')              ! [0229-0468] Data name.
                                          END
! ================================================================================
!EndRegion

! _EndOfInclude_

