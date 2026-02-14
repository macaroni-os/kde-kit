# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
inherit cmake python-single-r1

DESCRIPTION="Framework based on Gettext for internationalizing user interface text"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/ki18n-6.22.0.tar.xz -> ki18n-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
BDEPEND="${PYTHON_DEPS}
	sys-devel/gettext
	virtual/libintl
	
"
RDEPEND="virtual/kde-seed[declarative]
	app-text/iso-codes
	
"
DEPEND="${RDEPEND}
"
src_prepare() {
	cmake_src_prepare
}
src_configure() {
	local mycmakeargs=(
	  -DPython3_EXECUTABLE="${PYTHON}"
	  -DBUILD_WITH_QML=TRUE
	)
	cmake_src_configure
}


# vim: filetype=ebuild
