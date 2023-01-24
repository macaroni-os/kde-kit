# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.12.3
inherit kde5

DESCRIPTION="Free/Open Source micro-blogging client by KDE"
HOMEPAGE="https://choqok.kde.org/ https://apps.kde.org/en/choqok"
SRC_URI="mirror://kde/stable/${PN}/${PV%.0}/src/${P}.tar.xz"

LICENSE="GPL-2+"
SLOT="5"
KEYWORDS="*"
IUSE="attica share telepathy"

DEPEND="
	app-crypt/qca[qt5(+)]
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetworkauth)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kemoticons)
	$(add_frameworks_dep kglobalaccel)
	$(add_frameworks_dep kguiaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep knotifyconfig)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwallet)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	$(add_frameworks_dep sonnet)
	attica? ( $(add_frameworks_dep attica) )
	share? ( $(add_frameworks_dep purpose) )
	telepathy? ( net-libs/telepathy-qt[qt5(+)] )
"
RDEPEND="${DEPEND}"

DOCS=( AUTHORS README changelog )

src_prepare() {
	kde5_src_prepare
	# TODO: quick fix for bug #708464
	sed -e "/find_package.*Purpose)/s/ COMPONENTS //" -i CMakeLists.txt || die
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package attica KF5Attica)
		-DCMAKE_DISABLE_FIND_PACKAGE_KF5WebKit=ON
		$(cmake-utils_use_find_package share KF5Purpose)
		$(cmake-utils_use_find_package telepathy TelepathyQt5)
	)

	kde5_src_configure
}
