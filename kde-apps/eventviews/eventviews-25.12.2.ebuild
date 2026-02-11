# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Calendar viewer for KDE PIM"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/eventviews-25.12.2.tar.xz -> eventviews-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui]
	dev-libs/kdiagram:6
	dev-libs/libical
	kde-apps/akonadi:6=
	kde-apps/akonadi-calendar:6=
	kde-apps/calendarsupport:6=
	kde-apps/kcalutils:6=
	kde-apps/kmime:6=
	kde-apps/libkdepim:6=
	kde-frameworks/kcalendarcore:6
	kde-frameworks/kcodecs:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcontacts:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/kholidays:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/kservice:6
	kde-frameworks/kwidgetsaddons:6
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
