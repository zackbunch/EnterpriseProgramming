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
