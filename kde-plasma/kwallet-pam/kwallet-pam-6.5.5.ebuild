# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="KWallet PAM module for unlock KDE Wallet on login"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/kwallet-pam-6.5.5.tar.xz -> kwallet-pam-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
BDEPEND="virtual/pkgconfig
	
"
RDEPEND="net-misc/socat
	
"
DEPEND="${RDEPEND}
	dev-libs/libgcrypt:=
	sys-libs/pam
	kde-frameworks/kwallet:6
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      -DCMAKE_INSTALL_LIBDIR="/$(get_libdir)"
	  )
	  kde6_src_configure
}
pkg_postinst() {
	  elog "This package enables auto-unlocking of kde-frameworks/kwallet:6."
	  elog "See also: https://wiki.gentoo.org/wiki/KDE#KWallet_auto-unlocking"
}


# vim: filetype=ebuild
