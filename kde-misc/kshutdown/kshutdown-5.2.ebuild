# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kde5

DESCRIPTION="Shutdown manager for desktop environments like KDE Plasma"
HOMEPAGE="https://kshutdown.sourceforge.io"
SRC_URI="mirror://sourceforge/${PN}/${PN}-source-${PV}.zip"

LICENSE="GPL-2+"
SLOT="5"
KEYWORDS="*"
IUSE="+kde"

BDEPEND="
	app-arch/unzip
	sys-devel/gettext
	kde? ( $(add_frameworks_dep extra-cmake-modules) )
"
DEPEND="
	$(add_qt_dep qtcore)
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	kde? (
		$(add_frameworks_dep kconfig)
		$(add_frameworks_dep kconfigwidgets)
		$(add_frameworks_dep kcoreaddons)
		$(add_frameworks_dep kcrash)
		$(add_frameworks_dep kdbusaddons)
		$(add_frameworks_dep kglobalaccel)
		$(add_frameworks_dep ki18n)
		$(add_frameworks_dep kidletime)
		$(add_frameworks_dep knotifications)
		$(add_frameworks_dep knotifyconfig)
		$(add_frameworks_dep kwidgetsaddons)
		$(add_frameworks_dep kxmlgui)
	)
"
RDEPEND="${DEPEND}
	|| (
		kde-frameworks/breeze-icons
		kde-frameworks/oxygen-icons
	)
"

src_configure() {
	local mycmakeargs=(
		-DKS_PURE_QT=$(usex !kde)
	)

	kde5_src_configure
}
