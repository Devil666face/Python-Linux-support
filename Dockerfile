# Use Ubuntu 18.04 (bionic) as a base image. This ensures that we're using an
# old version of libc, maximizing the compatibility of the image when it is
# included in an AppImage.
# FROM ubuntu:18.04
FROM debian:10

# Install the build requirements for Python.
RUN apt-get update -y && \
    apt-get install -y \
        gcc make patchelf curl \
        libbz2-dev \
        libffi-dev \
        libgdbm-compat-dev \
        libgdbm-dev \
        liblzma-dev \
        libncurses5-dev \
        libsqlite3-dev \
        libssl-dev \
        uuid-dev \
        zlib1g-dev

# My custom requirements for Python
RUN apt-get install -y \
        build-essential \
        python-dev \
        python-setuptools \
        python-pip \
        python-smbus \
        libncursesw5-dev \
        libgdbm-dev \
        libc6-dev \
        zlib1g-dev \
        libsqlite3-dev \
        tk-dev \
        libssl-dev \
        openssl \
        libffi-dev \
        build-essential \
        libssl-dev \
        zlib1g-dev \
        libbz2-dev \
        libreadline-dev \
        libsqlite3-dev \
        wget \
        curl \
        llvm \
        libncurses5-dev \
        ibncursesw5-dev \
        xz-utils \
        tk-dev \
        liblzma-dev \
        tk-dev

#Dependeces from python of doc
RUN apt-get install -y \
        build-essential \
        gdb \
        lcov \
        pkg-config \
        libbz2-dev \
        libffi-dev \
        libgdbm-dev \
        libgdbm-compat-dev \
        liblzma-dev \
        libncurses5-dev \
        libreadline6-dev \
        libsqlite3-dev \
        libssl-dev \
        lzma \
        lzma-dev \
        tk-dev \
        uuid-dev \
        zlib1g-dev

# Install the Makefile and exclude list, and build Python.
# This Makefile will assume there are two external mountpoints:
#   /local/downloads (to ensure that we don't repeatedly download source code)
#   /local/dist (to provide an external location for build products)
# You can mount these directories using the -v option to docker:
#   docker run -it -v `pwd`/downloads:/local/downloads -v `pwd`/dist:/local/dist ...
COPY Makefile local/Makefile
COPY exclude.list local/exclude.list
WORKDIR /local
CMD ["make", "-e", "Python"]
