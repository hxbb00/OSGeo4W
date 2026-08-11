export P=python3-multiprocess
export V=pip
export B=pip
export MAINTAINER=JuergenFischer
export BUILDDEPENDS="python3-pip python3-wheel python3-setuptools python3-dill"
export PACKAGES="python3-multiprocess"

source ../../../scripts/build-helpers

startlog

packagewheel

endlog
