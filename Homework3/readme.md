**CSCI 4767 Enterprise Programming Homework Three: Internal Tables
Spring 2018**

**Program 1:** Create a screen report based on information copied from a database table to an internal table.

```
For this program you be extracting data from the SAIRPORT table and inserting it into an internal table. You will be
editing this internal table and then creating an output report.
```
```
Note the following requirements:
```
1. Your program should not in any way modify the database table SAIRPORT. All modifications are to made to
    the internal table in your program.
2. All airports represented in the SAIRPORT table should appear in your output except as further noted below.
3. Your program should output a table showing each airport name and its 3 letter airport code. The table should
    have a header line at the top identifying the table contents and a line underneath the header line.
4. The output should be rendered sorted by the 3 letter airport code.
5. A new airport has been built. The name of the airport is “ETSU Airport” with the 3 letter airport code “ETS”.
    Add this airport to **your internal table** before creating the output.
6. Hamburg airport has closed. Remove it from **your internal table** before creating the output.
7. Nashville airport has changed its 3 letter airport code from BNA to NAS. Change this in **your internal table**
    before creating the output.

**Program 2:** Create a short report based on data copied from a database table to an internal table.

For this program you will be provided a general specification. It is up to you to determine implementation details.

You want to allow users to input the 2 letter abbreviation for an airline (example: LH) and then be told in an output
report the name of the airline (Lufthansa), the currency the airline uses (EUR), and the URL of the airline
(http://www.lufthansa.com). **Note that your implementation should bring all the needed airline information** **_for all
airlines_** **into an internal table and then the output information should be drawn from that internal table**. If you
develop your solution correctly, you should find that the user’s input makes the job of picking the desired airline easy.
The source table to use for this is SCARR.

**Program 3:** Create a program which will output “mailing labels” for travel agencies **_in the U.S_**_._ The format of the labels
should be as shown below.

The database table STRAVELAG contains information on Travel Agencies. Take a moment to examine this table before
beginning work.

Requirements:

- The output should be in the format:

```
Agency Name
Street Name
City, State Zip
```
As an example, a portion of your display should be as follows:


- Copy STRAVELAG to an internal table. Only move those _fields_ which are relevant to your processing. Move all
    the _rows/records_. (We are doing this since, at the moment, we have not discussed how to properly use where
    clauses in ABAP.)
- Add to your _internal table_ a travel agency with name: ___’s Agency (where ___ is replaced by your full name).
    The address is at your discretion.
- Sunshine Travel has changed its name. It is now AAA Travel. Change that in your _internal table._
- Trans World Travel has closed. Remove them from your _internal table_.
- Use the internal table—with the above changes in place—as the source data for outputting your mailing list.
- Place a horizontal line between the agencies.
- _Display the list with the agencies sorted by name_.

Helpful hint: For a sorted table, you must specify keys. Key fields cannot be changed. If you cannot change a key field,
how could you replicate that operation (taking an existing record and transforming it so that the key field is changed)
without using the CHANGE statement?
