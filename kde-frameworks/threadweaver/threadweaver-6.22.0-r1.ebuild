# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Framework for managing threads using job and queue-based interfaces"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/threadweaver-6.22.0.tar.xz -> threadweaver-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed
	
"
DEPEND="${RDEPEND}
"
src_prepare() {
	  cmake_comment_add_subdirectory benchmarks
	  cmake_src_prepare
}


# vim: filetype=ebuild
