# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
inherit kde5 python-any-r1

DESCRIPTION="Official GTK+ port of Plasma's Breeze widget style"
HOMEPAGE="https://invent.kde.org/plasma/breeze-gtk"
LICENSE="LGPL-2.1+"
SLOT="5"
KEYWORDS="*"
IUSE=""

BDEPEND="${PYTHON_DEPS}
	dev-lang/sassc
	>=dev-util/cmake-3.16
	$(python_gen_any_dep 'dev-python/pycairo[${PYTHON_USEDEP}]')
	$(add_plasma_dep breeze)
"

python_check_deps() {
	has_version "dev-python/pycairo[${PYTHON_USEDEP}]"
}

pkg_setup() {
	python-any-r1_pkg_setup
	kde5_pkg_setup
}

src_configure() {
	local mycmakeargs=(
		-DPython3_EXECUTABLE="${PYTHON}"
	)
	kde5_src_configure
}