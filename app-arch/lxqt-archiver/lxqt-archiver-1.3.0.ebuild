# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake xdg

DESCRIPTION="A simple & lightweight desktop-agnostic Qt file archiver"
HOMEPAGE="https://lxqt-project.org"
SRC_URI="https://api.github.com/repos/lxqt/lxqt-archiver/tarball/1.3.0 -> lxqt-archiver-1.3.0-eb4e23f.tar.gz"
LICENSE="GPL-2 GPL-2+"
SLOT="0"
KEYWORDS="*"
RDEPEND="dev-libs/glib:2
	dev-libs/json-glib
	dev-qt/qtbase:6[gui]
	x11-libs/libfm-qt
	
"
DEPEND="${RDEPEND}
	dev-util/lxqt-build-tools
	dev-qt/qttools:6[linguist]
	
"

src_prepare() {
	cmake_src_prepare
}

post_src_unpack() {
	mv lxqt-lxqt-archiver-* ${S}
}


pkg_postinst() {
	  xdg_desktop_database_update
	  xdg_icon_cache_update
	  elog "Please note that this is only a graphical front-end, and additional"
	  elog "packages are needed to have support for specific file formats."
	  elog "For example, to be able to work with the 7-Zip format, the"
	  elog "'app-arch/p7zip' package may be used."
	  elog "For the full list of supported formats, see the 'README.md' file:"
	  elog "https://github.com/lxqt/lxqt-archiver/blob/master/README.md"
}



# vim: filetype=ebuild
