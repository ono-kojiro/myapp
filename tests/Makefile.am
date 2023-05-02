TESTS = 01-simple.sh 02-simple.sh

LOG_DRIVER := $(SHELL) test_wrapper $(top_srcdir)/config/test-driver

EXTRA_DIST = test_wrapper trs2junit $(TESTS)

check :
	$(PYTHON) $(top_srcdir)/tests/trs2junit -o junit_result.xml *.trs

