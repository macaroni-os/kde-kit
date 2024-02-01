# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.12.3
inherit kde5

DESCRIPTION="Frontend to various audio converters"
HOMEPAGE="https://www.linux-apps.com/p/1126634/ https://github.com/dfaust/soundkonverter"
SRC_URI="https://github.com/dfaust/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="5"
KEYWORDS="*"

BDEPEND="
	sys-devel/gettext
"
DEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_kdeapps_dep libkcddb)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdelibs4support)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	$(add_frameworks_dep solid)
	media-libs/phonon[qt5(+)]
	>=media-libs/taglib-1.10
	media-sound/cdparanoia
"
RDEPEND="${DEPEND}
	!media-sound/soundkonverter:4
"

PATCHES=(
	"${FILESDIR}/${P}-deps.patch" # pending upstream
	"${FILESDIR}/${P}-kf-5.72-findtaglib.patch" # pending upstream
	"${FILESDIR}/${P}-fix-add-dirs.patch"
	"${FILESDIR}/${P}-metainfodir.patch"
)

S="${WORKDIR}"/${P}/src

pkg_postinst() {
	kde5_pkg_postinst

	elog "soundKonverter optionally supports many different audio formats."
	elog "You will need to install the appropriate encoding packages for the"
	elog "formats you require. For a full listing, consult the README file"
	elog "in /usr/share/doc/${PF}"
}
