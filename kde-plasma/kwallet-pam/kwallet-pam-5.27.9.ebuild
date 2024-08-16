# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.98.0
inherit kde5

DESCRIPTION="PAM module to not enter KWallet password again after login"
LICENSE="LGPL-2.1"
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	dev-libs/libgcrypt:0=
	$(add_frameworks_dep kwallet)
	sys-libs/pam
"
RDEPEND="${DEPEND}
	net-misc/socat
"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_INSTALL_LIBDIR="/$(get_libdir)"
	)
	kde5_src_configure
}

pkg_postinst() {
	kde5_pkg_postinst
	elog "This package enables auto-unlocking of kde-frameworks/kwallet:5."
	elog "See also: https://wiki.gentoo.org/wiki/KDE#KWallet_auto-unlocking"
}