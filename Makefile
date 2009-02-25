###
# Makefile
# Part of the NV  Virtual Buffer Library
# This library is copyright 2007, 2008 NV Virtual Buffer Library Contributors
# This library is licensed under the GNU Lesser General Public Licence. See license.txt which is included with this library, or see
# http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html
###

TOPDIR=.
!include $(TOPDIR)\make.opts

all: 
	if not EXIST $(OUTDIR) mkdir $(OUTDIR)
	cd base && $(MAKE) /nologo DEBUG=$(DEBUG)
	cd backends && $(MAKE) /nologo DEBUG=$(DEBUG)
	cd client && $(MAKE) /nologo DEBUG=$(DEBUG)

test:
	if not EXIST $(OUTDIR) mkdir $(OUTDIR)
	cd tests && $(MAKE) /nologo DEBUG=$(DEBUG)

clean:
	cd backends && $(MAKE) /nologo clean
	cd base && $(MAKE) /nologo clean
	cd client && $(MAKE) /nologo clean
	cd remoteApi && $(MAKE) /nologo clean
	cd tests && $(MAKE) /nologo clean

distclean: clean
 	-rmdir /Q /s build 2>NUL
 	-rmdir /Q /s build_debug 2>NUL
