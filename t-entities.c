/*	Copyright 2012 Christoph Gärtner, ooxi/entities
		https://bitbucket.org/cggaertner/cstuff
		https://github.com/ooxi/entities

	Distributed under the Boost Software License, Version 1.0
*/

#include "entities.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#undef NDEBUG
#include <assert.h>

int main(void)
{
	{
		static const char SAMPLE[] = "Christoph Gärtner";
		static char buffer[] = "Christoph G&auml;rtner";
		assert(decode_html_entities_utf8(buffer, NULL) == sizeof SAMPLE - 1);
		assert(strcmp(buffer, SAMPLE) == 0);
	}

	{
		static const char SAMPLE[] = "test@example.org";
		static const char INPUT[] = "test&#x40;example.org";
		static char buffer[sizeof INPUT];
		assert(decode_html_entities_utf8(buffer, INPUT) == sizeof SAMPLE - 1);
		assert(strcmp(buffer, SAMPLE) == 0);
	}

	{
		static const char INPUT[] = "Miguel Leitão\ntest@example.org\n<p>Hello!!</p>";
		static char GOAL[] = 
			"Miguel Leit&atilde;o\ntest&commat;example.org\n&lt;p&gt;Hello!!&lt;/p&gt;";
		char OUTPUT[sizeof GOAL];
		char REVERT[sizeof GOAL];
		assert(encode_html_entities(OUTPUT, INPUT) == sizeof GOAL - 1);
		// printf("output: %s\n", OUTPUT);
		assert(strcmp(OUTPUT,GOAL) == 0);
		decode_html_entities_utf8(REVERT,OUTPUT);
		
		assert(strcmp(INPUT,REVERT) == 0);
	}


	fprintf(stdout, "All tests passed :-)\n");
	return EXIT_SUCCESS;
}

