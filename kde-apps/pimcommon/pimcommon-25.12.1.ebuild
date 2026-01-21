# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Common PIM libraries"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.1/src/pimcommon-25.12.1.tar.xz -> pimcommon-25.12.1.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="activities"
RDEPEND=">=dev-libs/ktextaddons-1.6.0:6
	dev-qt/qtbase:6[gui]
	kde-apps/akonadi:6=
	kde-apps/akonadi-contacts:6=
	kde-apps/akonadi-search:6=
	kde-apps/kimap:6=
	kde-apps/kldap:6=
	kde-apps/libkdepim:6=
	kde-frameworks/karchive:6
	kde-frameworks/kcmutils:6
	kde-frameworks/kcodecs:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcontacts:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/kjobwidgets:6
	kde-frameworks/knewstuff:6
	kde-frameworks/kservice:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	kde-frameworks/purpose:6
	activities? ( kde-plasma/plasma-activities:6 )
	
"
DEPEND="${RDEPEND}
	>=dev-libs/ktextaddons-1.6.0:6
	dev-qt/qtbase:6[gui]
	kde-apps/akonadi:6=
	kde-apps/akonadi-contacts:6=
	kde-apps/akonadi-search:6=
	kde-apps/kimap:6=
	kde-apps/kldap:6=
	kde-apps/libkdepim:6=
	kde-frameworks/karchive:6
	kde-frameworks/kcmutils:6
	kde-frameworks/kcodecs:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcontacts:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/kjobwidgets:6
	kde-frameworks/knewstuff:6
	kde-frameworks/kservice:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	kde-frameworks/purpose:6
	activities? ( kde-plasma/plasma-activities:6 )
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
