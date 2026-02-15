# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="VNC-compatible server to share Plasma desktops"
HOMEPAGE="https://apps.kde.org/krfb/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/krfb-25.12.2.tar.xz -> krfb-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="wayland"
RDEPEND="virtual/kde-seed[gui,X,wayland?]
	wayland? ( sys-apps/xdg-desktop-portal[screencast(+)] )
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/kdnssd:6
	kde-frameworks/ki18n:6
	kde-frameworks/knotifications:6
	kde-frameworks/kstatusnotifieritem:6
	kde-frameworks/kwallet:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6
	kde-frameworks/kxmlgui:6
	>=net-libs/libvncserver-0.9.9
	x11-libs/libX11
	x11-libs/libxcb
	x11-libs/libXtst
	x11-libs/xcb-util-image
	wayland? (
	  kde-plasma/kpipewire:6
	  kde-plasma/kwayland:6
	  >=media-video/pipewire-0.3
	)
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
