# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Components relating to Flatpak pipewire use in Plasma"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/kpipewire-6.5.5.tar.xz -> kpipewire-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="kde-frameworks/kirigami:6
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	media-libs/libepoxy
	media-libs/libglvnd
	media-libs/mesa
	media-video/ffmpeg:=
	media-video/pipewire[extra]
	x11-libs/libdrm
	x11-libs/libva
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
