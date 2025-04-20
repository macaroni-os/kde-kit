# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="LXQt Menu Files and Translations for Menu Categories"
HOMEPAGE="https://lxqt-project.org/"

SRC_URI="https://github.com/lxqt/lxqt-menu-data/releases/download/1.4.1/lxqt-menu-data-1.4.1.tar.xz -> lxqt-menu-data-1.4.1.tar.xz"
KEYWORDS="*"

LICENSE="LGPL-2.1"
SLOT="0"

BDEPEND="
	dev-util/lxqt-build-tools
	>=dev-qt/linguist-tools-5.15:5
"
# These following blockers are to prevent conflicts with old files
# from 1.3.x that are now in this 1.4.x ebuild:
RDEPEND="
	!<lxqt-base/lxqt-config-1.4
	!<lxqt-base/lxqt-panel-1.4
"