# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
PYTHON_COMPAT=( python3+ )
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.1
inherit kde5 python-single-r1

DESCRIPTION="Classical Mah Jongg for four players"
HOMEPAGE="https://apps.kde.org/en/kajongg"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}
	dev-db/sqlite:3
	$(add_qt_dep qtgui)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtwidgets)
	$(add_kdeapps_dep libkdegames)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep ki18n)
	$(python_gen_cond_dep '
		dev-python/PyQt5[gui,svg,widgets,${PYTHON_USEDEP}]
		>=dev-python/twisted-16.6.0[${PYTHON_USEDEP}]
	')
"
RDEPEND="${DEPEND}
	$(add_kdeapps_dep libkmahjongg)
"

pkg_setup() {
	python-single-r1_pkg_setup
	kde5_pkg_setup
}

src_prepare() {
	python_fix_shebang src
	kde5_src_prepare
}