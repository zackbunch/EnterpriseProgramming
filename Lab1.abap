*&---------------------------------------------------------------------*
*& Report ZA020_LAB1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
*
* ¬Lab 1
* Tables
* BKPF
* BSEG
* Fields
* BKPF
* •	Company Code
* •	Fiscal Year
* •	Fiscal Period
* •	Accounting Document Number
* •	Currency Key
* BSEG
* •	Number of Line Item within Accounting Document
* •	Account Type
* •	Amount in Document Currency
* •	General Ledger Account
* Selection Screen
* Select Options for company code, accounting document number, period, and fiscal year. Make company code and year mandatory.
* Program
* Retrieve the information from the database using the selection criteria from above. Only output the fields from above
* (use your own custom type(s)); you may need other fields from BSEG in order to match the information to BKPF. Display the data using an ALV instead of write
* statements, CL_SALV_TABLE. Calculate the totals using aggregations. Add a sort on company code, year, and document number to the ALV; with grouping/subtotals enabled.
* All standard functions should be enabled. Optimize the width. An example output follows.
* *
* *




REPORT ZA020_LAB1.


TYPES: BEGIN OF BKPF_BSEG_TYPE,
         BKPF_COMPANY_CODE       TYPE BKPF-BUKRS,
         BKPF_FISCAL_YR          TYPE BKPF-GJAHR,
         BKPF_FISCAL_PRD         TYPE BKPF-MONAT,
         BKPF_ACCOUNTING_DOC_NUM TYPE BKPF-BELNR,
         BKPF_CURRKEY            TYPE BKPF-WAERS,

*         BSEG_COMPANY_CODE       TYPE BSEG-BUKRS,
*         BSEG_FISCAL_YR          TYPE BSEG-GJAHR,
*         BSEG_ACCOUNTING_DOC_NUM TYPE BSEG-BELNR,
         BSEG_LINE_ITEM          TYPE BSEG-BUZEI,
         BSEG_ACCOUNT_TYPE       TYPE BSEG-KOART,
         BSEG_AMOUNT_DOC_CURR    TYPE BSEG-WRBTR,
         BSEG_GEN_LEDGE_ACCOUNT   TYPE BSEG-HKONT,
       END OF BKPF_BSEG_TYPE.

DATA: ITABLE TYPE STANDARD TABLE OF BKPF_BSEG_TYPE,
      WA     LIKE LINE OF ITABLE.


SELECTION-SCREEN BEGIN OF BLOCK SEL_MAIN WITH FRAME TITLE TEXT-TTL.
SELECT-OPTIONS:
SO_CODE FOR WA-BKPF_COMPANY_CODE OBLIGATORY,
SO_DOC FOR WA-BKPF_ACCOUNTING_DOC_NUM,
SO_PRD FOR WA-BKPF_FISCAL_PRD,
SO_YEAR FOR WA-BKPF_FISCAL_YR OBLIGATORY.


SELECTION-SCREEN END OF BLOCK SEL_MAIN.

START-OF-SELECTION.
  PERFORM SELECT_DATA.
  PERFORM CREATE_ALV.
FORM SELECT_DATA.
  SELECT A~BUKRS, A~GJAHR, A~MONAT,A~BELNR,A~WAERS, B~BUZEI,B~KOART,B~WRBTR,B~HKONT
  FROM BKPF AS A
  INNER JOIN BSEG AS B
  ON A~BUKRS = B~BUKRS AND A~GJAHR = B~GJAHR AND A~BELNR = B~BELNR
  INTO TABLE @ITABLE
  WHERE A~BUKRS IN @SO_CODE AND
    A~BELNR IN @SO_DOC AND
    A~MONAT IN @SO_PRD AND
    A~GJAHR IN @SO_YEAR.
ENDFORM.

FORM CREATE_ALV.
  TRY.
      CL_SALV_TABLE=>FACTORY(
        IMPORTING
          R_SALV_TABLE   = DATA(LR_ALV)
        CHANGING
          T_TABLE        = ITABLE ).



      LR_ALV->GET_FUNCTIONS( )->SET_ALL( ).
      DATA(LR_SORTS) = LR_ALV->GET_SORTS( ).

      LR_ALV->GET_COLUMNS( )->SET_COLUMN_POSITION(
        EXPORTING
          COLUMNNAME = 'BKPF_COMPANY_CODE' POSITION   = 1 ).

      LR_ALV->GET_COLUMNS( )->SET_COLUMN_POSITION(
       EXPORTING
         COLUMNNAME = 'BKPF_FISCAL_YR' POSITION   = 2 ).

      LR_ALV->GET_COLUMNS( )->SET_COLUMN_POSITION(
        EXPORTING
          COLUMNNAME = 'BKPF_FISCAL_PRD' POSITION   = 3 ).

      LR_ALV->GET_COLUMNS( )->SET_COLUMN_POSITION(
        EXPORTING
          COLUMNNAME = 'BKPF_ACCOUNTING_DOC_NUM' POSITION   = 4 ).

      LR_ALV->GET_COLUMNS( )->SET_COLUMN_POSITION(
        EXPORTING
          COLUMNNAME = 'BSEG_LINE_ITEM' POSITION   = 5 ).

      LR_ALV->GET_COLUMNS( )->SET_COLUMN_POSITION(
        EXPORTING
          COLUMNNAME = 'BKPF_CURRKEY' POSITION   = 6 ).

      LR_ALV->GET_COLUMNS( )->SET_COLUMN_POSITION(
         EXPORTING
           COLUMNNAME = 'BSEG_ACCOUNT_TYPE' POSITION   = 7 ).



      LR_ALV->GET_COLUMNS( )->SET_COLUMN_POSITION(
        EXPORTING
          COLUMNNAME = 'BSEG_AMOUNT_DOC_CURR' POSITION   = 8 ).

      LR_ALV->GET_COLUMNS( )->SET_COLUMN_POSITION(
              EXPORTING
                COLUMNNAME = 'BSEG_GEN_LEDGE_ACCOUNT' POSITION   = 9 ).

      LR_ALV->GET_AGGREGATIONS( )->ADD_AGGREGATION(
      EXPORTING COLUMNNAME = 'BSEG_AMOUNT_DOC_CURR' AGGREGATION = IF_SALV_C_AGGREGATION=>TOTAL ).
      LR_ALV->GET_COLUMNS( )->SET_OPTIMIZE( ).
      LR_SORTS->ADD_SORT( EXPORTING COLUMNNAME = 'BKPF_COMPANY_CODE' SUBTOTAL = 'X').
      LR_SORTS->ADD_SORT( EXPORTING COLUMNNAME = 'BKPF_FISCAL_YR'  SUBTOTAL = 'X').
      LR_SORTS->ADD_SORT( EXPORTING COLUMNNAME = 'BKPF_ACCOUNTING_DOC_NUM' SUBTOTAL = 'X').


      LR_ALV->DISPLAY( ).
    CATCH CX_ROOT.
  ENDTRY.
ENDFORM.
