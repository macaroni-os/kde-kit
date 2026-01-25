# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Application for debugging Akonadi Resources"
HOMEPAGE="https://techbase.kde.org/KDE_PIM/Akonadi/Development_Tools"
SRC_URI="https://download.kde.org/stable/release-service/25.12.1/src/akonadiconsole-25.12.1.tar.xz -> akonadiconsole-25.12.1.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="dev-libs/xapian:=
	dev-qt/qtbase:6[gui,sql]
	kde-apps/akonadi:6=
	kde-apps/akonadi-contacts:6=
	kde-apps/akonadi-mime:6=
	kde-apps/akonadi-search:6=
	kde-apps/calendarsupport:6=
	kde-apps/kmime:6=
	kde-apps/libkdepim:6=
	kde-apps/messagelib:6=
	kde-frameworks/kcalendarcore:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcontacts:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/kio:6
	kde-frameworks/ki18n:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/kitemviews:6
	kde-frameworks/ktextwidgets:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
