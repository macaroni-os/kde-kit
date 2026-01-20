# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Libraries for messaging functions"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.1/src/mimetreeparser-25.12.1.tar.xz -> mimetreeparser-25.12.1.tar.xz"
SLOT="6"
KEYWORDS="*"
RESTRICT="test"
RDEPEND="dev-cpp/gpgmepp:=
	dev-libs/qgpgme:=
	dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	kde-apps/kmbox:6=
	kde-apps/kmime:6=
	kde-apps/libkleo:6=
	kde-frameworks/kcalendarcore:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/ki18n:6
	kde-frameworks/kwidgetsaddons:6
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
