# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Virtual Globe and World Atlas to learn more about Earth"
HOMEPAGE="https://marble.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/marble-25.12.2.tar.xz -> marble-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="aprs +dbus designer +geolocation gps +kde +pbf phonon shapefile +webengine"
BDEPEND="dev-qt/qttools:6[linguist]
	aprs? ( dev-lang/perl )
	
"
RDEPEND="virtual/kde-seed[gui,sql,declarative,svg]
	dev-qt/qt5compat:6
	sys-libs/zlib
	aprs? ( dev-qt/qtserialport:6 )
	designer? ( dev-qt/qttools:6[designer] )
	geolocation? ( dev-qt/qtpositioning:6 )
	gps? ( sci-geosciences/gpsd:= )
	kde? (
	  dev-libs/kirigami-addons:6
	  dev-qt/qt5compat:6[qml]
	  kde-frameworks/kirigami:6
	  kde-frameworks/kconfig:6
	  kde-frameworks/kconfigwidgets:6
	  kde-frameworks/kcoreaddons:6
	  kde-frameworks/kcrash:6
	  kde-frameworks/ki18n:6
	  kde-frameworks/kio:6
	  kde-frameworks/kparts:6
	  kde-frameworks/krunner:6
	  webengine? ( dev-qt/qtwebengine:6[qml] )
	)
	pbf? (
	  dev-cpp/abseil-cpp:=
	  dev-libs/protobuf:=
	)
	phonon? ( >=media-libs/phonon-4.12.0[qt6(+)] )
	shapefile? ( sci-libs/shapelib:= )
	webengine? (
	  dev-qt/qtwebchannel:6
	  dev-qt/qtwebengine:6
	)
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
