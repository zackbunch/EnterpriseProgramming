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
