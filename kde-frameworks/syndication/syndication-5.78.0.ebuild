# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="true"
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Library for parsing RSS and Atom feeds"

LICENSE="LGPL-2+"
KEYWORDS="*"
IUSE=""

RDEPEND="
	$(add_qt_dep qtxml)
	$(add_frameworks_dep kcodecs)
"
DEPEND="${RDEPEND}
	test? (
		$(add_qt_dep qtnetwork)
		$(add_qt_dep qtwidgets)
	)
"
