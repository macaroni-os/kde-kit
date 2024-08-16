# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
inherit eutils kde5

DESCRIPTION="IDE for the R-project"
HOMEPAGE="https://rkward.kde.org/"
SRC_URI="mirror://kde/stable/${PN}/${PV}/src/${P}.tar.gz"

LICENSE="GPL-2+ LGPL-2"
SLOT="5"
KEYWORDS="*"
IUSE=""

BDEPEND="
	sys-devel/gettext
"
DEPEND="
	dev-lang/R
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtscript)
	$(add_qt_dep qtwebengine)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep ktexteditor)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
"
RDEPEND="${DEPEND}"

pkg_postinst() {
	elog "Optional dependencies:"
	optfeature "kate plugins support" kde-apps/kate:${SLOT}
	kde5_pkg_postinst
}
