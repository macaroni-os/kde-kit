# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_QTHELP="false"
KDE_TEST="true"
COMMIT=dcefb65c88e76f1f9eda8b0318006e93d15a0e1e
inherit kde5

DESCRIPTION="WS-Discovery client library based on KDSoap"
HOMEPAGE="https://gitlab.com/caspermeijn/kdsoap-ws-discovery-client
https://caspermeijn.gitlab.io/kdsoap-ws-discovery-client"
SRC_URI="https://gitlab.com/caspermeijn/${PN}/repository/${COMMIT}/archive.tar.gz -> ${P}.tar.gz"

LICENSE="CC0-1.0 GPL-3+"
SLOT="0"
KEYWORDS="*"
IUSE="doc"

BDEPEND="
	doc? ( app-doc/doxygen[dot] )
"
RDEPEND="
	$(add_qt_dep qtcore)
	$(add_qt_dep qtnetwork)
	>=net-libs/kdsoap-1.9.0:="
DEPEND="${RDEPEND}
	test? ( $(add_qt_dep qtxml) )
"

RESTRICT+=" test"

PATCHES=( "${FILESDIR}"/${PN}-0.2_pre20200317-no-install-docs.patch )

S="${WORKDIR}/${PN}-${COMMIT}-${COMMIT}"

src_prepare() {
	kde5_src_prepare
	use test || ecm_punt_bogus_dep Qt5 Xml
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package doc Doxygen)
		-DBUILD_QCH=OFF # does not use ecm_add_qch from ECMAddQch
	)
	kde5_src_configure
}

src_install() {
	use doc && local HTML_DOCS=( "${BUILD_DIR}"/docs/html/. )
	kde5_src_install
}
