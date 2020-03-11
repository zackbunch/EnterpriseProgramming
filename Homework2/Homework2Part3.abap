* Program 2: Create a short report based on data copied from a database table to an internal table.
* For this program you will be provided a general specification. It is up to you to determine implementation details.
* You want to allow users to input the 2 letter abbreviation for an airline (example: LH) and then be told in an output report the name of the airline (Lufthansa), the currency the airline uses (EUR), and the URL of the airline (http://www.lufthansa.com). Note that your implementation should bring all the needed airline information for all airlines into an internal table and then the output information should be drawn from that internal table. If you develop your solution correctly, you should find that the user’s input makes the job of picking the desired airline easy. The source table to use for this is SCARR.

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
