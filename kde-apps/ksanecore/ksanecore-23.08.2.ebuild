# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="A library that provides a Qt interface for the SANE library for scanner hardware"
HOMEPAGE="https://invent.kde.org/libraries/ksanecore"

LICENSE="|| ( LGPL-2.1 LGPL-3 )"
SLOT="5"
KEYWORDS="~amd64 ~x86"

DEPEND="
	$(add_qt_dep qtgui)
	$(add_frameworks_dep ki18n)
	media-gfx/sane-backends
"
RDEPEND="${DEPEND}"
