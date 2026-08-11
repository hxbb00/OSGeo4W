export P=python3-python-discovery
export V=pip
export B=pip
export MAINTAINER=JuergenFischer
export BUILDDEPENDS="python3-pip python3-wheel python3-setuptools python3-filelock"
export PACKAGES="python3-python-discovery"

source ../../../scripts/build-helpers

startlog

packagewheel

endlog
