# Distributed under the terms of the GNU General Public License v2

EAPI=7

QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="NetworkManager bindings for Qt"
LICENSE="LGPL-2"
KEYWORDS="*"
IUSE="elogind teamd"

BDEPEND="
	virtual/pkgconfig
"
DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtnetwork)
	>=net-misc/networkmanager-1.4.0-r1[teamd=]
"
RDEPEND="${DEPEND}
	>=net-misc/networkmanager-1.4.0-r1[elogind?]
"

src_test() {
	# bug: 625276
	local myctestargs=( -E "(managertest|settingstest|activeconnectiontest)" )

	kde5_src_test
}
