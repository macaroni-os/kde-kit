# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_EXAMPLES="true"
KDE_QTHELP="false"
KDE_TEST="true"
KMNAME="${PN}2"
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Lightweight user interface framework for mobile and convergent applications"
HOMEPAGE="https://techbase.kde.org/Kirigami"

LICENSE="LGPL-2+"
KEYWORDS="*"
IUSE=""

BDEPEND="
	$(add_qt_dep linguist-tools)
"
DEPEND="
	$(add_qt_dep qtconcurrent)
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtquickcontrols2)
	$(add_qt_dep qtsvg)
"
RDEPEND="${DEPEND}
	$(add_qt_dep qtgraphicaleffects)
"

# requires package to already be installed
RESTRICT+=" test"

src_configure() {
	local mycmakeargs=(
		-DBUILD_EXAMPLES=$(usex examples)
	)

	kde5_src_configure
}