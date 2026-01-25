# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Framework for managing threads using job and queue-based interfaces"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/threadweaver-6.22.0.tar.xz -> threadweaver-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
src_prepare() {
	  cmake_comment_add_subdirectory benchmarks
	  kde6_src_prepare
}


# vim: filetype=ebuild
