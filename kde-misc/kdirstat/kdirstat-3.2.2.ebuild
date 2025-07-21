# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
inherit kde5

DESCRIPTION="GUI equivalent to the du command based on KDE Frameworks"
HOMEPAGE="https://github.com/jeromerobert/k4dirstat"
SRC_URI="https://github.com/jeromerobert/k4dirstat/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="5"
KEYWORDS="*"
IUSE=""

BDEPEND="
	sys-devel/gettext
"
DEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	sys-libs/zlib
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/k4dirstat-${PV}"

src_configure() {
	local mycmakeargs=(
		-DK4DIRSTAT_GIT_VERSION=OFF
	)
	kde5_src_configure
}
