REPORT ZA020_HW2P3.

PARAMETERS: P_NUM1 TYPE I OBLIGATORY,
            P_OPER TYPE C OBLIGATORY LENGTH 10,
            P_NUM2 TYPE I OBLIGATORY.



DATA TOTAL TYPE P DECIMALS 2.


CASE P_OPER.
  WHEN '+'.
    TOTAL = P_NUM1 + P_NUM2.
    WRITE: 'Here is the calculation',(*)P_NUM1,(*)P_OPER,(*)P_NUM2, '=', (*)TOTAL.
  WHEN '-'.
    TOTAL = P_NUM1 - P_NUM2.
    WRITE: 'Here is the calculation',(*)P_NUM1,(*)P_OPER,(*)P_NUM2, '=', (*)TOTAL.
  WHEN '*'.
    TOTAL = P_NUM1 * P_NUM2.
    WRITE: 'Here is the calculation',(*)P_NUM1,(*)P_OPER,(*)P_NUM2, '=', (*)TOTAL.
  WHEN '/'.
   TOTAL = P_NUM1 / P_NUM2.
   WRITE: 'Here is the calculation',(*)P_NUM1,(*)P_OPER,(*)P_NUM2, '=', (*)TOTAL.
  WHEN OTHERS.
    WRITE: 'ERROR INVALID OPERATOR'.
  ENDCASE.
