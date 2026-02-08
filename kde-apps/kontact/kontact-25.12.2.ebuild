# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Container application to unify several major PIM applications within one"
HOMEPAGE="https://kontact.kde.org/ https://apps.kde.org/kontact/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kontact-25.12.2.tar.xz -> kontact-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="kde-apps/kmail:6
	kde-apps/kmail-account-wizard:6
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gui]
	dev-qt/qtwebengine
	kde-apps/grantleetheme:6=
	kde-apps/kontactinterface:6=
	kde-apps/libkdepim:6=
	kde-apps/mailcommon:6=
	kde-apps/pimcommon:6=
	kde-frameworks/kcmutils:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kparts:6
	kde-frameworks/kservice:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
