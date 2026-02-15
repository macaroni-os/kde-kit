# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
inherit python-single-r1 xdg

DESCRIPTION="Classical Mah Jongg for four players"
HOMEPAGE="https://apps.kde.org/kajongg/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kajongg-25.12.2.tar.xz -> kajongg-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
# Commons depends
CDEPEND="virtual/kde-seed[gui,svg]
	dev-db/sqlite:3
	kde-apps/libkdegames:6
	kde-frameworks/ki18n:6
	${PYTHON_DEPS}
	|| ( dev-python/qtpy[pyqt6] dev-python/qtpy[pyside6] )
	$(python_gen_cond_dep '
	  dev-python/qtpy[gui,svg,widgets,${PYTHON_USEDEP}]
	  >=dev-python/twisted-16.6.0[${PYTHON_USEDEP}]
	')
	
"
RDEPEND="${CDEPEND}
	kde-apps/libkmahjongg:6
	
"
DEPEND="${CDEPEND}
"

# vim: filetype=ebuild
