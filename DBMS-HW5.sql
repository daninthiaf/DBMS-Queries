SQL> spool asgn5.lst
SQL> set serveroutput on
SQL> get fox.sql
  1  SET serveroutput ON;
  2  DECLARE
  3          EmpID INTEGER;
  4          ToCity CHAR (15);
  5          DepDate DATE;
  6          ReturnDate DATE;
  7          EstCost DECIMAL(6,2);
  8          maxIDFOUND INTEGER;
  9          empIDFOUND INTEGER;
 10  BEGIN
 11         EmpID  := &EmpID;
 12         ToCity := '&ToCity';
 13         DepDate := To_Date('&DepDate', 'DD-MON-YYYY');
 14         ReturnDate := To_Date('&ReturnDate','DD-MON-YYYY');
 15         EstCost := &EstCost;
 16     DBMS_OUTPUT.PUT_LINE('----        Employee ID  : '     || EmpID);
 17     DBMS_OUTPUT.PUT_LINE('----        To City      : '     || ToCity);
 18     DBMS_OUTPUT.PUT_LINE('----        Dep Date     : '     || DepDate);
 19     DBMS_OUTPUT.PUT_LINE('----        Return Date  : '     || ReturnDate);
 20     DBMS_OUTPUT.PUT_LINE('----        Est Cost     : '     || EstCost);
 21   --Check to see if EmpID value is valid.
 22     SELECT Count(*) INTO empIDFOUND From Trip WHERE Emp_ID = EmpID;
 23     IF(empIDFOUND = 0) THEN
 24     DBMS_OUTPUT.PUT_LINE('Invalid ID. Quitting.');
 25  --   RETURN;
 26     ELSE
 27     DBMS_OUTPUT.PUT_LINE('Valid ID.');
 28       -- Check to see if return date is before departure date
 29     IF (ReturnDate < DepDate) THEN
 30          DBMS_OUTPUT.PUT_LINE('Invalid date selection.');
 31    --       RETURN;
 32     ELSE
 33         DBMS_OUTPUT.PUT_LINE('Valid date selection.');
 34     END IF;
 35     IF (EstCost < 1.00 OR EstCost > 4000.00) THEN
 36          DBMS_OUTPUT.PUT_LINE('Invalid. EstCost is out of range.');
 37    --        RETURN;
 38     ELSE
 39          DBMS_OUTPUT.PUT_LINE('Valid. EstCost is in range.');
 40     END IF;
 41     -- Find MAX ID, then add 1.
 42     --   SELECT MAX(ID) INTO maxIDFOUND FROM Trip;
 43       -- maxIDFOUND:= maxIDFOUND + 1;
 44        --INSERT INTO Trip (ID, Emp_ID, To_City, Dep_Date, Return_Date, Est_Cost)
 45        --VALUES (maxIDFOUND, EmpID, ToCity, DepDate, ReturnDate, EstCost);
 46        --DBMS_OUTPUT.PUT_LINE('Record was added successfully.');
 47     END IF;
 48     END;
 49*  /
 50

SQL> @fox.sql
Enter value for empid: 1123453
old  10:        EmpID  := &EmpID;
new  10:        EmpID  := 1123453;
Enter value for tocity: Queens
old  11:        ToCity := '&ToCity';
new  11:        ToCity := 'Queens';
Enter value for depdate: 03-MAY-2018
old  12:        DepDate := To_Date('&DepDate', 'DD-MON-YYYY');
new  12:        DepDate := To_Date('03-MAY-2018', 'DD-MON-YYYY');
Enter value for returndate: 05-OCT-2018
old  13:        ReturnDate := To_Date('&ReturnDate','DD-MON-YYYY');
new  13:        ReturnDate := To_Date('05-OCT-2018','DD-MON-YYYY');
Enter value for estcost: 343.44
old  14:        EstCost := &EstCost;
new  14:        EstCost := 343.44;
----        Employee ID  : 1123453
----        To City      : Queens
----        Dep Date     : 03-MAY-18
----        Return Date  : 05-OCT-18
----        Est Cost     : 343.44
Valid ID.
Valid date selection.
Valid. EstCost is in range.

PL/SQL procedure successfully completed.

SQL> @fox.sql
Enter value for empid: 6556765
old  10:        EmpID  := &EmpID;
new  10:        EmpID  := 6556765;
Enter value for tocity: Queens
old  11:        ToCity := '&ToCity';
new  11:        ToCity := 'Queens';
Enter value for depdate: 03-MAY-2018
old  12:        DepDate := To_Date('&DepDate', 'DD-MON-YYYY');
new  12:        DepDate := To_Date('03-MAY-2018', 'DD-MON-YYYY');
Enter value for returndate: 05-OCT-2018
old  13:        ReturnDate := To_Date('&ReturnDate','DD-MON-YYYY');
new  13:        ReturnDate := To_Date('05-OCT-2018','DD-MON-YYYY');
Enter value for estcost: 343.44
old  14:        EstCost := &EstCost;
new  14:        EstCost := 343.44;
----        Employee ID  : 6556765
----        To City      : Queens
----        Dep Date     : 03-MAY-18
----        Return Date  : 05-OCT-18
----        Est Cost     : 343.44
Invalid ID. Quitting.

PL/SQL procedure successfully completed.

SQL> @fox.sql
Enter value for empid: 1123453
old  10:        EmpID  := &EmpID;
new  10:        EmpID  := 1123453;
Enter value for tocity: Queens
old  11:        ToCity := '&ToCity';
new  11:        ToCity := 'Queens';
Enter value for depdate: 05-OCT-2018
old  12:        DepDate := To_Date('&DepDate', 'DD-MON-YYYY');
new  12:        DepDate := To_Date('05-OCT-2018', 'DD-MON-YYYY');
Enter value for returndate: 03-MAY-2018
old  13:        ReturnDate := To_Date('&ReturnDate','DD-MON-YYYY');
new  13:        ReturnDate := To_Date('03-MAY-2018','DD-MON-YYYY');
Enter value for estcost: 343.44
old  14:        EstCost := &EstCost;
new  14:        EstCost := 343.44;
----        Employee ID  : 1123453
----        To City      : Queens
----        Dep Date     : 05-OCT-18
----        Return Date  : 03-MAY-18
----        Est Cost     : 343.44
Valid ID.
Invalid date selection.
Valid. EstCost is in range.

PL/SQL procedure successfully completed.

SQL> @fox.sql
Enter value for empid: 1123453
old  10:        EmpID  := &EmpID;
new  10:        EmpID  := 1123453;
Enter value for tocity: Queens
old  11:        ToCity := '&ToCity';
new  11:        ToCity := 'Queens';
Enter value for depdate: 03-MAY-2018
old  12:        DepDate := To_Date('&DepDate', 'DD-MON-YYYY');
new  12:        DepDate := To_Date('03-MAY-2018', 'DD-MON-YYYY');
Enter value for returndate: 05-OCT-2018
old  13:        ReturnDate := To_Date('&ReturnDate','DD-MON-YYYY');
new  13:        ReturnDate := To_Date('05-OCT-2018','DD-MON-YYYY');
Enter value for estcost: 8763.99
old  14:        EstCost := &EstCost;
new  14:        EstCost := 8763.99;
----        Employee ID  : 1123453
----        To City      : Queens
----        Dep Date     : 03-MAY-18
----        Return Date  : 05-OCT-18
----        Est Cost     : 8763.99