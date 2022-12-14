#include "config.h"

#include <stdio.h>

#ifdef HAVE_LIBMYLIB
#include "mylib.h"
#endif

int main(int argc, char **argv)
{
	printf("This is myapp.\n");
#ifdef HAVE_LIBMYLIB
	mylib();
#else
	printf("mylib() is not called.\n"); 
#endif

	printf("jenkins pipeline test\n");

    printf("return 0\n");
	return 0;
}

