# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.74.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="QtQuick components providing basic image editing capabilities"
HOMEPAGE="https://invent.kde.org/libraries/kquickimageeditor
https://api.kde.org/kquickimageeditor/html/index.html"
SRC_URI="mirror://kde/stable/${PN}/$(ver_cut 1-2)/${P}.tar.xz"

LICENSE="LGPL-2.1+"
SLOT="5"
KEYWORDS="*"

PATCHES=( "${FILESDIR}"/${PN}-0.1.2-no-werror.patch )

DEPEND="
	$(add_qt_dep qtdeclarative)
"
RDEPEND="${DEPEND}
	$(add_frameworks_dep kirigami)
"
