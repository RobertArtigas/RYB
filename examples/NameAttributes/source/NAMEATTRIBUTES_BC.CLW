  MEMBER('NameAttributes.clw')

  PRAGMA('define(init_priority=>3)')

  MAP
    MODULE('NameAttributes_BC0.CLW')
NameAttributes_BC0:DctInit             PROCEDURE()
NameAttributes_BC0:DctKill             PROCEDURE()
NameAttributes_BC0:FilesInit           PROCEDURE()
    END
  END

DctInit PROCEDURE()
  CODE
  NameAttributes_BC0:DctInit
  NameAttributes_BC0:FilesInit


DctKill PROCEDURE()
  CODE
  NameAttributes_BC0:DctKill

