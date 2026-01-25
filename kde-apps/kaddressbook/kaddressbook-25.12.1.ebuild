# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Address book application based on KDE Frameworks"
HOMEPAGE="https://apps.kde.org/kaddressbook/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.1/src/kaddressbook-25.12.1.tar.xz -> kaddressbook-25.12.1.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="activities telemetry"
RDEPEND="=kde-apps/kdepim-runtime*:6
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gui]
	kde-apps/akonadi:6=
	kde-apps/akonadi-contacts:6=
	kde-apps/akonadi-search:6=
	kde-apps/grantleetheme:6=
	kde-apps/kldap:6=
	kde-apps/kontactinterface:6=
	kde-apps/libgravatar:6=
	kde-apps/libkdepim:6=
	kde-apps/pimcommon:6=
	kde-frameworks/kcmutils:6
	kde-frameworks/kcodecs:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcontacts:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/kjobwidgets:6
	kde-frameworks/kparts:6
	kde-frameworks/kservice:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	activities? ( kde-plasma/plasma-activities:6 )
	telemetry? ( kde-frameworks/kuserfeedback:6 )
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
