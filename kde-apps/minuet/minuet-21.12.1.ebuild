# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="Music Education software by KDE"
HOMEPAGE="https://minuet.kde.org/"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE=""

BDEPEND="
	virtual/pkgconfig
"
DEPEND="
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtquickcontrols2)
	$(add_qt_dep qtsvg)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep ki18n)
	media-sound/fluidsynth:=
"
RDEPEND="${DEPEND}"