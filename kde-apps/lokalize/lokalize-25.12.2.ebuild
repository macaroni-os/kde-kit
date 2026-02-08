# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Localization tool for KDE software and other free and open source software"
HOMEPAGE="https://apps.kde.org/lokalize/ https://l10n.kde.org/tools/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/lokalize-25.12.2.tar.xz -> lokalize-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND=">=app-text/hunspell-1.2.8:=
	dev-qt/qtbase:6[gui,sql]
	kde-frameworks/kcompletion:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kitemviews:6
	kde-frameworks/knotifications:6
	kde-frameworks/kparts:6
	kde-frameworks/ktextwidgets:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	kde-frameworks/sonnet:6
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
