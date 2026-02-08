# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Library for interacting with IMAP servers"
HOMEPAGE="https://api.kde.org/kdepim/kimap/html/index.html"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kimap-25.12.2.tar.xz -> kimap-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="dev-libs/cyrus-sasl
	dev-qt/qtbase:6[gui]
	kde-apps/kmime:6=
	kde-frameworks/kcodecs:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	
"
DEPEND="${RDEPEND}
	dev-libs/cyrus-sasl
	dev-qt/qtbase:6[gui]
	kde-apps/kmime:6=
	kde-frameworks/kcodecs:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
