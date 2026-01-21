# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Framework providing an assortment of widgets for displaying and editing text"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/ktextwidgets-6.22.0.tar.xz -> ktextwidgets-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="speech"
RDEPEND="dev-qt/qtbase:6[gui]
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/sonnet:6
	speech? ( dev-qt/qtspeech:6 )
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      -DWITH_TEXT_TO_SPEECH=$(usex speech)
	  )
	   kde6_src_configure
}


# vim: filetype=ebuild
