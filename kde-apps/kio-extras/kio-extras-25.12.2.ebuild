# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake xdg

DESCRIPTION="KIO plugins present a filesystem-like view of arbitrary data"
HOMEPAGE="https://invent.kde.org/network/kio-extras"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kio-extras-25.12.2.tar.xz -> kio-extras-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="activities ios +man mtp nfs +libproxy openexr phonon samba +sftp taglib X"
BDEPEND="man? ( dev-util/gperf )
	
"
RDEPEND="virtual/kde-seed[gui,svg,sql]
	dev-qt/qt5compat:6
	dev-libs/qcoro
	kde-apps/libkexiv2:6
	kde-frameworks/kded:6
	kde-frameworks/karchive:6
	kde-frameworks/kcmutils:6
	kde-frameworks/kcodecs:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/kdnssd:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kparts:6
	kde-frameworks/kservice:6
	kde-frameworks/kxmlgui:6
	kde-frameworks/solid:6
	kde-frameworks/syntax-highlighting:6
	activities? (
	  kde-plasma/plasma-activities:6
	  kde-plasma/plasma-activities-stats:6
	)
	ios? (
	  app-pda/libimobiledevice:=
	  app-pda/libplist:=
	)
	libproxy? (
	  kde-frameworks/knotifications:6
	  net-libs/libproxy
	)
	mtp? ( >=media-libs/libmtp-1.1.16:= )
	nfs? ( net-libs/libtirpc:= )
	openexr? ( media-libs/openexr:= )
	phonon? ( >=media-libs/phonon-4.12.0[qt6(+)] )
	samba? (
	  net-fs/samba[client]
	  >=net-libs/kdsoap-2.2.0:=[qt6(+)]
	  >=net-libs/kdsoap-ws-discovery-client-0.3.0
	)
	sftp? ( net-libs/libssh:=[sftp] )
	taglib? ( >=media-libs/taglib-1.11.1:= )
	X? (
	  x11-libs/libX11
	  x11-libs/libXcursor
	)
	
"
DEPEND="${RDEPEND}
"
src_configure() {
	local mycmakeargs=(
	  -DBUILD_ACTIVITIES=$(usex activities)
	  $(cmake_use_find_package ios IMobileDevice)
	  $(cmake_use_find_package ios PList)
	  -DWITH_LIBPROXY=$(usex libproxy)
	  $(cmake_use_find_package man Gperf)
	  $(cmake_use_find_package mtp Libmtp)
	  $(cmake_use_find_package nfs TIRPC)
	  $(cmake_use_find_package openexr OpenEXR)
	  $(cmake_use_find_package samba Samba)
	  $(cmake_use_find_package sftp libssh)
	  $(cmake_use_find_package taglib Taglib)
	  -DWITHOUT_X11=$(usex !X)
	)
	cmake_src_configure
}
pkg_postinst() {
	use samba && xdg_pkg_postinst
}
pkg_postrm() {
	use samba && xdg_pkg_postrm
}


# vim: filetype=ebuild
