*&---------------------------------------------------------------------*
*& Report ZA020_HW4_COPY_DB
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZA020_HW4_COPY_DB.

DATA ITABLE TYPE STANDARD TABLE OF SPFLI.

SELECT * FROM SPFLI INTO TABLE ITABLE.
INSERT ZC020SPFLI FROM TABLE ITABLE.

WRITE: SY-DBCNT, 'copied over'.
