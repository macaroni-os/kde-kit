# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Integrate Chrome/Firefox better into Plasma through browser extensions"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/plasma-browser-integration-6.5.5.tar.xz -> plasma-browser-integration-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6[gui]
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/kfilemetadata:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kjobwidgets:6
	kde-frameworks/knotifications:6
	kde-frameworks/krunner:6
	kde-frameworks/kservice:6
	kde-frameworks/kstatusnotifieritem:6
	kde-frameworks/purpose:6
	kde-plasma/plasma-activities:6
	kde-plasma/plasma-workspace:6
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      -DMOZILLA_DIR="${EPREFIX}/usr/$(get_libdir)/mozilla"
	  )
	  kde6_src_configure
}


# vim: filetype=ebuild
