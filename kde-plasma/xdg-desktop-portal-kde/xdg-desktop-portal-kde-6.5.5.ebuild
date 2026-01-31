# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Backend implementation for xdg-desktop-portal that is using Qt/KDE Frameworks"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/xdg-desktop-portal-kde-6.5.5.tar.xz -> xdg-desktop-portal-kde-6.5.5.tar.xz"
LICENSE="LGPL-2+"
SLOT="6"
KEYWORDS="*"
BDEPEND="dev-qt/qtbase:6[wayland]
	virtual/pkgconfig
	|| ( >=dev-qt/qtbase-6.10:6[wayland] <dev-qt/qtwayland-6.10:6 )
	
"
RDEPEND="kde-misc/kio-fuse
	sys-apps/xdg-desktop-portal
	|| ( >=dev-qt/qtbase-6.10:6[wayland] <dev-qt/qtwayland-6.10:6 )
	
"
DEPEND="${RDEPEND}
	>=dev-libs/plasma-wayland-protocols-1.18.0
	>=dev-libs/wayland-protocols-1.25
	dev-qt/qtbase:6
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
