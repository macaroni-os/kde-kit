# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
KDE_TEST="optional"
FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="KIO Slave for Google Drive service"
HOMEPAGE="https://apps.kde.org/en/kio_gdrive"
SRC_URI="mirror://kde/stable/release-service/${PV}/src/${P}.tar.xz"

LICENSE="GPL-2+"
SLOT="5"
KEYWORDS="*"
IUSE="+kaccounts"

BDEPEND="dev-util/intltool"
COMMON_DEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_kdeapps_dep libkgapi)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep knotifications)
	kaccounts? ( $(add_kdeapps_dep kaccounts-integration) )
	!kaccounts? ( dev-libs/qtkeychain:=[qt5(+)] )
"
DEPEND="${COMMON_DEPEND}
	$(add_qt_dep qtnetwork)
"
RDEPEND="${COMMON_DEPEND}
	kaccounts? ( $(add_kdeapps_dep kaccounts-providers) )
"

DOCS=( README.md )

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package kaccounts KAccounts)
	)
	kde5_src_configure
}
