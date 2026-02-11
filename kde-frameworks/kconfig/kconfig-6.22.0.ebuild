# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Framework for reading and writing configuration"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kconfig-6.22.0.tar.xz -> kconfig-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
IUSE="dbus qml"
BDEPEND="dev-qt/qttools:6[linguist]
	
"
RDEPEND="virtual/kde-seed[gui]
	dbus? ( sys-apps/dbus )
	qml? ( dev-qt/qtdeclarative:6 )
	
"
DEPEND="${RDEPEND}
"
src_configure() {
	local mycmakeargs=(
	  -DUSE_DBUS=$(usex dbus)
	  -DKCONFIG_USE_QML=$(usex qml)
	)
	cmake_src_configure
}


# vim: filetype=ebuild
