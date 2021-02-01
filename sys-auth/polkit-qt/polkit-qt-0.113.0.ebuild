# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_ORG_NAME="polkit-qt-1"
inherit kde5

DESCRIPTION="Qt wrapper around polkit-1 client libraries"
HOMEPAGE="https://api.kde.org/kdesupport-api/polkit-qt-1-apidocs/"
SRC_URI="mirror://kde/stable/${KDE_ORG_NAME}/${KDE_ORG_NAME}-${PV}.tar.xz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="*"
IUSE="debug"

RDEPEND="
	dev-libs/glib:2
	$(add_qt_dep qtcore)
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	>=sys-auth/polkit-0.103
"
DEPEND="${RDEPEND}"

DOCS=( AUTHORS README README.porting TODO )

S="${WORKDIR}/${KDE_ORG_NAME}-${PV}"

src_configure() {
	local mycmakeargs=(
		-DBUILD_EXAMPLES=OFF
	)

	cmake_src_configure
}
