# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Manage CUPS print jobs and printers in Plasma"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/print-manager-6.5.5.tar.xz -> print-manager-6.5.5.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
IUSE="+gtk"
BDEPEND="kde-frameworks/kcmutils:6
	
"
RDEPEND="!<kde-plasma/print-manager-23.08.5-r100:5
	kde-frameworks/kdeclarative:6
	gtk? ( app-admin/system-config-printer )
	
"
DEPEND="${RDEPEND}
	dev-qt/qt5compat:6
	dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	kde-frameworks/kcmutils:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kirigami:6
	kde-frameworks/knotifications:6
	kde-frameworks/kservice:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6
	kde-plasma/libplasma:6
	>=net-print/cups-2.4
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      -DCMAKE_DISABLE_FIND_PACKAGE_PackageKitQt6=ON # not packaged
	  )
	   kde6_src_configure
}

pkg_postinst() {
	  xdg_pkg_postinst
	   if [[ -z "${REPLACING_VERSIONS}" ]] && ! use gtk ; then
	      ewarn "By switching off \"gtk\" USE flag, you have chosen to do without"
	      ewarn "an important, though optional, runtime dependency:"
	      ewarn
	      ewarn "app-admin/system-config-printer"
	      ewarn
	      ewarn "${PN} will work nevertheless, but is going to be less comfortable"
	      ewarn "and will show the following error status during runtime:"
	      ewarn
	      ewarn "\"Failed to group devices: 'The name org.fedoraproject.Config.Printing"
	      ewarn "was not provided by any .service files'\""
	  fi
}


# vim: filetype=ebuild
