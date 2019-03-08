SQL> Select Count(ID) From Trip Where EMP_ID  = ANY (Select ID From Employee Where DEPT = 'Marketing');

SQL> Select Name From Employee Where ID = ANY (Select EMP_ID From Trip WHERE ID NOT IN (Select Trip_ID From Expense));

SQL> Select Name, Dept From Employee Where ID IN(Select EMP_ID From Trip Where Est_Cost = (Select MAX(Est_Cost) From Trip));

SQL> Select Dept From Employee Where ID NOT IN (Select Emp_ID From Trip);

SQL> Select Distinct To_City From Trip Where Est_Cost < ANY (SELECT Avg(Amount)From Expense Where Type = 'T');