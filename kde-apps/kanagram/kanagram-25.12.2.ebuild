# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Game based on anagrams of words"
HOMEPAGE="https://apps.kde.org/kanagram/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kanagram-25.12.2.tar.xz -> kanagram-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="speech"
RDEPEND="virtual/kde-seed[gui,declarative,multimedia]
	dev-qt/qtmultimedia:6[qml]
	speech? ( dev-qt/qtspeech:6 )
	kde-apps/kdeedu-data:*
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
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
