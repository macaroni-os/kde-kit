# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Framework to collect user feedback for applications via telemetry and surveys"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kuserfeedback-6.22.0.tar.xz -> kuserfeedback-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="doc tools"
BDEPEND="app-alternatives/lex
	app-alternatives/yacc
	doc? ( dev-qt/qttools:6[assistant,qdoc,linguist] )
	
"
RDEPEND="!kde-frameworks/kuserfeedback:5[-kf6compat(-)]
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gui]
	dev-qt/qtcharts:6
	dev-qt/qtdeclarative:6
	dev-qt/qtsvg:6
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      # disable server application
	      -DENABLE_PHP=NO
	      -DENABLE_PHP_UNIT=NO
	      -DENABLE_SURVEY_TARGET_EXPRESSIONS=YES
	      -DENABLE_DOCS=$(usex doc)
	      -DENABLE_CONSOLE=$(usex tools)
	  )
	   kde6_src_configure
}

CMAKE_SKIP_TESTS=(
	  # bugs: 921359, requires virtualx
	  openglinfosourcetest
)


# vim: filetype=ebuild
