# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
KDE_QTHELP="false" # TODO: figure out install error
KDE_TEST="forceoptional"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="KDE UML Modeller"
HOMEPAGE="https://apps.kde.org/en/umbrello https://umbrello.kde.org"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE="php"

RDEPEND="
	dev-libs/libxml2
	dev-libs/libxslt
	$(add_qt_dep qtgui)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdelibs4support)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep ktexteditor)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	php? (
		dev-util/kdevelop:5=
		dev-util/kdevelop-pg-qt:5
		dev-util/kdevelop-php:5
	)
"
DEPEND="${RDEPEND}"

src_prepare() {
	kde5_src_prepare
	sed -i 's@doc/HTML@help@' umbrello/umlappprivate.cpp || die
}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_DISABLE_FIND_PACKAGE_Doxygen=ON # broken, re-enable w/ ECM_QTHELP
		-DCMAKE_DISABLE_FIND_PACKAGE_Qt5WebKitWidgets=ON
		-DBUILD_APIDOC=OFF
		-DBUILD_KF5=ON
		-DBUILD_PHP_IMPORT=$(usex php)
		-DBUILD_unittests=$(usex test)
	)
	use test && mycmakeargs+=(
		-DCMAKE_DISABLE_FIND_PACKAGE_LLVM=ON
		-DCMAKE_DISABLE_FIND_PACKAGE_Clang=ON
		-DCMAKE_DISABLE_FIND_PACKAGE_CLANG=ON
	)

	kde5_src_configure
}
