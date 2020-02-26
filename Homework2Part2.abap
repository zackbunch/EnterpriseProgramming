* Program Two: As demonstrated in class, a number of different system-maintained data values are maintained by the ABAP environment within the SYST structure. Use that structure to display the attributes of the system you are using this semester. (Use the Data Dictionary [SE11] to display data type SYST to determine the appropriate fields to use within the structure.)
* Place your output into 3 columns. The first column will contain the name of the data object in the system, the second column will contain the value of the data object, and the third column will contain a brief description of the data object. Make your output look neat by aligning all of your columns. Place a header line—as shown below—at the top of each column to describe the output.
* Note that while it is possible to construct this output in a variety of ways, the output statements that are used to build the rows that contain the field-name, field-value, and text description (i.e. the second through nth rows of the table) should not employ position or length specifications.
* For example: Your output should resemble the following exactly. (Horizontal space between columns is at your discretion.)
* Field Name SY-XXXX Field-name Field-name
* Value Mario Field-value Field-value
* Description
* Name of protagonist in Donkey Kong Text description of field
* Text description of field
*  You will notice that there are 171 different fields in SY. Many are obsolete and many are highly specialized for purposes we will see later this semester. However, there are fields that allow us to find out the login name of the current user, the client number, and the database system in use.
* Look through SY and find 6 data values that have some potentially useful information in them to be displayed. Make these selections the output of your table.
* Note the following:
* • The text displayed in column 1 and column 3 is literal text, supplied by you at coding time. There is no need for this text to be stored in data objects.
* • The body of your table should be output using the chained statement technique where each line of output corresponds to one WRITE statement.
*



REPORT ZA020_HW2P2.
"MANDT -- Datatype CLNT -> Client ID of current User
"OPSYS Char -> Name of operating system
"TCODE Char -> Current transaction code
"UNAME Char -> Current user name
"HOST Char -> Name of current application server
"LANGU LANG -> Language key of text environment

WRITE: / 'Field Name', 20'Value', 40'Description'.
ULINE.
WRITE: / 'SY-OPSYS'UNDER 'Field Name', SY-OPSYS UNDER 'Value','Name of operating system' UNDER 'Description'.
WRITE: / 'SY-HOST' UNDER 'Field Name', SY-HOST UNDER 'Value' ,'Name of current application server' UNDER 'Description'.
WRITE: / 'SY-LANGU'UNDER 'Field Name', SY-LANGU UNDER 'Value','Language key of text environment' UNDER 'Description'.
WRITE: / 'SY-UNAME'UNDER 'Field Name', SY-UNAME UNDER 'Value','Current user name' UNDER 'Description'.
WRITE: / 'SY-TCODE'UNDER 'Field Name', SY-TCODE UNDER 'Value','Current transaction code' UNDER 'Description'.
WRITE: / 'SY-MANDT'UNDER 'Field Name', SY-MANDT UNDER 'Value','Client ID of current User' UNDER 'Description'.
