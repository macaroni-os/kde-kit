# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Calendar support library"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.1/src/calendarsupport-25.12.1.tar.xz -> calendarsupport-25.12.1.tar.xz"
SLOT="6"
KEYWORDS="*"
RESTRICT="test"
RDEPEND="dev-qt/qtbase:6[gui]
	kde-apps/akonadi:6=
	kde-apps/akonadi-calendar:6=
	kde-apps/akonadi-mime:6=
	kde-apps/kidentitymanagement:6=
	kde-apps/kmime:6=
	kde-apps/pimcommon:6=
	kde-frameworks/kcalendarcore:6
	kde-frameworks/kcodecs:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/kholidays:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kwidgetsaddons:6
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
