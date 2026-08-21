# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Powerful BitTorrent client based on KDE Frameworks"
HOMEPAGE="https://apps.kde.org/en/ktorrent"
SRC_URI="https://download.kde.org/Attic//release-service/25.12.2/src/ktorrent-25.12.2.tar.xz -> ktorrent-25.12.2.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
IUSE="+bwscheduler +downloadorder +infowidget +ipfilter +logviewer
+magnetgenerator +mediaplayer rss +scanfolder +shutdown +stats +upnp
+webengine +zeroconf
"
# Commons depends
CDEPEND="dev-qt/qtbase:6[gui]
	kde-frameworks/kcmutils:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/kglobalaccel:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/knotifications:6
	kde-frameworks/knotifyconfig:6
	kde-frameworks/kparts:6
	kde-frameworks/kstatusnotifieritem:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6
	kde-frameworks/kxmlgui:6
	net-libs/libktorrent:6
	infowidget? ( dev-libs/geoip )
	ipfilter? ( kde-frameworks/karchive:6 )
	mediaplayer? (
	  dev-qt/qtmultimedia:6
	  media-libs/taglib:=
	)
	rss? (
	  dev-qt/qtwebengine:6
	  kde-frameworks/syndication:6
	)
	stats? ( kde-frameworks/kplotting:6 )
	upnp? ( kde-frameworks/kcompletion:6 )
	webengine? ( dev-qt/qtwebengine:6 )
	zeroconf? ( kde-frameworks/kdnssd:6 )
	
"
BDEPEND="sys-devel/gettext
	
"
RDEPEND="${CDEPEND}
	ipfilter? (
	  app-arch/bzip2
	  app-arch/unzip
	  kde-apps/kio-extras:6
	  kde-frameworks/ktextwidgets:6
	)
	
"
DEPEND="${CDEPEND}
	dev-libs/boost
	
"
src_configure() {
	local mycmakeargs=(
		-DENABLE_BWSCHEDULER_PLUGIN=$(usex bwscheduler)
		-DENABLE_DOWNLOADORDER_PLUGIN=$(usex downloadorder)
		-DENABLE_INFOWIDGET_PLUGIN=$(usex infowidget)
		-DENABLE_IPFILTER_PLUGIN=$(usex ipfilter)
		-DENABLE_LOGVIEWER_PLUGIN=$(usex logviewer)
		-DENABLE_MAGNETGENERATOR_PLUGIN=$(usex magnetgenerator)
		$(cmake_use_find_package mediaplayer Taglib)
		$(cmake_use_find_package mediaplayer Qt6Multimedia)
		$(cmake_use_find_package rss KF6Syndication)
		-DENABLE_MEDIAPLAYER_PLUGIN=$(usex mediaplayer)
		-DENABLE_SCANFOLDER_PLUGIN=$(usex scanfolder)
		-DENABLE_SHUTDOWN_PLUGIN=$(usex shutdown)
		-DENABLE_STATS_PLUGIN=$(usex stats)
		-DENABLE_UPNP_PLUGIN=$(usex upnp)
		-DENABLE_SEARCH_PLUGIN=$(usex webengine)
		-DENABLE_ZEROCONF_PLUGIN=$(usex zeroconf)
	)
	cmake_src_configure
}


# vim: filetype=ebuild
