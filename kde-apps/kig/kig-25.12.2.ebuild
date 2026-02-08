# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
inherit kde6 python-single-r1 xdg

DESCRIPTION="KDE Interactive Geometry tool"
HOMEPAGE="https://apps.kde.org/kig/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kig-25.12.2.tar.xz -> kig-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="scripting"
RDEPEND="${PYTHON_DEPS}
	dev-qt/qtbase:6[gui]
	dev-qt/qtsvg:6
	kde-frameworks/karchive:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kparts:6
	kde-frameworks/kservice:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	scripting? (
	$(python_gen_cond_dep '
	>=dev-libs/boost-1.70:=[python,${PYTHON_USEDEP}]
	')
	)
	
"
DEPEND="${RDEPEND}
	${PYTHON_DEPS}
	dev-qt/qtbase:6[gui]
	dev-qt/qtsvg:6
	kde-frameworks/karchive:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kparts:6
	kde-frameworks/kservice:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	scripting? (
	$(python_gen_cond_dep '
	>=dev-libs/boost-1.70:=[python,${PYTHON_USEDEP}]
	')
	)
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
