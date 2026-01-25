# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Plasma applet for audio volume management using PulseAudio"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/plasma-pa-6.5.5.tar.xz -> plasma-pa-6.5.5.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
RESTRICT="test"
BDEPEND="kde-frameworks/kcmutils:6
	
"
RDEPEND="kde-frameworks/kirigami:6
	kde-frameworks/kitemmodels:6
	x11-themes/sound-theme-freedesktop
	
"
DEPEND="${RDEPEND}
	dev-libs/glib:2
	dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/kdeclarative:6
	kde-frameworks/kglobalaccel:6
	kde-frameworks/ki18n:6
	kde-frameworks/kstatusnotifieritem:6
	kde-frameworks/ksvg:6
	kde-plasma/libplasma:6
	media-libs/libcanberra
	>=media-libs/pulseaudio-qt-1.6.0:6
	media-sound/pulseaudio
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
