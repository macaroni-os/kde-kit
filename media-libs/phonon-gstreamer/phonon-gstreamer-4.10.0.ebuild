# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="phonon-backend-gstreamer"
inherit kde5

DESCRIPTION="GStreamer backend for the Phonon multimedia library"
HOMEPAGE="https://community.kde.org/Phonon"
SRC_URI="mirror://kde/stable/phonon/${MY_PN}/${PV}/${MY_PN}-${PV}.tar.xz"

LICENSE="LGPL-2.1+ || ( LGPL-2.1 LGPL-3 )"
SLOT="0"
KEYWORDS="*"
IUSE="alsa debug +network"

BDEPEND="
	$(add_qt_dep linguist-tools)
	virtual/pkgconfig
"
DEPEND="
	dev-libs/glib:2
	dev-libs/libxml2:2
	$(add_qt_dep qtgui)
	$(add_qt_dep qtopengl)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtx11extras)
	media-libs/gst-plugins-base:1.0
	media-libs/gstreamer:1.0
	>=media-libs/phonon-4.10.60
	media-plugins/gst-plugins-meta:1.0[alsa?,ogg,vorbis]
	virtual/opengl
"
RDEPEND="${DEPEND}
	network? ( media-plugins/gst-plugins-soup:1.0 )
"

S="${WORKDIR}/${MY_PN}-${PV}"
