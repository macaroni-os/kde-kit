# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
FRAMEWORKS_MINIMAL=5.94.0
QT_MINIMAL=5.15.2
inherit kde5
SRC_URI="mirror://kde/stable/release-service/${PV}/src/${P}.tar.xz"
DESCRIPTION="User friendly IRC Client"
HOMEPAGE="https://konversation.kde.org https://apps.kde.org/en/konversation"
LICENSE="GPL-2"
SLOT="5"
KEYWORDS="*"
IUSE="+crypt"

BDEPEND="sys-devel/gettext"
DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kbookmarks)
	$(add_frameworks_dep kcodecs)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kglobalaccel)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kidletime)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kitemviews)
	$(add_frameworks_dep knewstuff)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep knotifyconfig)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwallet)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	>=media-libs/phonon-4.11.0
	crypt? ( >=app-crypt/qca-2.3.0:2 )
"
RDEPEND="${DEPEND}
	$(add_qt_dep qtsvg)
	crypt? ( >=app-crypt/qca-2.3.0:2[ssl] )
"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package crypt Qca-qt5)
	)

	kde5_src_configure
}

src_install() {
	kde5_src_install

	# Bug 616162
	insinto /etc/xdg
	doins "${FILESDIR}"/konversationrc
}
