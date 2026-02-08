# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Powerful flashcard and vocabulary learning program"
HOMEPAGE="https://apps.kde.org/kwordquiz/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kwordquiz-25.12.2.tar.xz -> kwordquiz-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND=">=dev-libs/kirigami-addons-0.9.0:6
	dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	dev-qt/qtmultimedia:6[qml]
	dev-qt/qtsvg:6
	kde-apps/libkeduvocdocument:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kirigami:6
	kde-frameworks/knewstuff:6
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
