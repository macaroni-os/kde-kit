# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Application to take pictures and videos from your webcam"
HOMEPAGE="https://apps.kde.org/kamoso/ https://userbase.kde.org/Kamoso"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kamoso-25.12.2.tar.xz -> kamoso-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
BDEPEND="virtual/pkgconfig
	
"
RDEPEND="kde-frameworks/kirigami:6
	media-plugins/gst-plugins-jpeg:1.0
	media-plugins/gst-plugins-libpng:1.0
	media-plugins/gst-plugins-meta:1.0[alsa,theora,vorbis,v4l]
	media-plugins/gst-plugins-qt6:1.0
	
"
DEPEND="${RDEPEND}
	dev-libs/glib:2
	dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kitemviews:6
	kde-frameworks/knotifications:6
	kde-frameworks/purpose:6
	media-libs/gst-plugins-base:1.0
	virtual/opengl
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
