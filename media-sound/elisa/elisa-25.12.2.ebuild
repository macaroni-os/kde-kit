# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake xdg

DESCRIPTION="Simple music player by KDE"
HOMEPAGE="https://apps.kde.org/elisa/"
SRC_URI="https://download.kde.org/Attic//release-service/25.12.2/src/elisa-25.12.2.tar.xz -> elisa-25.12.2.tar.xz"
LICENSE="LGPL-3+ GPL-3+"
SLOT="6"
KEYWORDS="*"
IUSE="+mpris +vlc"
BDEPEND="sys-devel/gettext
	
"
RDEPEND="virtual/kde-seed[declarative,gui,multimedia,sql,svg]
	dev-libs/kirigami-addons:6
	kde-frameworks/kcodecs:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kfilemetadata:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kirigami:6
	kde-frameworks/kxmlgui:6
	kde-frameworks/qqc2-desktop-style:6
	mpris? ( kde-frameworks/kdbusaddons:6 )
	vlc? ( media-video/vlc:= )
	
"
DEPEND="${RDEPEND}
"
src_prepare() {
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		$(cmake_use_find_package mpris Qt6DBus)
		$(cmake_use_find_package mpris KF6DBusAddons)
		$(cmake_use_find_package vlc LIBVLC)
		-DCMAKE_DISABLE_FIND_PACKAGE_UPNPQT=ON
	)
	cmake_src_configure
}

pkg_postinst() {
	xdg_pkg_postinst
}


# vim: filetype=ebuild
