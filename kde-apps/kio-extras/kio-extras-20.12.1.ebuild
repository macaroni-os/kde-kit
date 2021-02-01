# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
KDE_TEST="optional"
FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="KIO plugins present a filesystem-like view of arbitrary data"
HOMEPAGE="https://invent.kde.org/network/kio-extras"

LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE="activities +man mtp nfs openexr phonon samba +sftp taglib X"

BDEPEND="
	man? ( dev-util/gperf )
"
DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kbookmarks)
	$(add_frameworks_dep kcodecs)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kdnssd)
	$(add_frameworks_dep kguiaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep kxmlgui)
	$(add_frameworks_dep solid)
	$(add_frameworks_dep syntax-highlighting)
	activities? (
		$(add_qt_dep qtsql)
		$(add_frameworks_dep kactivities)
		$(add_frameworks_dep kactivities-stats)
	)
	mtp? ( >=media-libs/libmtp-1.1.16:= )
	nfs? ( net-libs/libtirpc:= )
	openexr? ( media-libs/openexr:= )
	phonon? ( >=media-libs/phonon-4.11.0 )
	samba? (
		net-fs/samba[client]
		net-libs/kdsoap:=
		net-libs/kdsoap-ws-discovery-client
	)
	sftp? ( net-libs/libssh:=[sftp] )
	taglib? ( >=media-libs/taglib-1.11.1 )
	X? (
		x11-libs/libX11
		x11-libs/libXcursor
	)
"
RDEPEND="${DEPEND}
	$(add_frameworks_dep kded)
"

# requires running kde environment
RESTRICT+=" test"

PATCHES=( "${FILESDIR}/${P}-dont-log-pwd.patch" )

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package activities KF5Activities)
		$(cmake-utils_use_find_package activities KF5ActivitiesStats)
		$(cmake-utils_use_find_package man Gperf)
		$(cmake-utils_use_find_package mtp Mtp)
		$(cmake-utils_use_find_package nfs TIRPC)
		$(cmake-utils_use_find_package openexr OpenEXR)
		$(cmake-utils_use_find_package phonon Phonon4Qt5)
		$(cmake-utils_use_find_package samba Samba)
		$(cmake-utils_use_find_package sftp libssh)
		$(cmake-utils_use_find_package taglib Taglib)
		$(cmake-utils_use_find_package X X11)
	)
	use samba && mycmakeargs+=(
		-DBUILD_KDSoapWSDiscoveryClient=OFF # disable bundled stuff
	)

	kde5_src_configure
}
