# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Visualise disk usage with interactive map of concentric, segmented rings"
HOMEPAGE="https://apps.kde.org/filelight/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.1/src/filelight-25.12.1.tar.xz -> filelight-25.12.1.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="kde-frameworks/kirigami:6
	kde-frameworks/qqc2-desktop-style:6
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6[qml]
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcrash:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kservice:6
	kde-frameworks/kwidgetsaddons:6
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
