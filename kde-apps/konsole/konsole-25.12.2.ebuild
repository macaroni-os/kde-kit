# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="KDE's terminal emulator"
HOMEPAGE="https://apps.kde.org/konsole/ https://konsole.kde.org"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/konsole-25.12.2.tar.xz -> konsole-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="X"
RDEPEND="dev-libs/icu:=
	virtual/kde-seed[gui,multimedia]
	kde-frameworks/kbookmarks:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/kglobalaccel:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kjobwidgets:6
	kde-frameworks/knewstuff:6
	kde-frameworks/knotifications:6
	kde-frameworks/knotifyconfig:6
	kde-frameworks/kparts:6
	kde-frameworks/kpty:6
	kde-frameworks/kservice:6
	kde-frameworks/ktextwidgets:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6[X?]
	kde-frameworks/kxmlgui:6
	
"
DEPEND="${RDEPEND}
"
src_configure() {
	local mycmakeargs=(
	  -DMOZILLA_DIR="${EPREFIX}/usr/$(get_libdir)/mozilla"
	)
	cmake_src_configure
}


# vim: filetype=ebuild
