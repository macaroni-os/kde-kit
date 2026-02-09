# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Shell script to create the necessary framework to develop KDE applications"
HOMEPAGE="https://apps.kde.org/kapptemplate/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kapptemplate-25.12.2.tar.xz -> kapptemplate-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui,declarative]
	>=dev-libs/kirigami-addons-1.4.0:6
	kde-frameworks/karchive:6
	kde-frameworks/kconfig:6
	kde-frameworks/kirigami:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kwidgetsaddons:6
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
