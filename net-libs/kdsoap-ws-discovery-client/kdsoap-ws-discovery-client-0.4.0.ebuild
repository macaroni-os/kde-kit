# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit xdg cmake

DESCRIPTION="WS-Discovery client library based on KDSoap"
HOMEPAGE="https://invent.kde.org/libraries/kdsoap-ws-discovery-client"
SRC_URI="https://invent.kde.org/libraries/kdsoap-ws-discovery-client/-/archive/v0.4.0/kdsoap-ws-discovery-client-v0.4.0.tar.bz2 -> kdsoap-ws-discovery-client-0.4.0-cc51b4f.tar.bz2"
LICENSE="CC0-1.0 GPL-3+"
SLOT="0"
KEYWORDS="*"
PATCHES=(
	"${FILESDIR}/kdsoap-ws-discovery-client-0.2_pre20200317-no-install-docs.patch"
)
RDEPEND="dev-qt/qtbase:6
	net-libs/kdsoap
	
"
DEPEND="${RDEPEND}
"
S="${WORKDIR}/kdsoap-ws-discovery-client-v0.4.0"
src_prepare() {
	xdg_environment_reset
	export XDG_DATA_HOME="${T}/.local/share"
	export XDG_CONFIG_HOME="${T}/.config"
	export XDG_CACHE_HOME="${T}/.cache"
	export FC_CACHEDIR="${T}/fontconfig"
	addpredict /usr/share/fonts
	cmake_src_prepare
}
src_configure() {
	local mycmakeargs=(
	  -DQT_MAJOR_VERSION=6
	  -DBUILD_QCH=OFF
	)
	cmake_src_configure
}


# vim: filetype=ebuild
