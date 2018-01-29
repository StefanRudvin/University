#include <stdio.h>
#include "employee.h"

void initialize ( DataEntry * person )
{
   printf ( "Specify details:\n" ) ;
   printf ( "ID     : " ); scanf ( "%d", &(person->id_number) ) ;
   printf ( "Age    : " ); scanf ( "%d", &(person->age) ) ;
   printf ( "Salary : " ); scanf ( "%f", &(person->salary) ) ;
}
