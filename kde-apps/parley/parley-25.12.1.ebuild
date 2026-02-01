# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Vocabulary trainer to help you memorize things"
HOMEPAGE="https://apps.kde.org/parley/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.1/src/parley-25.12.1.tar.xz -> parley-25.12.1.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="webengine"
RDEPEND="kde-apps/kdeedu-data:*
	
"
DEPEND="${RDEPEND}
	app-i18n/translate-shell
	dev-libs/libxml2:2=
	dev-libs/libxslt
	dev-qt/qtbase:6[gui]
	dev-qt/qtmultimedia:6
	dev-qt/qtsvg:6
	kde-apps/libkeduvocdocument:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/knewstuff:6
	kde-frameworks/knotifications:6
	kde-frameworks/kservice:6
	kde-frameworks/ktextwidgets:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	kde-frameworks/sonnet:6
	webengine? ( dev-qt/qtwebengine:6 )
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
