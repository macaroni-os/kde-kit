# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="KDE utility to translate DocBook XML files using gettext po files"

LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtxml)
	sys-devel/gettext
"
RDEPEND="${DEPEND}"
