# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kde5

DESCRIPTION="Simple tag editor based on Qt"
HOMEPAGE="https://kid3.kde.org/"
SRC_URI="https://github.com/KDE/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="5"
KEYWORDS="*"
IUSE="acoustid flac kde mp3 mp4 +mpris +taglib vorbis"

REQUIRED_USE="flac? ( vorbis )"

BDEPEND="
	$(add_qt_dep linguist-tools)
	kde? ( $(add_frameworks_dep extra-cmake-modules) )
"
DEPEND="
	$(add_qt_dep qtcore)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtmultimedia)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	sys-libs/readline:0=
	acoustid? (
		media-libs/chromaprint
		media-video/ffmpeg
	)
	flac? (
		media-libs/flac[cxx]
		media-libs/libvorbis
	)
	kde? (
		$(add_frameworks_dep kconfig)
		$(add_frameworks_dep kconfigwidgets)
		$(add_frameworks_dep kcoreaddons)
		$(add_frameworks_dep kio)
		$(add_frameworks_dep kwidgetsaddons)
		$(add_frameworks_dep kxmlgui)
	)
	mp3? ( media-libs/id3lib )
	mp4? ( media-libs/libmp4v2:0 )
	mpris? ( $(add_qt_dep qtdbus) )
	taglib? ( >=media-libs/taglib-1.9.1 )
	vorbis? (
		media-libs/libogg
		media-libs/libvorbis
	)
"
RDEPEND="${DEPEND}
	!media-sound/kid3:4
"

src_prepare() {
	# overengineered upstream build system
	kde5_src_prepare
	# applies broken python hacks, bug #614950
	cmake_comment_add_subdirectory doc
}

src_configure() {
	local mycmakeargs=(
		-DWITH_CHROMAPRINT=$(usex acoustid)
		-DWITH_DBUS=$(usex mpris)
		-DWITH_FLAC=$(usex flac)
		-DWITH_ID3LIB=$(usex mp3)
		-DWITH_MP4V2=$(usex mp4)
		-DWITH_TAGLIB=$(usex taglib)
		-DWITH_VORBIS=$(usex vorbis)
	)

	if use kde ; then
		mycmakeargs+=( "-DWITH_APPS=KDE;CLI" )
	else
		mycmakeargs+=( "-DWITH_APPS=Qt;CLI" )
	fi

	kde5_src_configure
}
