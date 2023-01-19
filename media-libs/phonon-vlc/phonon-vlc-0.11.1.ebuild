# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="phonon-backend-vlc"
inherit kde5

DESCRIPTION="VLC backend for the Phonon multimedia library"
HOMEPAGE="https://community.kde.org/Phonon"
SRC_URI="mirror://kde/stable/phonon/${MY_PN}/${PV}/${MY_PN}-${PV}.tar.xz"

LICENSE="LGPL-2.1+ || ( LGPL-2.1 LGPL-3 )"
SLOT="0"
KEYWORDS="*"
IUSE="debug"

BDEPEND="
	$(add_qt_dep linguist-tools)
	virtual/pkgconfig
"
DEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	>=media-libs/phonon-4.10.60
	media-video/vlc:=[dbus,ogg,vorbis]
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_PN}-${PV}"
