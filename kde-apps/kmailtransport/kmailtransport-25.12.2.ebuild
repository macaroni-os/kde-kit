# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Mail transport service"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kmailtransport-25.12.2.tar.xz -> kmailtransport-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RESTRICT="test"
RDEPEND=">=dev-libs/qtkeychain-0.14.2:=[qt6(+)]
	dev-qt/qtbase:6[gui]
	kde-apps/ksmtp:6=
	kde-apps/libkgapi:6=
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kwidgetsaddons:6
	
"
DEPEND="${RDEPEND}
	>=dev-libs/qtkeychain-0.14.2:=[qt6(+)]
	dev-qt/qtbase:6[gui]
	kde-apps/ksmtp:6=
	kde-apps/libkgapi:6=
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kwidgetsaddons:6
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
