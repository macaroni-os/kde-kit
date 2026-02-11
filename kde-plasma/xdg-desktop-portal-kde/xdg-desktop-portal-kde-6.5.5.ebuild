# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Backend implementation for xdg-desktop-portal that is using Qt/KDE Frameworks"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/xdg-desktop-portal-kde-6.5.5.tar.xz -> xdg-desktop-portal-kde-6.5.5.tar.xz"
LICENSE="LGPL-2+"
SLOT="6"
KEYWORDS="*"
IUSE="wayland"
BDEPEND="virtual/pkgconfig
	wayland? (
	  dev-libs/plasma-wayland-protocols
	  dev-libs/wayland-protocols
	)
	
"
RDEPEND="virtual/kde-seed[wayland?]
	kde-misc/kio-fuse
	sys-apps/xdg-desktop-portal
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
