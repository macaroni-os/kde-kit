# Distributed under the terms of the GNU General Public License v2

EAPI=7

ECM_TEST="true"
KFMIN=5.106.0
QTMIN=5.15.2
inherit kde5

DESCRIPTION="Components relating to Flatpak pipewire use in Plasma"

LICENSE="LGPL-2.1+"
SLOT="5"
KEYWORDS="*"
IUSE=""

COMMON_DEPEND="
	dev-libs/wayland
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwayland)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kwayland)
	media-libs/libepoxy
	media-libs/libglvnd
	media-video/ffmpeg:=
	>=media-video/pipewire-0.3:=
	x11-libs/libdrm
"
DEPEND="${COMMON_DEPEND}
	dev-libs/plasma-wayland-protocols
"
RDEPEND="${COMMON_DEPEND}
	$(add_qt_dep qtquickcontrols2)
	$(add_frameworks_dep kirigami)
	x11-themes/sound-theme-freedesktop
"
