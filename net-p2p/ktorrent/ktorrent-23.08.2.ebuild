# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="optional"
KDE_TEST="optional"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.2
VIRTUALX_REQUIRED="test"
inherit kde5
SRC_URI="mirror://kde/stable/release-service/${PV}/src/${P}.tar.xz"
DESCRIPTION="Powerful BitTorrent client based on KDE Frameworks"
HOMEPAGE="https://apps.kde.org/en/ktorrent"
LICENSE="GPL-2"
SLOT="5"
KEYWORDS="*"
IUSE="+bwscheduler +downloadorder +infowidget +ipfilter +kross +logviewer +magnetgenerator
+mediaplayer rss +scanfolder +shutdown +stats +upnp +webengine +zeroconf"

BDEPEND="sys-devel/gettext"
COMMON_DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep knotifyconfig)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	$(add_frameworks_dep solid)
	>=net-libs/libktorrent-$(ver_cut 1-3):5
	infowidget? ( dev-libs/geoip )
	kross? (
		$(add_frameworks_dep karchive)
		$(add_frameworks_dep kitemviews)
		$(add_frameworks_dep kross)
	)
	mediaplayer? (
		>=media-libs/phonon-4.11.0
		>=media-libs/taglib-1.5
	)
	rss? (
		$(add_qt_dep qtwebengine)
		$(add_frameworks_dep syndication)
	)
	shutdown? ( $(add_plasma_dep libkworkspace) )
	stats? ( $(add_frameworks_dep kplotting) )
	upnp? ( $(add_frameworks_dep kcompletion) )
	webengine? ( $(add_qt_dep qtwebengine) )
	zeroconf? ( $(add_frameworks_dep kdnssd) )
"
DEPEND="${COMMON_DEPEND}
	dev-libs/boost
"
RDEPEND="${COMMON_DEPEND}
	ipfilter? (
		app-arch/bzip2
		app-arch/unzip
		$(add_kdeapps_dep kio-extras)
		$(add_frameworks_dep ktextwidgets)
	)
"

src_configure() {
	local mycmakeargs=(
		-DENABLE_BWSCHEDULER_PLUGIN=$(usex bwscheduler)
		-DENABLE_DOWNLOADORDER_PLUGIN=$(usex downloadorder)
		-DENABLE_INFOWIDGET_PLUGIN=$(usex infowidget)
		-DWITH_SYSTEM_GEOIP=$(usex infowidget)
		-DENABLE_IPFILTER_PLUGIN=$(usex ipfilter)
		-DENABLE_SCRIPTING_PLUGIN=$(usex kross)
		-DENABLE_LOGVIEWER_PLUGIN=$(usex logviewer)
		-DENABLE_MAGNETGENERATOR_PLUGIN=$(usex magnetgenerator)
		-DENABLE_MEDIAPLAYER_PLUGIN=$(usex mediaplayer)
		$(cmake-utils_use_find_package rss KF5Syndication)
		-DENABLE_SCANFOLDER_PLUGIN=$(usex scanfolder)
		-DENABLE_SHUTDOWN_PLUGIN=$(usex shutdown)
		-DENABLE_STATS_PLUGIN=$(usex stats)
		-DENABLE_UPNP_PLUGIN=$(usex upnp)
		-DENABLE_SEARCH_PLUGIN=$(usex webengine)
		-DENABLE_ZEROCONF_PLUGIN=$(usex zeroconf)
	)
# add back when ported
# 		-DENABLE_WEBINTERFACE_PLUGIN=$(usex webinterface)
	kde5_src_configure
}
