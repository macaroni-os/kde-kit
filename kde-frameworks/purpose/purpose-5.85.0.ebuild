# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_QTHELP="false"
KDE_TEST="forceoptional"
QT_MINIMAL=5.15.1
inherit eutils kde5

DESCRIPTION="Library for providing abstractions to get the developer's purposes fulfilled"
LICENSE="LGPL-2.1+"
KEYWORDS="*"
IUSE="bluetooth +kaccounts"

DEPEND="
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kirigami)
	$(add_frameworks_dep knotifications)
	kaccounts? (
		$(add_kdeapps_dep kaccounts-integration)
		net-libs/accounts-qt
	)
"
RDEPEND="${DEPEND}
	$(add_qt_dep qtquickcontrols)
	$(add_qt_dep qtquickcontrols2)
	$(add_frameworks_dep kdeclarative)
	bluetooth? ( $(add_frameworks_dep bluez-qt) )
	kaccounts? ( net-libs/accounts-qml )
"

# requires running environment
RESTRICT+=" test"

src_prepare() {
	kde5_src_prepare
	cd src/plugins && cmake_comment_add_subdirectory bluetooth
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package kaccounts KAccounts)
	)

	kde5_src_configure
}

pkg_postinst() {
	if [[ -z "${REPLACING_VERSIONS}" ]]; then
		elog "Optional dependencies:"
		optfeature "Send through KDE Connect" kde-misc/kdeconnect
	fi
	kde5_pkg_postinst
}