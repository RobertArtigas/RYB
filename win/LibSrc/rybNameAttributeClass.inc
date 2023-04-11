!ClassIncludeFile(_RYB_)

OMIT('_EndOfInclude_',_rybNameAttributeClass_)

! RA.2022.11.07: Start editing changes log

_rybNameAttributeClass_ EQUATE(1)

  INCLUDE('EQUATES.CLW'),ONCE
  INCLUDE('ERRORS.CLW'),ONCE
  INCLUDE('StringTheory.Inc'),ONCE

GTNAMEATTR                  GROUP,TYPE
FieldNumber                   SHORT,NAME('FieldNumber|SHORT|@N4B|[0001-0002]|PR(''Field Number:'')|CO(''Number'')')                                                  ! [0001-0002] Field number.
FieldSalt                     BYTE,NAME('FieldSalt|BYTE|@N1B|[0003-0003]|PR(''Field Salt:'')|CO(''Salt'')')                                                          ! [0003-0003] Is a SALT encryption?
FieldHash                     BYTE,NAME('FieldHash|BYTE|@N1B|[0004-0004]|PR(''Field Hash'')|CO(''Hash'')')                                                           ! [0004-0004] Is a HASH encryption?
FieldEncrypt                  BYTE,NAME('FieldEncrypt|BYTE|@N1B|[0005-0005]|PR(''Field Encrypt'')|CO(''Encrypt'')')                                                  ! [0005-0005] Is a FIELD encryption?
FieldFrom                     CSTRING(5),NAME('FieldFrom|CSTRING(5)|@S4|[0006-0010]|PR(''Field From:'')|CO(''From'')|ATTRIBUTE')                                     ! [0006-0010] Field starting location.
FieldTo                       CSTRING(5),NAME('FieldTo|CSTRING(5)|@S4|[0011-0015]|PR(''Field To:'')|CO(''To'')|ATTRIBUTE')                                           ! [0011-0015] Field ending location.
FieldName                     CSTRING(49),NAME('FieldName|CSTRING(49)|@S48|[0016-0064]|PR(''Field Name:'')|CO(''Name'')|ATTRIBUTE')                                  ! [0016-0064] Field name.
FieldWhom                     CSTRING(49),NAME('FieldWhom|CSTRING(49)|@S48|[0065-0113]|PR(''Field Whom:'')|CO(''Whom'')|ATTRIBUTE')                                  ! [0065-0113] Field whom it is.
FieldType                     CSTRING(49),NAME('FieldType|CSTRING(49)|@S48|[0114-0162]|PR(''Field Type:'')|CO(''Type'')|ATTRIBUTE')                                  ! [0114-0162] Field type clarion.
FieldFormat                   CSTRING(49),NAME('FieldFormat|CSTRING(49)|@S48|[0163-0211]|PR(''Field Format:'')|CO(''Format'')|ATTRIBUTE')                            ! [0163-0211] Field format clarion.
FieldRange                    CSTRING(49),NAME('FieldRange|CSTRING(49)|@S48|[0212-0260]|PR(''Field Range:'')|CO(''Range'')|ATTRIBUTE')                               ! [0212-0260] Field range location.
FieldPrompt                   CSTRING(129),NAME('FieldPrompt|CSTRING(129)|@S128|[0261-0389]|PR(''Field Prompt:'')|CO(''Prompt'')|ATTRIBUTE')                         ! [0261-0389] Field prompt literal.
FieldColumn                   CSTRING(129),NAME('FieldColumn|CSTRING(129)|@S128|[0390-0518]|PR(''Field Column:'')|CO(''Column'')|ATTRIBUTE')                         ! [0390-0518] Field column literal.
FieldTypeSQL                  CSTRING(129),NAME('FieldTypeSQL|CSTRING(129)|@S128|[0519-0647]|PR(''SQL Type:'')|CO(''SQLType'')|ATTRIBUTE')                           ! [0519-0647] Field type SQL.
FieldFormatSQL                CSTRING(129),NAME('FieldFormatSQL|CSTRING(129)|@S128|[0648-0776]|PR(''SQL Format:'')|CO(''SQLFormat'')|ATTRIBUTE')                     ! [0648-0776] Field format SQL.
FieldLength                   LONG,NAME('FieldLength|LONG|@N-4|[0777-0780]|PR(''Field Length:'')|CO(''Field Length'')|ATTRIBUTE')                                    ! [0777-0780] Name attribute string length.
FieldTemp                     CSTRING(241),NAME('FieldTemp|CSTRING(241)|@S240|[0781-1021]|PR(''Field Temp:'')|CO(''Temp'')|ATTRIBUTE')                               ! [0781-1021] Field attributes temporary.
                            END
!
QTNAMEATTR                  QUEUE(GTNAMEATTR),TYPE
                            END
!
C_NAMEATTR_FIELDNUMBER      EQUATE(1)
C_NAMEATTR_FIELDSALT        EQUATE(2)
C_NAMEATTR_FIELDHASH        EQUATE(3)
C_NAMEATTR_FIELDENCRYPT     EQUATE(4)
C_NAMEATTR_FIELDFROM        EQUATE(5)
C_NAMEATTR_FIELDTO          EQUATE(6)
C_NAMEATTR_FIELDNAME        EQUATE(7)
C_NAMEATTR_FIELDWHOM        EQUATE(8)
C_NAMEATTR_FIELDTYPE        EQUATE(9)
C_NAMEATTR_FIELDFORMAT      EQUATE(10)
C_NAMEATTR_FIELDRANGE       EQUATE(11)
C_NAMEATTR_FIELDPROMPT      EQUATE(12)
C_NAMEATTR_FIELDCOLUMN      EQUATE(13)
C_NAMEATTR_FIELDTYPESQL     EQUATE(14)
C_NAMEATTR_FIELDFORMATSQL   EQUATE(15)
C_NAMEATTR_FIELDTEMP        EQUATE(16)


!================================================================
rybNameAttributeClass       CLASS(),MODULE('rybNameAttributeClass.clw'),LINK('rybNameAttributeClass.clw')  !,_RYBLink_),DLL(_RYBDLL_)
!================================================================
!-- Properties
WhatAmI                       STRING('rybNameAttributeClass')
ShowDebug                     BYTE
CntFields                     SHORT
ItemNumber                    LONG
naG                           GROUP(GTNAMEATTR) END                           
naQ                           &QTNAMEATTR
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
                            END!rybNameAttributeClass


!Region Testing Group
! ================================================================================
gtE301                      GROUP,TYPE
timestamp                     REAL,NAME('ts|REAL|@N15.0B|[0001-0008]|PR(''TS:'')|CO(''TS'')')                                                                        ! [0001-0008] Local time stamp.
servertimestamp               REAL,NAME('sts|REAL|@N15.0B|[0009-0016]|PR(''STS:'')|CO(''STS'')')                                                                     ! [0009-0016] Server time stamp.
deletedtimestamp              REAL,NAME('dts|REAL|@N15.0B|[0017-0024]|PR(''DTS:'')|CO(''DTS'')')                                                                     ! [0017-0024] Deleted time stamp.
encryptionversion             LONG,NAME('encryptionversion|LONG|@N-14|[0025-0028]|PR(''Encryption Version:'')|CO(''EV'')')                                           ! [0025-0028] Encryption version.
date_update                   DATE,NAME('date_update|DATE|@D010-B|[0029-0032]|PR(''Date update:'')|CO(''DateUp'')')                                                  ! [0029-0032] Date update.
time_update                   TIME,NAME('time_update|TIME|@T04B|[0033-0036]|PR(''Time update:'')|CO(''TimeUp'')')                                                    ! [0033-0036] Time update.
user_update                   STRING(20),NAME('user_update|STRING(20)|@S20|[0037-0056]|PR(''User Update:'')|CO(''UserUp'')')                                         ! [0037-0056] User update.
active_flag                   STRING(1),NAME('active_flag|STRING(1)|@S1|[0057-0057]|PR(''Active flag:'')|CO(''A'')')                                                 ! [0057-0057] Active flag.
guid                          STRING(16),NAME('guid|STRING(16)|@S16|[0058-0073]|PR(''GUID:'')|CO(''GUID'')|Salt')                                                    ! [0058-0073] Primary identifier.
guid_parent                   STRING(16),NAME('guid_parent|STRING(16)|@S16|[0074-0089]|PR(''GUID Parent:'')|CO(''GUIDP'')')                                          ! [0074-0089] Primary parent identifier.
hash_name                     STRING(128),NAME('hash_name|STRING(128)|@S128|[0090-0217]|PR(''Hash Name:'')|CO(''HashName'')')                                        ! [0090-0217] Name hash.
p_order                       SHORT,NAME('p_order|SHORT|@N-4|[0218-0219]|PR(''Order:'')|CO(''Order'')')                                                              ! [0218-0219] Presentation order.
data_code                     STRING(9),NAME('data_code|STRING(9)|@S9|[0220-0228]|PR(''Code:'')|CO(''Code'')')                                                       ! [0220-0228] Data code.
data_name                     STRING(240),NAME('data_name|STRING(240)|@S240|[0229-0468]|PR(''Name:'')|CO(''Name'')|Hash(HASH_NAME)|Encrypted(MYTABLE)')              ! [0229-0468] Data name.
                            END
! ================================================================================
!EndRegion

! _EndOfInclude_

