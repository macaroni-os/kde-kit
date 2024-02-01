# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="true"
KDE_HANDBOOK="forceoptional"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.12.3
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Multiple information organizer - a DropDrawers clone"
HOMEPAGE="https://github.com/basket-notepads/basket"
SRC_URI="https://github.com/${PN}-notepads/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="5"
KEYWORDS="*"
IUSE="crypt git"

BDEPEND="git? ( virtual/pkgconfig )"
RDEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kcodecs)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kfilemetadata)
	$(add_frameworks_dep kglobalaccel)
	$(add_frameworks_dep kguiaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	media-libs/phonon[qt5(+)]
	x11-libs/libX11
	crypt? ( app-crypt/gpgme:= )
	git? ( dev-libs/libgit2:= )
"
DEPEND="${RDEPEND}
	$(add_qt_dep qtconcurrent)
"

PATCHES=(
	"${FILESDIR}/${P}-xdg_mime_install_dir.patch"
	"${FILESDIR}/${P}-libgit2-0.99-compat.patch" # bug #710832
)

src_prepare() {
	kde5_src_prepare
	if ! use test; then
		sed -e "/add_subdirectory(tests/s/^/#DONT/" -i src/CMakeLists.txt || die
	fi
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package crypt Gpgme)
		$(cmake-utils_use_find_package git Libgit2)
	)
	kde5_src_configure
}
