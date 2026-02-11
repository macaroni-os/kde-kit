# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Libraries for messaging functions"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/mimetreeparser-25.12.2.tar.xz -> mimetreeparser-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui,declarative]
	dev-cpp/gpgmepp:=
	dev-libs/qgpgme:=
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

# vim: filetype=ebuild
