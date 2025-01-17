# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="true"
KDE_QTHELP="false"
QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Framework easing the development transition from KDELibs 4 to KF 5"
LICENSE="LGPL-2+"
KEYWORDS="*"
IUSE="libressl X"

BDEPEND="
	dev-lang/perl
	dev-perl/URI
"
COMMON_DEPEND="
	app-text/docbook-xml-dtd:4.2
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork ssl)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qttest)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kauth)
	$(add_frameworks_dep kcodecs)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kded)
	$(add_frameworks_dep kdoctools)
	$(add_frameworks_dep kemoticons)
	$(add_frameworks_dep kglobalaccel)
	$(add_frameworks_dep kguiaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kitemviews)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kunitconversion)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	$(add_frameworks_dep solid)
	virtual/libintl
	!libressl? ( dev-libs/openssl:0 )
	libressl? ( dev-libs/libressl )
	X? (
		$(add_qt_dep qtx11extras)
		x11-libs/libICE
		x11-libs/libSM
		x11-libs/libX11
		x11-libs/libxcb
	)
"
DEPEND="${COMMON_DEPEND}
	test? ( $(add_qt_dep qtconcurrent) )
	X? ( x11-base/xorg-proto )
"
RDEPEND="${COMMON_DEPEND}
	$(add_qt_dep qtxml)
	$(add_frameworks_dep kinit)
	$(add_frameworks_dep kitemmodels)
"

RESTRICT+=" test"

PATCHES=(
	"${FILESDIR}/${PN}-5.80.0-no-kdesignerplugin.patch" # bug 755956
	"${FILESDIR}/${PN}-5.86.0-unused-dep.patch" # bug 755956
)

src_prepare() {
	kde5_src_prepare
	if ! use handbook; then
		sed -e "/kdoctools_install/ s/^/#DONT/" -i CMakeLists.txt || die
	fi
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package X X11)
	)

	kde5_src_configure
}