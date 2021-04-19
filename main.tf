# Comment line, whole line OR from somewhere on the line till end of line
// alternative to #
/* multiline comment */

/* resource is something that is generated as a result of the execution 
   resource format is: <provider>_underscore_<resource>

   As below, we use "random" provider's "pet" resource!
   This resource generates unique name with some additional attributes.
   Use this resource where you need to generate unque string, also this resource does not need any arguments => empty {}
   The output is captured/showed in the "output.tf" script.
*/

// touched
resource "random_pet" "uniqueName" { }

