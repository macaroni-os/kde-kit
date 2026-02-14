# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Library for accessing the usage data collected by the activities system"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/plasma-activities-stats-6.5.5.tar.xz -> plasma-activities-stats-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[sql]
	kde-frameworks/kconfig:6
	kde-plasma/plasma-activities:6
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
