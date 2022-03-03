# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="KDE Telepathy account management kcm"
HOMEPAGE="https://community.kde.org/KTp"
LICENSE="LGPL-2.1"
SLOT="5"
KEYWORDS="*"
IUSE="experimental"

COMMON_DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtwidgets)
	$(add_kdeapps_dep kaccounts-integration)
	$(add_frameworks_dep kcodecs)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kitemviews)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwidgetsaddons)
	net-libs/accounts-qt
	net-libs/signond
	>=net-libs/telepathy-qt-0.9.8
"
DEPEND="${COMMON_DEPEND}
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kio)
	net-libs/libaccounts-glib
"
RDEPEND="${COMMON_DEPEND}
	$(add_kdeapps_dep kaccounts-providers)
	net-im/telepathy-connection-managers
"

src_configure() {
	local mycmakeargs=(
		-DBUILD_DISABLED_PROVIDERS=$(usex experimental)
	)
	kde5_src_configure
}

pkg_postinst() {
	if use experimental; then
		ewarn "Experimental providers are enabled."
		ewarn "Most of them aren't integrated nicely and may require additional steps for account creation."
		ewarn "Use at your own risk!"
	fi
	kde5_pkg_postinst
}