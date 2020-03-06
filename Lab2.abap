*&---------------------------------------------------------------------*
*& Report ZA020_LAB2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZA020_LAB2.

*File: /usr/sap/tmp/za001_equi
*Columns
*•  Description
*•  Auth Group
*•  Maintenance Plant
*•  Sort field
*
*Read the file
*•  Loop through data
*o  Verify that each column exists, i.e. not blank
*o  Ensure Plant is upper case
*o  Ensure Auth Group has leading zeros
*o  Description and sort field have max lengths, do not exceed
*o  Check to see if plant and auth group actually exists in DB
*o  Call function module BAPI_EQUI_CREATE to create the equipment. There is at least one field mandatory for this BAPI to work that I have not given you.
*	Write the returned equipment number to output


START-OF-SELECTION.
"CONSTANTS: LC_FILE TYPE STRING VALUE '/usr/sap/tmp/za020_equi'.
CONSTANTS: LC_FILE TYPE STRING VALUE '/usr/sap/tmp/za001_equi_correct'.

*
  TYPES: BEGIN OF EQUIPMENT_TYPE,
           DESCRIPTION TYPE STRING,
           AUTH_GROUP  TYPE C LENGTH 4,
           MAINT_PLANT TYPE STRING,
           SORT_FIELD  TYPE STRING,



         END OF EQUIPMENT_TYPE.

  DATA: ITABLE       TYPE STANDARD TABLE OF EQUIPMENT_TYPE,
        WA           LIKE LINE OF ITABLE,
        LV_LINE      TYPE STRING,
        GV_INDEX     TYPE I,
        LS_GENERAL   TYPE BAPI_ITOB,
        LS_SPECIFIC  TYPE BAPI_ITOB_EQ_ONLY,
        EQUIPMENT_NO TYPE EQUNR.


  OPEN DATASET LC_FILE FOR INPUT IN TEXT MODE ENCODING UTF-8.
  DO.
* Write the data into internal table
    GV_INDEX = SY-INDEX + 1.
    READ DATASET LC_FILE INTO LV_LINE.
    IF SY-SUBRC = 0.
      IF SY-INDEX <> 1.
        SPLIT LV_LINE AT '|' INTO WA-DESCRIPTION WA-AUTH_GROUP WA-MAINT_PLANT WA-SORT_FIELD.
        INSERT WA INTO TABLE ITABLE.
*        PERFORM COLUMN_EXISTS.
        PERFORM PLANT_TO_UPPER.
*        PERFORM MAX_LENGTHS.
*        PERFORM LEADING_ZEROS.
*        PERFORM CHECK_EXIST_DB.
        PERFORM CREATE_EQUIPMENT.
        NEW-LINE.


      ENDIF.
    ELSE.
      EXIT.
    ENDIF.

  ENDDO.
FORM COLUMN_EXISTS.
  IF WA-DESCRIPTION IS NOT INITIAL.
    WRITE:/ 'Description is present'.
  ELSE.
    WRITE / 'Description is not present'.
  ENDIF.
  IF WA-AUTH_GROUP IS NOT INITIAL.
    WRITE:/ 'Auth_GROUP is present'.
  ELSE.
    WRITE / 'Auth_GROUP is not present'.
  ENDIF.
  IF WA-MAINT_PLANT IS NOT INITIAL.
    WRITE:/ 'MAINT_PLANT is present'.
  ELSE.
    WRITE / 'MAINT_PLANT is not present'.
  ENDIF.
  IF WA-SORT_FIELD IS NOT INITIAL.
    WRITE:/ 'SORT_FIELD is present'.
  ELSE.
    WRITE / 'SORT_FIELD is not present'.
  ENDIF.
ENDFORM.

FORM PLANT_TO_UPPER.
  TRANSLATE WA-MAINT_PLANT TO UPPER CASE.

ENDFORM.

FORM LEADING_ZEROS.

  WA-AUTH_GROUP = |{ WA-AUTH_GROUP ALPHA = IN }|.
  WRITE:/ WA-AUTH_GROUP.
ENDFORM.

FORM MAX_LENGTHS.
  IF STRLEN( WA-DESCRIPTION ) > 40.
    WRITE |Your equipment description on row #{ GV_INDEX } is too long|.

  ENDIF.
  IF STRLEN( WA-SORT_FIELD ) > 30.
    WRITE |Your equipment sort field on row #{ GV_INDEX } is too long|.
  ENDIF.


ENDFORM.

FORM CHECK_EXIST_DB.

*T370B

  SELECT SINGLE BEGRU
    FROM T370B
    INTO @DATA(LOCAL_BEGRU)
    WHERE BEGRU = @WA-AUTH_GROUP.
  IF SY-SUBRC <> 0.
    WRITE | 'The authorization group { WA-AUTH_GROUP } is invalid.'|.
  ENDIF.

  SELECT SINGLE WERKS
   FROM T001W
   INTO @DATA(LOCAL_WERKS)
   WHERE WERKS = @WA-MAINT_PLANT.
  IF SY-SUBRC <> 0.
    WRITE | 'The maintenance plant { WA-MAINT_PLANT } is invalid.'|.
  ENDIF.



ENDFORM.

FORM CREATE_EQUIPMENT.
  LS_GENERAL-DESCRIPT = WA-DESCRIPTION.
  LS_GENERAL-AUTHGRP = WA-AUTH_GROUP.
  LS_GENERAL-MAINTPLANT = WA-MAINT_PLANT.
  LS_GENERAL-SORTFIELD = WA-SORT_FIELD.
  LS_SPECIFIC-EQUICATGRY = 'M'.



  CALL FUNCTION 'BAPI_EQUI_CREATE'
    EXPORTING
      DATA_GENERAL  = LS_GENERAL
      DATA_SPECIFIC = LS_SPECIFIC
    IMPORTING
      EQUIPMENT     = EQUIPMENT_NO.


  WRITE: / |New Equipment created with equipment number: { EQUIPMENT_NO }.|.
  COMMIT WORK.




ENDFORM.
