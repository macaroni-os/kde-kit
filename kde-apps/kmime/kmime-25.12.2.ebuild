# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Libary for handling mail messages and newsgroup articles"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kmime-25.12.2.tar.xz -> kmime-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="kde-frameworks/kcodecs:6
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
