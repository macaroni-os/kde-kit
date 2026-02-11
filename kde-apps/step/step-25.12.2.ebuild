# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Interactive physics simulator"
HOMEPAGE="https://apps.kde.org/step/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/step-25.12.2.tar.xz -> step-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="+gsl +qalculate"
BDEPEND="dev-qt/qttools:6[linguist]
	
"
RDEPEND="virtual/kde-seed[gui,svg]
	>=dev-cpp/eigen-3.2:3
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/knewstuff:6
	kde-frameworks/kparts:6
	kde-frameworks/kplotting:6
	kde-frameworks/ktextwidgets:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	sci-libs/cln
	gsl? ( sci-libs/gsl:= )
	qalculate? ( >=sci-libs/libqalculate-0.9.5:= )
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
