* Program One: Design a structure, fill it with data, and display output
* It is recommended that you review the requirements of this program several times during your work and then also
* review your final submission candidate to insure that you have fulfilled everything to the best of your ability.
* A library tracks the following information for all books:
* • Book Title
* • Primary Author
* • Publisher
* • Publisher State (2 letter abbreviation)
* • Publication Date
* • Tracking ID (this is a 9 digit numeric code such as 987654321)
* • Purchase Cost
* • Date of Purchase
* Create a structure type capable of holding the information noted above. Take some time to consider the appropriate type choices for each field.
* Create two structures and fill each of them with data for a hypothetical book. Output each of the structures in the following manner:
*
*  Label format:
* Book Title: Author: Publisher: Published: Tracking ID: Purchase Cost: Date of Purchase:
* Table format:
* Title
* Author Publisher, ST MM/DD/YYYY xxxxxxxxx $x.xx MM/DD/YYYY
* Publisher
* Publisher Publisher
* Title
* Title Title
* Author
* Author Author
* State Published
* NY MM/DD/YY TN MM/DD/YY
* Tracking ID
* xxxxxxxx
* xxxxxxxx
* Cost Purchased
* $x.xx MM/DD/YY $x.xx MM/DD/YY
*  Note the following:
* • Write both of the books out in label format with a blank line between then. Then follow that output with a single table that contains information on both books. (One table header with two books in table body.)
* • Match the formatting shown here precisely. The horizontal spacing of the table is at your discretion, but make it look nice. Pay particular attention to the dates.
* • Do not store anything in your structure that does not need to be there. Certain elements of the above are added in the output statements as literal text.
*


REPORT ZA020_HOMEWORK2.


TYPES: BEGIN OF BOOK_TYPE,
         TITLE            TYPE C LENGTH 80,
         AUTHOR_NAME      TYPE C LENGTH 25,
         PUBLISHER        TYPE C LENGTH 25,
         PUBLISHER_STATE  TYPE C LENGTH 2,
         PUBLICATION_DATE TYPE D,
         TRACKING_ID      TYPE I,
         PURCH_COST       TYPE P DECIMALS 2,
         DATE_PURCHASE    TYPE D,
       END OF BOOK_TYPE.

DATA BOOK1 TYPE BOOK_TYPE.
BOOK1-TITLE = 'SAP HANA'.
BOOK1-AUTHOR_NAME = 'Bjarne Berg'.
BOOK1-PUBLISHER = 'Galileo Press'.
BOOK1-PUBLISHER_STATE = 'MA'.
BOOK1-PUBLICATION_DATE = '20191001'.
BOOK1-TRACKING_ID = 987654321.
BOOK1-PURCH_COST = '76.94'.
BOOK1-DATE_PURCHASE = '20201001'.


DATA BOOK2 TYPE BOOK_TYPE.
BOOK2-TITLE = 'Complete ABAP'.
BOOK2-AUTHOR_NAME = 'Kiran Bandari'.
BOOK2-PUBLISHER = 'Rheinwork Publishing'.
BOOK2-PUBLISHER_STATE = 'NY'.
BOOK2-PUBLICATION_DATE = '20181101'.
BOOK2-TRACKING_ID = 987651234.
BOOK2-PURCH_COST = '916.94'.
BOOK2-DATE_PURCHASE = '20200901'.

WRITE: / 'Book Title:' LEFT-JUSTIFIED,(*)BOOK1-TITLE RIGHT-JUSTIFIED.
WRITE: / 'Author:' LEFT-JUSTIFIED,(*)BOOK1-AUTHOR_NAME RIGHT-JUSTIFIED.
WRITE: / 'Publisher:' LEFT-JUSTIFIED,(*)BOOK1-PUBLISHER NO-GAP,',',BOOK1-PUBLISHER_STATE RIGHT-JUSTIFIED.
WRITE: / 'Published:' LEFT-JUSTIFIED,BOOK1-PUBLICATION_DATE RIGHT-JUSTIFIED MM/DD/YYYY.
WRITE: / 'Tracking ID:' LEFT-JUSTIFIED,BOOK1-TRACKING_ID NO-GROUPING RIGHT-JUSTIFIED.
WRITE: / 'Purchase Cost:' LEFT-JUSTIFIED,'$' NO-GAP,(*) BOOK1-PURCH_COST RIGHT-JUSTIFIED.
WRITE: / 'Date of Purchase:' LEFT-JUSTIFIED,BOOK1-DATE_PURCHASE MM/DD/YYYY RIGHT-JUSTIFIED.

SKIP 1.

WRITE: / 'Book Title:' LEFT-JUSTIFIED,(*)BOOK2-TITLE RIGHT-JUSTIFIED.
WRITE: / 'Author:' LEFT-JUSTIFIED,(*)BOOK2-AUTHOR_NAME RIGHT-JUSTIFIED.
WRITE: / 'Publisher:' LEFT-JUSTIFIED,(*)BOOK2-PUBLISHER NO-GAP,',',BOOK2-PUBLISHER_STATE RIGHT-JUSTIFIED.
WRITE: / 'Published:' LEFT-JUSTIFIED,BOOK2-PUBLICATION_DATE RIGHT-JUSTIFIED MM/DD/YYYY.
WRITE: / 'Tracking ID:' LEFT-JUSTIFIED,BOOK2-TRACKING_ID NO-GROUPING RIGHT-JUSTIFIED.
WRITE: / 'Purchase Cost:' LEFT-JUSTIFIED,'$' NO-GAP,(*) BOOK2-PURCH_COST RIGHT-JUSTIFIED.
WRITE: / 'Date of Purchase:' LEFT-JUSTIFIED,BOOK2-DATE_PURCHASE MM/DD/YYYY RIGHT-JUSTIFIED.

SKIP 1.

WRITE: / 'Title',25'Author',50'Publisher', 75'State',100'Published',125'Tracking ID',150'Cost',175'Purchased'.
ULINE.

SKIP 1.
WRITE: / BOOK1-TITLE UNDER 'Title',
         BOOK1-AUTHOR_NAME UNDER 'Author',
         BOOK1-PUBLISHER UNDER 'Publisher',
         BOOK1-PUBLISHER_STATE UNDER 'State',
         BOOK1-PUBLICATION_DATE MM/DD/YYYY UNDER 'Published',
         BOOK1-TRACKING_ID NO-GROUPING  UNDER 'Tracking ID',
         150'$' NO-GAP,(*)BOOK1-PURCH_COST,
         BOOK1-DATE_PURCHASE MM/DD/YYYY UNDER 'Purchased'.

WRITE: / BOOK2-TITLE UNDER 'Title',
         BOOK2-AUTHOR_NAME UNDER 'Author',
         BOOK2-PUBLISHER UNDER 'Publisher',
         BOOK2-PUBLISHER_STATE UNDER 'State',
         BOOK2-PUBLICATION_DATE MM/DD/YYYY UNDER 'Published',
         BOOK2-TRACKING_ID NO-GROUPING  UNDER 'Tracking ID',
         150'$' NO-GAP,(*)BOOK2-PURCH_COST,
         BOOK2-DATE_PURCHASE MM/DD/YYYY UNDER 'Purchased'.
