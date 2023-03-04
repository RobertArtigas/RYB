  MEMBER

! RA.2022.11.07: Start editing changes log
  
  MAP
    MODULE('kernel')
      DebugBreak(),PASCAL !,RAW,NAME('debugbreak')
      OutputDebugString(*CSTRING),PASCAL,RAW,NAME('OutputDebugStringA')  !32-bit only
    END
  END

  INCLUDE('rybNameAttributeClass.inc'),ONCE

!-------------------------------------------------------------------
rybNameAttributeClass.Construct         PROCEDURE()
!-------------------------------------------------------------------
  CODE
  SELF.Debug('CLASS(' & THREAD() & '): rybNameAttributeClass.Construct')
  !STOP('CLASS(' & THREAD() & '): rybNameAttributeClass.Construct')
  SELF.ShowDebug  = FALSE
  SELF.CntFields  = 0
  SELF.ValueClear()
  SELF.naQ &= NEW qtNameAttr
  FREE(SELF.naQ)
  RETURN

!-------------------------------------------------------------------
rybNameAttributeClass.Destruct          PROCEDURE()
!-------------------------------------------------------------------
  CODE
  SELF.Debug('CLASS(' & THREAD() & '): rybNameAttributeClass.Destruct')
  !STOP('CLASS(' & THREAD() & '): rybNameAttributeClass.Destruct')
  SELF.ShowDebug  = FALSE
  SELF.ValueClear()
  FREE(SELF.naQ)
  DISPOSE(SELF.naQ)
  RETURN

!-------------------------------------------------------------------
rybNameAttributeClass.SetDebug          PROCEDURE(Byte xShowDebug = False)
!-------------------------------------------------------------------
  CODE
  SELF.ShowDebug  = xShowDebug
  RETURN

!-------------------------------------------------------------------
rybNameAttributeClass.Debug             PROCEDURE(String xMsg)
!-------------------------------------------------------------------
szMSG       &CSTRING
  CODE
  szMSG &= NEW CSTRING( SIZE(xMsg) + SIZE('<13,10,0>') )
  szMSG  =                   xMsg  &      '<13,10,0>'
  OutputDebugString(szMSG)
  DISPOSE(szMSG)
  RETURN

!-------------------------------------------------------------------
rybNameAttributeClass.WhatAmI           PROCEDURE() !,String
!-------------------------------------------------------------------
  CODE
  IF SELF.ShowDebug
    SELF.Debug(SELF.WhatAmI)
  END
  RETURN SELF.WhatAmI
  
!-------------------------------------------------------------------
rybNameAttributeClass.Init              PROCEDURE(*GROUP xGroup) !,BYTE,PROC
!-------------------------------------------------------------------
ST          StringTheory
X           SHORT
  CODE
  SELF.Debug('CLASS(' & THREAD() & '): rybNameAttributeClass.Init(...): ENTER ==========')
  IF NOT xGroup THEN 
    SELF.Debug('CLASS(' & THREAD() & '): rybNameAttributeClass.Init(...): No GROUP structure passed')
    RETURN FALSE 
  END
  SELF.CntFields        	      = SELF._CountFields(xGroup)
  SELF.Debug('CLASS(' & THREAD() & '): rybNameAttributeClass.Init(...): SELF.CntFields=[ ' & SELF.CntFields & ' ]')
  !STOP('CLASS(' & THREAD() & '): rybNameAttributeClass.Init(...): SELF.CntFields=[ ' & SELF.CntFields & ' ]')
  FREE(SELF.naQ)
  LOOP X = 1 TO SELF.CntFields
    CLEAR(SELF.naG)
	  SELF.naG.FieldNumber        = X
	  SELF.naG.FieldTemp          = WHO(xGroup, X)
    SELF.Debug('CLASS(' & THREAD() & '): Init(...): FieldTemp[' & FORMAT(X,@n03) & '](' & FORMAT(LEN(CLIP(SELF.naG.FieldTemp)),@N05) & ')=[ "' & CLIP(SELF.naG.FieldTemp) & '" ]')
	  ST.Setvalue(SELF.naG.FieldTemp)                        
	  ST.Split('|',,,,TRUE,TRUE)                     
	  SELF.naG.FieldName          = ST.GetLine(1)
	  SELF.naG.FieldWhom          = UPPER(ST.GetLine(1))
	  SELF.naG.FieldType          = ST.GetLine(2)
	  SELF.naG.FieldFormat        = ST.GetLine(3)
	  SELF.naG.FieldRange         = ST.GetLine(4)
	  SELF.naG.FieldPrompt        = ST.GetLine(5)
	  SELF.naG.FieldColumn        = ST.GetLine(6)
	  SELF.naG.FieldTypeSQL       = ''
	  SELF.naG.FieldFormatSQL     = ''
	  ST.Setvalue(SELF.naG.FieldPrompt)
	  SELF.naG.FieldPrompt        = ST.Between('(''',''')')
	  ST.Setvalue(SELF.naG.FieldColumn)
	  SELF.naG.FieldColumn        = ST.Between('(''',''')')
	  ST.Setvalue(SELF.naG.FieldRange)
	  SELF.naG.FieldFrom          = ST.Between('[','-')
	  SELF.naG.FieldTo            = ST.Between('-',']')
    SELF.naG.FieldTemp          = UPPER(SELF.naG.FieldTemp)
    SELF.naG.FieldSalt          = CHOOSE(INSTRING('|SALT'       ,SELF.naG.FieldTemp,1,1))
    SELF.naG.FieldHash          = CHOOSE(INSTRING('|HASH('      ,SELF.naG.FieldTemp,1,1))
    SELF.naG.FieldEncrypt       = CHOOSE(INSTRING('|ENCRYPTED(' ,SELF.naG.FieldTemp,1,1))
    SELF.naQ :=: SELF.naG
    ADD(SELF.naQ)	
  END
  !SELF.ShowDebug = TRUE         ! TESTING: Last Entry
  !SELF.ValueDebug()             ! TESTING: Last entry
  SELF.Debug('CLASS(' & THREAD() & '): rybNameAttributeClass.Init(...): EXITS ==========')
  RETURN TRUE

!-------------------------------------------------------------------
rybNameAttributeClass.ValueDebug        PROCEDURE()
!-------------------------------------------------------------------
  CODE
  IF NOT SELF.ShowDebug THEN RETURN END
  SELF.Debug('CLASS(' & THREAD() & '): SELF.naG.FieldNumber=[ '      & CLIP(SELF.naG.FieldNumber)      & ' ]')
  SELF.Debug('CLASS(' & THREAD() & '): SELF.naG.FieldSalt=[ '        & CLIP(SELF.naG.FieldSalt)        & ' ]')
  SELF.Debug('CLASS(' & THREAD() & '): SELF.naG.FieldHash=[ '        & CLIP(SELF.naG.FieldHash)        & ' ]')
  SELF.Debug('CLASS(' & THREAD() & '): SELF.naG.FieldEncrypt=[ '     & CLIP(SELF.naG.FieldEncrypt)     & ' ]')
  SELF.Debug('CLASS(' & THREAD() & '): SELF.naG.FieldFrom=[ '        & CLIP(SELF.naG.FieldFrom)        & ' ]')
  SELF.Debug('CLASS(' & THREAD() & '): SELF.naG.FieldTo=[ '          & CLIP(SELF.naG.FieldTo)          & ' ]')
  SELF.Debug('CLASS(' & THREAD() & '): SELF.naG.FieldName=[ "'       & CLIP(SELF.naG.FieldName)        & '" ]')
  SELF.Debug('CLASS(' & THREAD() & '): SELF.naG.FieldWhom=[ "'       & CLIP(SELF.naG.FieldWhom)        & '" ]')
  SELF.Debug('CLASS(' & THREAD() & '): SELF.naG.FieldType=[ "'       & CLIP(SELF.naG.FieldType)        & '" ]')
  SELF.Debug('CLASS(' & THREAD() & '): SELF.naG.FieldFormat=[ "'     & CLIP(SELF.naG.FieldFormat)      & '" ]')
  SELF.Debug('CLASS(' & THREAD() & '): SELF.naG.FieldRange=[ "'      & CLIP(SELF.naG.FieldRange)       & '" ]')
  SELF.Debug('CLASS(' & THREAD() & '): SELF.naG.FieldPrompt=[ "'     & CLIP(SELF.naG.FieldPrompt)      & '" ]')
  SELF.Debug('CLASS(' & THREAD() & '): SELF.naG.FieldColumn=[ "'     & CLIP(SELF.naG.FieldColumn)      & '" ]')
  SELF.Debug('CLASS(' & THREAD() & '): SELF.naG.FieldTypeSQL=[ "'    & CLIP(SELF.naG.FieldTypeSQL)     & '" ]')
  SELF.Debug('CLASS(' & THREAD() & '): SELF.naG.FieldFormatSQL=[ "'  & CLIP(SELF.naG.FieldFormatSQL)   & '" ]')
  SELF.Debug('CLASS(' & THREAD() & '): SELF.naG.FieldTemp=[ "'       & CLIP(SELF.naG.FieldTemp)        & '" ]')
  RETURN

!-------------------------------------------------------------------
rybNameAttributeClass.ValueSetItem      PROCEDURE(BYTE xAttribute,STRING xData)
!-------------------------------------------------------------------
  CODE
  CASE(xAttribute)
    OF (C_NAMEATTR_FIELDNUMBER)     ; SELF.naG.FieldNumber      = xData
    OF (C_NAMEATTR_FIELDSALT)       ; SELF.naG.FieldSalt        = xData
    OF (C_NAMEATTR_FIELDHASH)       ; SELF.naG.FieldHash        = xData
    OF (C_NAMEATTR_FIELDENCRYPT)    ; SELF.naG.FieldEncrypt     = xData
    OF (C_NAMEATTR_FIELDFROM)       ; SELF.naG.FieldFrom        = xData
    OF (C_NAMEATTR_FIELDTO)         ; SELF.naG.FieldTo          = xData
    OF (C_NAMEATTR_FIELDNAME)       ; SELF.naG.FieldName        = xData
    OF (C_NAMEATTR_FIELDWHOM)       ; SELF.naG.FieldWhom        = xData
    OF (C_NAMEATTR_FIELDTYPE)       ; SELF.naG.FieldType        = xData
    OF (C_NAMEATTR_FIELDFORMAT)     ; SELF.naG.FieldFormat      = xData
    OF (C_NAMEATTR_FIELDRANGE)      ; SELF.naG.FieldRange       = xData
    OF (C_NAMEATTR_FIELDPROMPT)     ; SELF.naG.FieldPrompt      = xData
    OF (C_NAMEATTR_FIELDCOLUMN)     ; SELF.naG.FieldColumn      = xData
    OF (C_NAMEATTR_FIELDTYPESQL)    ; SELF.naG.FieldTypeSQL     = xData
    OF (C_NAMEATTR_FIELDFORMATSQL)  ; SELF.naG.FieldFormatSQL   = xData
    OF (C_NAMEATTR_FIELDTEMP)       ; SELF.naG.FieldTemp        = xData
  END!CASE
  RETURN

!-------------------------------------------------------------------
rybNameAttributeClass.ValueGetItem      PROCEDURE(BYTE xAttribute)!,STRING
!-------------------------------------------------------------------
  CODE
  CASE(xAttribute)
    OF (C_NAMEATTR_FIELDNUMBER)     ; RETURN SELF.naG.FieldNumber
    OF (C_NAMEATTR_FIELDSALT)       ; RETURN SELF.naG.FieldSalt
    OF (C_NAMEATTR_FIELDHASH)       ; RETURN SELF.naG.FieldHash
    OF (C_NAMEATTR_FIELDENCRYPT)    ; RETURN SELF.naG.FieldEncrypt
    OF (C_NAMEATTR_FIELDFROM)       ; RETURN SELF.naG.FieldFrom
    OF (C_NAMEATTR_FIELDTO)         ; RETURN SELF.naG.FieldTo
    OF (C_NAMEATTR_FIELDNAME)       ; RETURN SELF.naG.FieldName
    OF (C_NAMEATTR_FIELDWHOM)       ; RETURN SELF.naG.FieldWhom
    OF (C_NAMEATTR_FIELDTYPE)       ; RETURN SELF.naG.FieldType
    OF (C_NAMEATTR_FIELDFORMAT)     ; RETURN SELF.naG.FieldFormat
    OF (C_NAMEATTR_FIELDRANGE)      ; RETURN SELF.naG.FieldRange
    OF (C_NAMEATTR_FIELDPROMPT)     ; RETURN SELF.naG.FieldPrompt
    OF (C_NAMEATTR_FIELDCOLUMN)     ; RETURN SELF.naG.FieldColumn
    OF (C_NAMEATTR_FIELDTYPESQL)    ; RETURN SELF.naG.FieldTypeSQL
    OF (C_NAMEATTR_FIELDFORMATSQL)  ; RETURN SELF.naG.FieldFormatSQL
    OF (C_NAMEATTR_FIELDTEMP)       ; RETURN SELF.naG.FieldTemp
  END!CASE
  RETURN ''

!-------------------------------------------------------------------
rybNameAttributeClass.ValueClear        PROCEDURE()
!-------------------------------------------------------------------
  CODE
  SELF.CntFields       = 0
  SELF.ItemNumber      = 0
  CLEAR(SELF.naG)
  RETURN

!-------------------------------------------------------------------
rybNameAttributeClass.DataSetItem       PROCEDURE(LONG xFieldNumber,BYTE xAttribute,STRING xData)
!-------------------------------------------------------------------
  CODE
  GET(SELF.naQ, xFieldNumber)
  CASE(xAttribute)
    OF (C_NAMEATTR_FIELDNUMBER)     ; SELF.naQ.FieldNumber      = xData
    OF (C_NAMEATTR_FIELDSALT)       ; SELF.naQ.FieldSalt        = xData
    OF (C_NAMEATTR_FIELDHASH)       ; SELF.naQ.FieldHash        = xData
    OF (C_NAMEATTR_FIELDENCRYPT)    ; SELF.naQ.FieldEncrypt     = xData
    OF (C_NAMEATTR_FIELDFROM)       ; SELF.naQ.FieldFrom        = xData
    OF (C_NAMEATTR_FIELDTO)         ; SELF.naQ.FieldTo          = xData
    OF (C_NAMEATTR_FIELDNAME)       ; SELF.naQ.FieldName        = xData
    OF (C_NAMEATTR_FIELDWHOM)       ; SELF.naQ.FieldWhom        = xData
    OF (C_NAMEATTR_FIELDTYPE)       ; SELF.naQ.FieldType        = xData
    OF (C_NAMEATTR_FIELDFORMAT)     ; SELF.naQ.FieldFormat      = xData
    OF (C_NAMEATTR_FIELDRANGE)      ; SELF.naQ.FieldRange       = xData
    OF (C_NAMEATTR_FIELDPROMPT)     ; SELF.naQ.FieldPrompt      = xData
    OF (C_NAMEATTR_FIELDCOLUMN)     ; SELF.naQ.FieldColumn      = xData
    OF (C_NAMEATTR_FIELDTYPESQL)    ; SELF.naQ.FieldTypeSQL     = xData
    OF (C_NAMEATTR_FIELDFORMATSQL)  ; SELF.naQ.FieldFormatSQL   = xData
    OF (C_NAMEATTR_FIELDTEMP)       ; SELF.naQ.FieldTemp        = xData
  END!CASE
  RETURN

!-------------------------------------------------------------------
rybNameAttributeClass.DataGetItem       PROCEDURE(LONG xFieldNumber,BYTE xAttribute)!,STRING
!-------------------------------------------------------------------
  CODE
  GET(SELF.naQ, xFieldNumber)
  CASE(xAttribute)
    OF (C_NAMEATTR_FIELDNUMBER)     ; RETURN SELF.naQ.FieldNumber
    OF (C_NAMEATTR_FIELDSALT)       ; RETURN SELF.naQ.FieldSalt
    OF (C_NAMEATTR_FIELDHASH)       ; RETURN SELF.naQ.FieldHash
    OF (C_NAMEATTR_FIELDENCRYPT)    ; RETURN SELF.naQ.FieldEncrypt
    OF (C_NAMEATTR_FIELDFROM)       ; RETURN SELF.naQ.FieldFrom
    OF (C_NAMEATTR_FIELDTO)         ; RETURN SELF.naQ.FieldTo
    OF (C_NAMEATTR_FIELDNAME)       ; RETURN SELF.naQ.FieldName
    OF (C_NAMEATTR_FIELDWHOM)       ; RETURN SELF.naQ.FieldWhom
    OF (C_NAMEATTR_FIELDTYPE)       ; RETURN SELF.naQ.FieldType
    OF (C_NAMEATTR_FIELDFORMAT)     ; RETURN SELF.naQ.FieldFormat
    OF (C_NAMEATTR_FIELDRANGE)      ; RETURN SELF.naQ.FieldRange
    OF (C_NAMEATTR_FIELDPROMPT)     ; RETURN SELF.naQ.FieldPrompt
    OF (C_NAMEATTR_FIELDCOLUMN)     ; RETURN SELF.naQ.FieldColumn
    OF (C_NAMEATTR_FIELDTYPESQL)    ; RETURN SELF.naQ.FieldTypeSQL
    OF (C_NAMEATTR_FIELDFORMATSQL)  ; RETURN SELF.naQ.FieldFormatSQL
    OF (C_NAMEATTR_FIELDTEMP)       ; RETURN SELF.naQ.FieldTemp
  END!CASE
  RETURN ''

!-------------------------------------------------------------------
rybNameAttributeClass.IsSalt            PROCEDURE(LONG xFieldNumber)!,BYTE
!-------------------------------------------------------------------
  CODE
  GET(SELF.naQ, xFieldNumber)
  IF (SELF.naQ.FieldSalt) THEN RETURN TRUE END
  RETURN FALSE

!-------------------------------------------------------------------
rybNameAttributeClass.IsHash            PROCEDURE(LONG xFieldNumber)!,BYTE
!-------------------------------------------------------------------
  CODE
  GET(SELF.naQ, xFieldNumber)
  IF (SELF.naQ.FieldHash) THEN RETURN TRUE END
  RETURN FALSE

!-------------------------------------------------------------------
rybNameAttributeClass.IsEncrypt         PROCEDURE(LONG xFieldNumber)!,BYTE
!-------------------------------------------------------------------
  CODE
  GET(SELF.naQ, xFieldNumber)
  IF (SELF.naQ.FieldEncrypt) THEN RETURN TRUE END
  RETURN FALSE

!-------------------------------------------------------------------
rybNameAttributeClass._CountFields      PROCEDURE(*GROUP xGroup)!,SHORT        
!-------------------------------------------------------------------
NumFields	SHORT(0)
X       	SHORT,AUTO
M       	SHORT(0)
  CODE
  LOOP X = 10000 TO 1 BY -1
    IF NumFields = 0 AND WHO(xGroup, X) <> ''
      NumFields = X
      IF M = 0
        M = NumFields
      END
    END
    IF M = 0 AND NumFields
      M = X
    END
    IF NumFields
      BREAK
    END
  END
  SELF.Debug('CLASS(' & THREAD() & '): rybNameAttributeClass._CountFields(...): NumFields=[ ' & NumFields & ' ]')
  RETURN NumFields

