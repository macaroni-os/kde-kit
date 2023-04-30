# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="forceoptional"
KMNAME="alkimia"
FRAMEWORKS_MINIMAL=5.74.0
QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Library with common classes and functionality used by KDE finance applications"
HOMEPAGE="https://www.linux-apps.com/content/show.php/libalkimia?content=137323
https://community.kde.org/Alkimia"
SRC_URI="mirror://kde/stable/${KMNAME}/${PV}/${KMNAME}-${PV}.tar.xz"

LICENSE="LGPL-2.1"
SLOT="0/8"
KEYWORDS="*"
IUSE="doc gmp plasma webengine"

BDEPEND="
	virtual/pkgconfig
	doc? ( app-doc/doxygen )
"
DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kcodecs)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdelibs4support)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep knewstuff)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	!gmp? ( sci-libs/mpir:=[cxx] )
	gmp? ( dev-libs/gmp:0=[cxx] )
	plasma? (
		$(add_frameworks_dep kpackage)
		$(add_frameworks_dep plasma)
	)
	webengine? ( $(add_qt_dep qtwebengine) )
"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${PN}-8.0.3-cmake.patch" )

src_configure() {
	local mycmakeargs=(
		-DENABLE_FINANCEQUOTE=OFF
		-DBUILD_TOOLS=ON
		-DBUILD_WITH_WEBKIT=OFF
		-DBUILD_DOXYGEN_DOCS=$(usex doc)
		$(cmake-utils_use_find_package !gmp MPIR)
		-DBUILD_APPLETS=$(usex plasma)
		-DBUILD_WITH_WEBENGINE=$(usex webengine)
	)
	kde5_src_configure
}

src_test() {
	# Depends on BUILD_WITH_WEBKIT, bug 736128
	local myctestargs=(
		-E "(alkonlinequotestest)"
	)
	kde5_src_test
}
