# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Framework for reading and writing configuration"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kconfig-6.22.0.tar.xz -> kconfig-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="dbus qml"
REQUIRED_USE="test? ( qml )"
BDEPEND="dev-qt/qttools:6[linguist]
	
"
RDEPEND="dev-qt/qtbase:6[gui]
	qml? ( dev-qt/qtdeclarative:6 )
	
"
DEPEND="${RDEPEND}
	test? ( dev-qt/qtbase:6 )
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      -DUSE_DBUS=$(usex dbus)
	      -DKCONFIG_USE_QML=$(usex qml)
	  )
	  kde6_src_configure
}


# vim: filetype=ebuild
