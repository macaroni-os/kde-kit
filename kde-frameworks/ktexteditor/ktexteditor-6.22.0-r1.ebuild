# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Framework providing a full text editor component"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/ktexteditor-6.22.0.tar.xz -> ktexteditor-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="+editorconfig"
BDEPEND="test? ( kde-frameworks/kservice:6 )
	
"
RDEPEND="dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	dev-qt/qtspeech:6
	kde-frameworks/karchive:6
	kde-frameworks/kauth:6
	kde-frameworks/kcodecs:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kitemviews:6
	kde-frameworks/kjobwidgets:6
	kde-frameworks/kparts:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	kde-frameworks/sonnet:6
	kde-frameworks/syntax-highlighting:6
	editorconfig? ( app-text/editorconfig-core-c )
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      $(cmake_use_find_package editorconfig EditorConfig)
	  )
	   kde6_src_configure
}


# vim: filetype=ebuild
