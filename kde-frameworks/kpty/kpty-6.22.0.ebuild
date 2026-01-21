# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Framework for pseudo terminal devices and running child processes"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kpty-6.22.0.tar.xz -> kpty-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	sys-libs/libutempter
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      -DUTEMPTER_EXECUTABLE="${EPREFIX}/usr/sbin/utempter"
	  )
	   kde6_src_configure
}


# vim: filetype=ebuild
