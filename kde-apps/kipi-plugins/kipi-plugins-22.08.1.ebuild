# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="true"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Plugins for the KDE Image Plugin Interface"
HOMEPAGE="https://userbase.kde.org/KIPI https://invent.kde.org/graphics/kipi-plugins"
LICENSE="GPL-2+"
SLOT="5"
KEYWORDS="*"
IUSE="flashexport mediawiki +remotestorage"

BDEPEND="sys-devel/gettext"
RDEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_qt_dep qtxmlpatterns)
	$(add_kdeapps_dep libkipi)=
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	flashexport? ( $(add_frameworks_dep karchive) )
	mediawiki? ( net-libs/libmediawiki:5 )
	remotestorage? ( $(add_frameworks_dep kio) )
"
DEPEND="${RDEPEND}
	$(add_qt_dep qtconcurrent)
"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_DISABLE_FIND_PACKAGE_KF5Vkontakte=ON
		$(cmake-utils_use_find_package flashexport KF5Archive)
		$(cmake-utils_use_find_package mediawiki KF5MediaWiki)
		$(cmake-utils_use_find_package remotestorage KF5KIO)
	)

	kde5_src_configure
}