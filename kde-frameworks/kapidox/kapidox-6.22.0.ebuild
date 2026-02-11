# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Framework for building KDE API documentation in a standard format and style"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kapidox-6.22.0.tar.xz -> kapidox-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed
	app-doc/doxygen
	$(python_gen_cond_dep '
	    dev-python/jinja[${PYTHON_USEDEP}]
	    dev-python/pyyaml[${PYTHON_USEDEP}]
	')
	media-gfx/graphviz[python,${PYTHON_SINGLE_USEDEP}]
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
