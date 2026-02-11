# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Various text handling addons"
HOMEPAGE="https://invent.kde.org/libraries/ktextaddons"
SRC_URI="https://download.kde.org/stable/ktextaddons/ktextaddons-1.9.1.tar.xz -> ktextaddons-1.9.1.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
IUSE="speech"
RESTRICT="test"
RDEPEND=">=dev-libs/qtkeychain-0.15[qt6]
	dev-qt/qtbase:6[gui,sql]
	dev-qt/qtmultimedia:6
	kde-frameworks/karchive:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kitemviews:6
	kde-frameworks/kservice:6
	kde-frameworks/ktextwidgets:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/sonnet:6
	kde-frameworks/syntax-highlighting:6
	speech? ( dev-qt/qtspeech:6 )
	!dev-libs/ktextaddons:5
	
"
DEPEND="${DEPEND}
"
src_configure() {
	  local mycmakeargs=(
	      $(cmake_use_find_package speech Qt6TextToSpeech)
	      -DSPEAK_TO_TEXT_VOSK_PLUGIN=OFF
	      -DOPTION_ADD_AUTOGENERATETEXT=OFF
	  )
	  kde6_src_configure
}


# vim: filetype=ebuild
