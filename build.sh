#!/bin/sh

top_dir="$(cd "$(dirname "$0")" > /dev/null 2>&1 && pwd)"

usage()
{
  echo "usage : $0 [options] target1 target2 ..."
}

configure()
{
  config
}

config()
{
  set -e
  autoreconf -vi
  sh configure \
    --prefix=/usr \
    --without-libmylib
}

config_with_libmylib()
{
  set -e
  autoreconf -vi
  sh configure \
    --prefix=/usr \
    --enable-shared \
    --disable-static \
    --with-libmylib-include=`pwd`/../libmylib/src \
    --with-libmylib-lib=`pwd`/../libmylib/src
}

build()
{
  make
}

check()
{
  make check
}

install()
{
  make install DESTDIR=`pwd`/root
}

package()
{
  make dpkg
}

publish()
{
  if [ -z "${JOB_NAME}" ]; then
    JOB_NAME="NoName"
  fi

  if [ -z "${BUILD_NUMBER}" ]; then
    BUILD_NUMBER=1
  fi

  jf rt build-clean
  jf rt build-add-git
  jf rt build-collect-env ${JOB_NAME} ${BUILD_NUMBER}
  jf rt build-publish ${JOB_NAME} ${BUILD_NUMBER}
}

all()
{
  config
  build
  check
  install
  package
}


while [ $# -ne 0 ]; do
  case "$1" in
    -h | --help)
      usage
      exit 1
      ;;
    -o | --output)
      shift
      output=$1
      ;;
    -l | --logfile)
      shift
      logfile=$1
      ;;
    *)
      break
      ;;
  esac

  shift
done

if [ $# -eq 0 ]; then
  all
fi

for target in "$@"; do
  LANG=C type "$target" | grep 'function' > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    $target
  else
    echo "ERROR : $target is not a shell function"
    exit 1
  fi
done

