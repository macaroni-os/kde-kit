# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Game based on anagrams of words"
HOMEPAGE="https://apps.kde.org/kanagram/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.1/src/kanagram-25.12.1.tar.xz -> kanagram-25.12.1.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="speech"
RDEPEND="dev-qt/qtmultimedia:6[qml]
	kde-apps/kdeedu-data:*
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	kde-apps/libkeduvocdocument:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/knewstuff:6
	kde-frameworks/kxmlgui:6
	kde-frameworks/sonnet:6
	speech? ( dev-qt/qtspeech:6 )
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
