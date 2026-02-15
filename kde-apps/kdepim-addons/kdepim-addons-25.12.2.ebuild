# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Plugins for KDE Personal Information Management Suite"
HOMEPAGE="https://apps.kde.org/kontact/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kdepim-addons-25.12.2.tar.xz -> kdepim-addons-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="activities importwizard markdown"
RDEPEND="virtual/kde-seed[gui]
	dev-qt/qtwebengine:6
	dev-cpp/gpgmepp:=
	dev-libs/qgpgme:=
	>=dev-libs/ktextaddons-1.6.0:6
	kde-apps/akonadi:6=
	kde-apps/akonadi-calendar:6=
	kde-apps/akonadi-contacts:6=
	kde-apps/calendarsupport:6=
	kde-apps/grantleetheme:6=
	kde-apps/incidenceeditor:6=
	kde-apps/kaddressbook:6
	kde-apps/kcalutils:6=
	kde-apps/kidentitymanagement:6=
	kde-apps/kimap:6=
	kde-apps/kitinerary:6=
	kde-apps/kldap:6=
	kde-apps/kmailtransport:6=
	kde-apps/kmime:6=
	kde-apps/kpimtextedit:6=
	kde-apps/kpkpass:6=
	kde-apps/libgravatar:6=
	kde-apps/libkdepim:6=
	kde-apps/libkleo:6=
	kde-apps/libksieve:6=
	kde-apps/libktnef:6=
	kde-apps/mailcommon:6=
	kde-apps/mailimporter:6=
	kde-apps/messagelib:6=
	kde-apps/pimcommon:6=[activities?]
	kde-frameworks/kcalendarcore:6
	kde-frameworks/kcmutils:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcontacts:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/kdeclarative:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/kholidays:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kparts:6
	kde-frameworks/ktexttemplate:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	kde-frameworks/prison:6
	kde-frameworks/syntax-highlighting:6
	activities? ( >=kde-plasma/plasma-activities-6.3.0:6 )
	importwizard? ( kde-apps/akonadi-import-wizard:6= )
	markdown? ( app-text/discount:= )
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
