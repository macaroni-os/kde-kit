# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Job-based library to send email through an SMTP server"
HOMEPAGE="https://api.kde.org/kdepim/ksmtp/html/index.html"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/ksmtp-25.12.2.tar.xz -> ksmtp-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RESTRICT="test"
RDEPEND="dev-libs/cyrus-sasl
	dev-qt/qtbase:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
