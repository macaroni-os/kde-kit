# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Qt wrapper around polkit-1 client libraries"
HOMEPAGE="https://api.kde.org/kdesupport-api/polkit-qt-1-apidocs/"
SRC_URI="https://download.kde.org/stable/polkit-qt-1/polkit-qt-1-0.200.0.tar.xz -> polkit-qt-1-0.200.0.tar.xz"
LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="*"
IUSE="qt5 +qt6"
REQUIRED_USE="|| ( qt5 qt6 )"
BDEPEND="virtual/pkgconfig
"
RDEPEND="dev-libs/glib:2
	>=sys-auth/polkit-0.103
	qt5? (
	  dev-qt/qtcore:5
	  dev-qt/qtdbus:5
	  dev-qt/qtgui:5
	  dev-qt/qtwidgets:5
	)
	qt6? ( dev-qt/qtbase:6[gui] )
	
"
DEPEND="${RDEPEND}
"
KMNAME="polkit-qt-1"
S="${WORKDIR}/${KMNAME}-${PV}"
DOCS=( AUTHORS README README.porting TODO )

src_configure() {
	local mycmakeargs=(
	  -DBUILD_EXAMPLES=OFF
	  -DQT_MAJOR_VERSION=$(usex qt6 6 5)
	)
	cmake_src_configure
}


# vim: filetype=ebuild
