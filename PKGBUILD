# An example PKGBUILD script for Civetweb upstream, git version
# Rename to PKGBUILD to build via makepkg
_pkgname=myapp
pkgname=${_pkgname}-git
pkgver=6e64212
pkgrel=1
pkgdesc="myapp"
arch=('i686' 'x86_64')
url="https://github.com/ono-kojiro/myapp"
license=('MIT')
groups=()
depends=()
makedepends=('gcc' 'git' 'make' 'automake' 'autoconf' 'libtool')
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/ono-kojiro/myapp.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
  #git describe --tags | sed 's|-|.|g'
  git rev-parse --short HEAD
}

prepare() {
  :
}

build() {
  cd "$srcdir/$_pkgname"
  autoreconf -vi
  rm -rf _build
  mkdir -p _build
  cd _build
  sh ../configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  cd _build
  make install DESTDIR=$pkgdir
}

# vim:set ts=2 sw=2 et:


