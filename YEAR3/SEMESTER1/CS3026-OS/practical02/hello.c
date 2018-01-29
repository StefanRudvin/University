#include <stdio.h>

typedef struct {
  int id_number;
  int age;
  float salary;
} DataEntry;

void initialize ( DataEntry * ) ;

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

void initialize ( DataEntry * person )
{
   printf ( "Specify details:\n" ) ;
   printf ( "ID     : " ); scanf ( "%d", &(person->id_number) ) ;
   printf ( "Age    : " ); scanf ( "%d", &(person->age) ) ;
   printf ( "Salary : " ); scanf ( "%f", &(person->salary) ) ;
}
