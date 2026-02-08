# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
inherit kde6 python-single-r1 xdg

DESCRIPTION="Classical Mah Jongg for four players"
HOMEPAGE="https://apps.kde.org/kajongg/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kajongg-25.12.2.tar.xz -> kajongg-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="kde-apps/libkmahjongg:6
	
"
DEPEND="${RDEPEND}
	${PYTHON_DEPS}
	dev-db/sqlite:3
	dev-qt/qtbase:6[gui]
	dev-qt/qtsvg:6
	kde-apps/libkdegames:6
	kde-frameworks/ki18n:6
	|| ( dev-python/qtpy[pyqt6] dev-python/qtpy[pyside6] )
	$(python_gen_cond_dep '
	dev-python/qtpy[gui,svg,widgets,${PYTHON_USEDEP}]
	>=dev-python/twisted-16.6.0[${PYTHON_USEDEP}]
	')
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
