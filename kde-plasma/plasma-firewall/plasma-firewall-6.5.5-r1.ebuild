# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
inherit kde6 python-single-r1 xdg

DESCRIPTION="Plasma frontend for Firewalld or UFW"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/plasma-firewall-6.5.5.tar.xz -> plasma-firewall-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="firewalld ufw"
BDEPEND="kde-frameworks/kcmutils:6
	
"
RDEPEND="firewalld? ( net-firewall/firewalld )
	ufw? ( net-firewall/ufw )
	
"
DEPEND="${RDEPEND}
	${PYTHON_DEPS}
	dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	kde-frameworks/kcmutils:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-plasma/libplasma:6
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      $(cmake_use_find_package firewalld PythonModuleFirewall)
	      $(cmake_use_find_package ufw PythonModuleUfw)
	  )
	  kde6_src_configure
}


# vim: filetype=ebuild
