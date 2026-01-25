# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
inherit cmake kde6 python-any-r1 xdg

DESCRIPTION="Breeze SVG icon theme"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/breeze-icons-6.22.0.tar.xz -> breeze-icons-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
BDEPEND="${PYTHON_DEPS}
	$(python_gen_any_dep 'dev-python/lxml[${PYTHON_USEDEP}]')
	dev-qt/qtbase:6[gui]
	kde-frameworks/extra-cmake-modules:*
	test? ( app-misc/fdupes )
	
"
RDEPEND="!kde-frameworks/breeze-icons:5
	!kde-frameworks/breeze-icons-rcc:5
	!kde-frameworks/breeze-icons-rcc:6
	
"
python_check_deps() {
	  python_has_version "dev-python/lxml[${PYTHON_USEDEP}]"
}

src_prepare() {
	  cmake_src_prepare
}
src_configure() {
	  local mycmakeargs=(
	      -DPython_EXECUTABLE="${PYTHON}"
	      -DBINARY_ICONS_RESOURCE=ON # TODO: remove when kexi was ported away
	      -DSKIP_INSTALL_ICONS=OFF
	  )
	  cmake_src_configure
}

src_install() {
	  cmake_src_install
	  # bug 770988
	  find "${ED}"/usr/share/icons/ -type d -empty -delete || die
	  find "${ED}"/usr/share/icons/ -xtype l -delete || die
}


# vim: filetype=ebuild
