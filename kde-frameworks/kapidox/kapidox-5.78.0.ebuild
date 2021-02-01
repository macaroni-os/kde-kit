# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_SINGLE_IMPL="true"
DISTUTILS_USE_SETUPTOOLS="bdepend"
PYTHON_COMPAT=( python3+ )
inherit kde5 distutils-r1

DESCRIPTION="Framework for building KDE API documentation in a standard format and style"
LICENSE="BSD-2"
KEYWORDS="*"
IUSE=""

RDEPEND="
	app-doc/doxygen
	$(python_gen_cond_dep '
		dev-python/jinja[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
	')
	media-gfx/graphviz[python,${PYTHON_SINGLE_USEDEP}]
"
