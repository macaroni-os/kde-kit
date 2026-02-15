# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Incidence editor for KOrganizer"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/incidenceeditor-25.12.2.tar.xz -> incidenceeditor-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui]
	dev-libs/kdiagram:6
	kde-apps/akonadi:6=
	kde-apps/akonadi-calendar:6=
	kde-apps/akonadi-contacts:6=
	kde-apps/akonadi-mime:6=
	kde-apps/calendarsupport:6=
	kde-apps/eventviews:6=
	kde-apps/kcalutils:6=
	kde-apps/kidentitymanagement:6=
	kde-apps/kldap:6=
	kde-apps/kmime:6=
	kde-apps/libkdepim:6=
	kde-apps/pimcommon:6=
	kde-frameworks/kcalendarcore:6
	kde-frameworks/kcodecs:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcontacts:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/kjobwidgets:6
	kde-frameworks/kservice:6
	kde-frameworks/ktextwidgets:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
