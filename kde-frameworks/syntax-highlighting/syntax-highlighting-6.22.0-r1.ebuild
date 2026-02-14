# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Framework for syntax highlighting"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/syntax-highlighting-6.22.0.tar.xz -> syntax-highlighting-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
BDEPEND="dev-lang/perl
	dev-qt/qttools:6[linguist]
	
"
RDEPEND="virtual/kde-seed[gui,declarative]
	dev-libs/xerces-c
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
