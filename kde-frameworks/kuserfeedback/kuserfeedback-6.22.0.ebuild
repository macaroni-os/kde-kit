# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Framework to collect user feedback for applications via telemetry and surveys"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kuserfeedback-6.22.0.tar.xz -> kuserfeedback-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
IUSE="doc tools"
BDEPEND="virtual/yacc
	sys-devel/flex
	doc? ( dev-qt/qttools:6[assistant,qdoc,linguist] )
	
"
RDEPEND="virtual/kde-seed[gui,declarative,svg]
	dev-qt/qtcharts:6
	
"
DEPEND="${RDEPEND}
"
src_configure() {
	local mycmakeargs=(
	  # disable server application
	  -DENABLE_PHP=NO
	  -DENABLE_PHP_UNIT=NO
	  -DENABLE_SURVEY_TARGET_EXPRESSIONS=YES
	  -DENABLE_DOCS=$(usex doc)
	  -DENABLE_CONSOLE=$(usex tools)
	)
	cmake_src_configure
}


# vim: filetype=ebuild
