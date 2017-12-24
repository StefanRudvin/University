#include <stdio.h>
#include  "employee.h"

int main()
{

   DataEntry employeeList[100] ;

   /* call initializer */
   initialize ( employeeList ) ;

   printf ( "Employee :\n\tID = %d\n\tAge = %d\n\tSalary = %f\n",
      employeeList[0].id_number,
	  employeeList[0].age,
	  employeeList[0].salary
   ) ;
}
