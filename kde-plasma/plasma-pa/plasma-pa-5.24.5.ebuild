# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
FRAMEWORKS_MINIMAL=5.89.0
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="Plasma applet for audio volume management using PulseAudio"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	dev-libs/glib:2
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdeclarative)
	$(add_frameworks_dep kglobalaccel)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep plasma)
	media-libs/libcanberra
	media-sound/pulseaudio
"
RDEPEND="${DEPEND}
	$(add_qt_dep qtquickcontrols2)
	$(add_frameworks_dep kirigami)
	x11-themes/sound-theme-freedesktop
"

src_prepare() {
	kde5_src_prepare
	punt_bogus_dep Qt5 Widgets
}