# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Classical hangman game by KDE"
HOMEPAGE="https://apps.kde.org/khangman/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/khangman-25.12.2.tar.xz -> khangman-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="dev-libs/kirigami-addons:6
	dev-qt/qt5compat:6[qml]
	dev-qt/qtmultimedia:6[qml]
	kde-apps/kdeedu-data:*
	kde-frameworks/kirigami:6
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6[widgets]
	dev-qt/qtsvg:6
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
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
