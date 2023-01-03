TESTS = 01-simple.sh 02-simple.sh

LOG_DRIVER := $(SHELL) test_wrapper $(top_srcdir)/config/test-driver

EXTRA_DIST = $(TESTS)

check :
	trs2junit -o junit_result.xml *.trs

