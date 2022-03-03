# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
KDE_TEST="forceoptional"
FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.2
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="System log viewer by KDE"
HOMEPAGE="https://apps.kde.org/en/ksystemlog"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE="kdesu"

DEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kitemviews)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
"
RDEPEND="${DEPEND}
	kdesu? ( kde-plasma/kde-cli-tools[kdesu] )
"

src_prepare() {
	kde5_src_prepare
	if ! use kdesu; then
		sed -e "/^X-KDE-SubstituteUID/s:true:false:" \
			-i src/org.kde.ksystemlog.desktop || die
	fi
}

pkg_postinst() {
	kde5_pkg_postinst
	use kdesu || elog "Will show only user readable logs without USE=kdesu (only in X)."
	use kdesu && elog "Cannot be launched from application menu in Wayland with USE=kdesu."
}