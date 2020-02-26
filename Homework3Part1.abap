* Program 1: Create a screen report based on information copied from a database table to an internal table.
* For this program you be extracting data from the SAIRPORT table and inserting it into an internal table. You will be
* editing this internal table and then creating an output report. Note the following requirements:
* 1. Your program should not in any way modify the database table SAIRPORT. All modifications are to made to the internal table in your program.
* 2. All airports represented in the SAIRPORT table should appear in your output except as further noted below.
* 3. Your program should output a table showing each airport name and its 3 letter airport code. The table should
* have a header line at the top identifying the table contents and a line underneath the header line.
* 4. The output should be rendered sorted by the 3 letter airport code.
* 5. A new airport has been built. The name of the airport is “ETSU Airport” with the 3 letter airport code “ETS”.
* Add this airport to your internal table before creating the output.
* 6. Hamburg airport has closed. Remove it from your internal table before creating the output.
* 7. Nashville airport has changed its 3 letter airport code from BNA to NAS. Change this in your internal table
* before creating the output.



*&---------------------------------------------------------------------*
*& Report ZA020_HW3P1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZA020_HW3P1.

TYPES: BEGIN OF AIRPSTRUCT,
         ID   TYPE SAIRPORT-ID,
         NAME TYPE SAIRPORT-NAME,
       END OF AIRPSTRUCT.


TYPES: AIRPTABLETYPE TYPE SORTED TABLE OF AIRPSTRUCT WITH UNIQUE KEY ID.

DATA: ITABLE TYPE AIRPTABLETYPE,
      WA     LIKE LINE OF ITABLE.


SELECT ID NAME FROM SAIRPORT INTO CORRESPONDING FIELDS OF TABLE ITABLE.

WA-ID = 'ETS'.
WA-NAME = 'ETSU Airport'.
INSERT WA INTO TABLE ITABLE.

DELETE TABLE ITABLE WITH TABLE KEY ID = 'HAM'.

READ TABLE ITABLE WITH TABLE KEY ID = 'BNA' INTO WA.
WA-ID = 'NAS'.
INSERT WA INTO TABLE ITABLE.
DELETE TABLE ITABLE WITH TABLE KEY ID = 'BNA'.


WRITE: 'ID', 10'Name'.
ULINE.
LOOP AT ITABLE INTO WA.
  WRITE: / WA-ID UNDER 'ID', WA-NAME UNDER 'name'.

ENDLOOP.
