# This Makefile assumes that you have swiftenv installed
# To get going, start with `make init`
# https://akrabat.com/cross-platform-makefile-for-swift/

SHELL = /bin/sh

# trunk
# SWIFT_VERSION = swift-DEVELOPMENT-SNAPSHOT-2020-04-23-a

# Swift 5.3
# SWIFT_VERSION = swift-5.3-DEVELOPMENT-SNAPSHOT-2020-04-21-a

SWIFT_VERSION = 5.2.2

# OS specific differences
UNAME = ${shell uname}
ifeq ($(UNAME), Darwin)
SWIFTC_FLAGS =
LINKER_FLAGS = -Xlinker -L/usr/local/lib
endif
ifeq ($(UNAME), Linux)
SWIFTC_FLAGS = -Xcc -fblocks
LINKER_FLAGS = -Xlinker -rpath -Xlinker .build/debug
PATH_TO_SWIFT = /home/vagrant/swiftenv/versions/$(SWIFT_VERSION)
endif


build:
	swift build $(SWIFTC_FLAGS) $(LINKER_FLAGS)

test: build
	swift test

clean:
	swift package clean

distclean:
	rm -rf Packages
	swift package clean

init:
	- swiftenv install $(SWIFT_VERSION)
	swiftenv local $(SWIFT_VERSION)
ifeq ($(UNAME), Linux)
	cd /vagrant && \
	  git clone --recursive -b experimental/foundation https://github.com/apple/swift-corelibs-libdispatch.git && \
	  cd swift-corelibs-libdispatch && \
	  sh ./autogen.sh && \
	  ./configure --with-swift-toolchain=/home/vagrant/swiftenv/versions/$(SWIFT_VERSION)/usr \
	    --prefix=/home/vagrant/swiftenv/versions/$(SWIFT_VERSION)/usr && \
	  make && make install
endif


.PHONY: build test distclean init
