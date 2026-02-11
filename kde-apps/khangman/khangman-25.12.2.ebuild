# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Classical hangman game by KDE"
HOMEPAGE="https://apps.kde.org/khangman/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/khangman-25.12.2.tar.xz -> khangman-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui,declarative,svg,multimedia]
	dev-qt/qt5compat:6[qml]
	dev-qt/qtmultimedia:6[qml]
	dev-qt/qtdeclarative:6[widgets]
	dev-libs/kirigami-addons:6
	kde-apps/kdeedu-data:*
	kde-frameworks/kirigami:6
	kde-apps/libkeduvocdocument:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/ki18n:6
	kde-frameworks/knewstuff:6
	kde-frameworks/knotifications:6
	kde-frameworks/kwidgetsaddons:6
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
