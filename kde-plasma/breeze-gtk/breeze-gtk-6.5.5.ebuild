# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
inherit cmake python-any-r1

DESCRIPTION="Official GTK+ port of Plasma's Breeze widget style"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/breeze-gtk-6.5.5.tar.xz -> breeze-gtk-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
BDEPEND="${PYTHON_DEPS}
	dev-lang/sassc
	$(python_gen_any_dep 'dev-python/pycairo[${PYTHON_USEDEP}]')
	kde-plasma/breeze:6
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
