export P=base
export V=1.0.0
export B=next
export MAINTAINER=JuergenFischer
export BUILDDEPENDS=none
export PACKAGES="base"

source ../../../scripts/build-helpers

startlog

cd ..

vsenv

nmake /f makefile.vc

export R=$OSGEO4W_REP/x86_64/release/$P
mkdir -p $R

cat <<EOF >$R/setup.hint
sdesc: "OSGeo4W base package"
ldesc: "OSGeo4W base package"
maintainer: $MAINTAINER
category: Commandline_Utilities
requires: msvcrt2019 setup
EOF

tar -cjf $R/$P-$V-$B.tar.bz2 \
	--xform "s,^bgspawn.exe,bin/bgspawn.exe," \
	--xform "s,^elevate.exe,bin/elevate.exe," \
	--xform "s,^dllupdate.exe,bin/dllupdate.exe," \
	--xform "s,^getspecialfolder.exe,bin/getspecialfolder.exe," \
	--xform "s,^xxmklink.exe,bin/xxmklink.exe," \
	--xform "s,^textreplace.exe,bin/textreplace.exe," \
	--xform "s,^iswindows8orgreater.exe,bin/iswindows8orgreater.exe," \
	--xform "s,^arpregistration.exe,bin/arpregistration.exe," \
	--xform "s,^o4w_env.bat,bin/o4w_env.bat," \
	--xform "s,^ini.bat,etc/ini/$P.bat," \
	--xform "s,^postinstall.bat,etc/postinstall/$P.bat," \
	--xform "s,^preremove.bat,etc/preremove/$P.bat," \
	--xform "s,^o-help.bat,bin/o-help.bat," \
	bgspawn.exe \
	elevate.exe \
	dllupdate.exe \
	getspecialfolder.exe \
	textreplace.exe \
	xxmklink.exe \
	iswindows8orgreater.exe \
	arpregistration.exe \
	ini.bat \
	o4w_env.bat \
	OSGeo4W.bat \
	OSGeo4W.ico \
	postinstall.bat \
	preremove.bat \
	o-help.bat

tar -cjf $R/$P-$V-$B-src.tar.bz2 \
	osgeo4w/package.sh \
	bgspawn.c \
	dllupdate.cpp \
	getspecialfolder.c \
	textreplace.c \
	iswindows8orgreater.c \
	makefile.vc \
	o4w_env.bat \
	OSGeo4W.bat \
	OSGeo4W.ico \
	ini.bat \
	postinstall.bat \
	preremove.bat \
	o-help.bat

endlog
