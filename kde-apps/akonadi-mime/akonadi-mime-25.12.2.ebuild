# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Library for akonadi mime types"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/akonadi-mime-25.12.2.tar.xz -> akonadi-mime-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui]
	kde-apps/akonadi:6=
	kde-apps/kmime:6=
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/kxmlgui:6
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
