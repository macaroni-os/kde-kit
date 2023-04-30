# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
FRAMEWORKS_MINIMAL=5.60.0
QT_MINIMAL=5.12.3
inherit kde5

DESCRIPTION="Advanced network neighborhood browser"
HOMEPAGE="https://apps.kde.org/en/smb4k
https://sourceforge.net/p/smb4k/home/Home/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="5"
KEYWORDS="*"
IUSE="plasma"

DEPEND="
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qttest)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kauth)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kwallet)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	$(add_frameworks_dep solid)
	net-fs/samba[cups]
"
RDEPEND="${DEPEND}
	plasma? (
		$(add_qt_dep qtquickcontrols2)
		$(add_frameworks_dep plasma)
	)
"

src_configure() {
	local mycmakeargs=(
		-DINSTALL_PLASMOID=$(usex plasma)
	)
	kde5_src_configure
}

pkg_postinst() {
	kde5_pkg_postinst
	elog "Users of Samba 4.7 and above please note that for the time being,"
	elog "the following setting has to be added to or changed in the [global]"
	elog "section of the smb.conf file:"
	elog
	elog "[global]"
	elog "client max protocol = NT1"
}
