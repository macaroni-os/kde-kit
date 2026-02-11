# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Core components for KDE Activities System"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/plasma-activities-6.5.5.tar.xz -> plasma-activities-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui,declarative,sql]
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	dev-libs/boost
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
