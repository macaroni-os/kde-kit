# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="forceoptional"
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Framework for syntax highlighting"
LICENSE="MIT"
KEYWORDS="*"
IUSE="nls"

BDEPEND="
	dev-lang/perl
	nls? ( $(add_qt_dep linguist-tools) )
"
DEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtxmlpatterns)
"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}"/${PN}-5.77.0-bash-zsh-fix.patch
)

src_install() {
	kde5_src_install
	dobin "${BUILD_DIR}"/bin/katehighlightingindexer
}
