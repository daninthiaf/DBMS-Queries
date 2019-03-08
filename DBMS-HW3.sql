SQL> Select Type, Sum(Amount) From Expense Group By Type Order By SUM(Amount) ASC;

SQL> Select Employee.Dept, Count(*) From Employee JOIN Trip ON (Trip.Emp_ID = Employee.ID) GROUP BY Dept;
 
SQL> Select DISTINCT Count(Dep_Date) From Trip WHERE Dep_Date = ANY (Select Return_Date FROM Trip);                  
SQL> Select Employee.Name, Trip.Dep_Date, Trip.To_City, Expense.Submitted FROM Employee JOIN Trip ON Employee.ID = Trip.Emp_ID JOIN Expense ON Trip.ID = Expense.Trip_ID;

SQL> Select Trip_ID, Trip.Est_Cost, SUM(Expense.Amount) FROM Trip JOIN Expense ON Trip.ID = Expense.Trip_ID WHERE Trip.Est_Cost < Expense.Amount Group By Trip_ID, Est_Cost;