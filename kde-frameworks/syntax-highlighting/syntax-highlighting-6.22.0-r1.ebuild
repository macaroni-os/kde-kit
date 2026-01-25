# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Framework for syntax highlighting"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/syntax-highlighting-6.22.0.tar.xz -> syntax-highlighting-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
BDEPEND="dev-lang/perl
	dev-qt/qttools:6[linguist]
	
"
RDEPEND="dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	
"
DEPEND="${RDEPEND}
	dev-libs/xerces-c
	
"

# vim: filetype=ebuild
