# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Periodic table of the elements"
HOMEPAGE="https://apps.kde.org/kalzium/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kalzium-25.12.2.tar.xz -> kalzium-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="solver"
RDEPEND="virtual/kde-seed[gui,declarative,svg]
	dev-qt/qt5compat:6
	dev-qt/qtscxml:6
	sci-chemistry/chemical-mime-data
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kitemviews:6
	kde-frameworks/kplotting:6
	kde-frameworks/ktextwidgets:6
	kde-frameworks/kunitconversion:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	solver? ( dev-ml/facile:=[ocamlopt] )
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
