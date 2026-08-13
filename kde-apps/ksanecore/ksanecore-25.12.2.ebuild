# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Qt-based interface for SANE library to control scanner hardware"
HOMEPAGE="https://invent.kde.org/libraries/ksanecore"
SRC_URI="https://download.kde.org/Attic//release-service/25.12.2/src/ksanecore-25.12.2.tar.xz -> ksanecore-25.12.2.tar.xz"
LICENSE="|| ( LGPL-2.1 LGPL-3 )"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui]
	kde-frameworks/ki18n:6
	media-gfx/sane-backends
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
