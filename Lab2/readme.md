# Lab 2

Use ZA001\_SERVER\_FILE as example to read file. DO NOT COPY THE WRITE FILE PART, it will cause issues if multiple people run at the same time.

File: /usr/sap/tmp/za001\_equi

Columns

- Description
- Auth Group
- Maintenance Plant
- Sort field

Read the file

- Loop through data
  - Verify that each column exists, i.e. not blank
  - Ensure Plant is upper case
  - Ensure Auth Group has leading zeros
  - Description and sort field have max lengths, do not exceed
  - Check to see if plant and auth group actually exists in DB
  - Call function module BAPI\_EQUI\_CREATE to create the equipment. There is at least one field mandatory for this BAPI to work that I have not given you.
  - Write the returned equipment number to output
