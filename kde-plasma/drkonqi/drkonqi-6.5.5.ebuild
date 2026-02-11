# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
inherit cmake python-single-r1 xdg

DESCRIPTION="Plasma crash handler, gives the user feedback if a program crashed"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/drkonqi-6.5.5.tar.xz -> drkonqi-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
BDEPEND="${PYTHON_DEPS}
	
"
RDEPEND="virtual/kde-seed[gui,declarative]
	dev-libs/elfutils[utils]
	kde-frameworks/kirigami:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/ki18n:6
	kde-frameworks/kidletime:6
	kde-frameworks/kio:6
	kde-frameworks/kjobwidgets:6
	kde-frameworks/knotifications:6
	kde-frameworks/kservice:6
	kde-frameworks/kstatusnotifieritem:6
	kde-frameworks/kwallet:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6
	kde-frameworks/syntax-highlighting:6
	sys-apps/systemd:=
	>=sys-auth/polkit-qt-0.175.0[qt6(+)]
	$(python_gen_cond_dep '
	    dev-python/psutil[${PYTHON_USEDEP}]
	    dev-python/pygdbmi[${PYTHON_USEDEP}]
	')
	|| (
	    sys-devel/gdb
	    dev-util/lldb
	)
	
"
DEPEND="${RDEPEND}
"
src_prepare() {
	cmake_src_prepare
}
src_configure() {
	local mycmakeargs=(
	  -DWITH_PYTHON_VENDORING=OFF
	)
	cmake_src_configure
}


# vim: filetype=ebuild
