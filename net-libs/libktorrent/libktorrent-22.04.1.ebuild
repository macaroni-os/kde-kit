# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="forceoptional"
FRAMEWORKS_MINIMAL=5.94.0
QT_MINIMAL=5.15.2
VIRTUALX_REQUIRED="test"
inherit kde5
SRC_URI="mirror://kde/stable/release-service/${PV}/src/${P}.tar.xz"
DESCRIPTION="BitTorrent library based on KDE Frameworks"
HOMEPAGE="https://apps.kde.org/en/ktorrent https://userbase.kde.org/KTorrent"
LICENSE="GPL-2+"
SLOT="5"
KEYWORDS="*"
IUSE=""

BDEPEND="sys-devel/gettext"
COMMON_DEPEND="
	>=app-crypt/qca-2.3.0:2
	>=dev-libs/gmp-6.0.0a:0=
	dev-libs/libgcrypt:0=
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep solid)
"
DEPEND="${COMMON_DEPEND}
	dev-libs/boost
"
RDEPEND="${COMMON_DEPEND}
	!dev-libs/botan[gmp(-)]
"

src_prepare() {
	kde5_src_prepare

	# Gentoo workaround because gmp.h in MULTILIB_WRAPPED_HEADERS is breaking this
	sed -i -e "/^find_package/ s/\"\${LibGMP_MIN_VERSION}\" //" \
		CMakeLists.txt || die
	sed -i -e "/^find_dependency/ s/ \"@LibGMP_MIN_VERSION@\"//" \
		KF5TorrentConfig.cmake.in || die
}

src_test() {
	# failing network tests
	local myctestargs=(
		-E "(fin|packetloss|send|superseedtest|transmit|utppolltest)"
	)

	kde5_src_test
}
