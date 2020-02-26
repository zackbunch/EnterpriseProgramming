* Program 3: Create a program which will output “mailing labels” for travel agencies in the U.S. The format of the labels should be as shown below.
* The database table STRAVELAG contains information on Travel Agencies. Take a moment to examine this table before beginning work.
* Requirements:
* • The output should be in the format:
* Agency Name Street Name City, State Zip
* As an example, a portion of your display should be as follows:
*  • Copy STRAVELAG to an internal table. Only move those fields which are relevant to your processing. Move all the rows/records. (We are doing this since, at the moment, we have not discussed how to properly use where clauses in ABAP.)
* • Add to your internal table a travel agency with name: ___’s Agency (where ___ is replaced by your full name). The address is at your discretion.
* • Sunshine Travel has changed its name. It is now AAA Travel. Change that in your internal table.
* • Trans World Travel has closed. Remove them from your internal table.
* • Use the internal table—with the above changes in place—as the source data for outputting your mailing list.
* • Place a horizontal line between the agencies.
* • Display the list with the agencies sorted by name.


*&---------------------------------------------------------------------*
*& Report ZA020_HW3P2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZA020_HW3P2.

PARAMETERS AIRLINE TYPE SCARR-CARRID OBLIGATORY.




DATA ITABLE TYPE STANDARD TABLE OF SCARR WITH NON-UNIQUE KEY  CARRID.
DATA WA LIKE LINE OF ITABLE.


SELECT * FROM SCARR INTO CORRESPONDING FIELDS OF TABLE ITABLE.

READ TABLE ITABLE WITH TABLE KEY CARRID = AIRLINE INTO WA.

* need to handle errors for airline not existing

IF  WA IS INITIAL.
  WRITE: / 'Invalid Airline.'.


ELSE.
  WRITE: /'Carrier:', 15 WA-CARRNAME.
  WRITE: /'Currency:',15 WA-CURRCODE.
  WRITE: / 'URL:', 15 WA-URL.

  ENDIF.
