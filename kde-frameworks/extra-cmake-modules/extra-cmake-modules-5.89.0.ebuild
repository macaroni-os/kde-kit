# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
QT_MINIMAL=5.15.2
ECM_KDEINSTALLDIRS="false"
KDE_AUTODEPS="false"
KDE_DEBUG="false"
KDE_QTHELP="false"
KDE_TEST="false"
inherit kde5 python-any-r1

DESCRIPTION="Extra modules and scripts for CMake"
HOMEPAGE="https://invent.kde.org/frameworks/extra-cmake-modules"

LICENSE="BSD"
KEYWORDS="*"
IUSE="doc test"

BDEPEND="
	doc? (
		${PYTHON_DEPS}
		$(python_gen_any_dep 'dev-python/sphinx[${PYTHON_USEDEP}]')
		$(add_qt_dep qthelp)
	)
	test? (
		$(add_qt_dep linguist-tools)
		$(add_qt_dep qtcore)
	)
"
RDEPEND="
	app-arch/libarchive[bzip2]
"

RESTRICT+=" !test? ( test )"

PATCHES=(
	"${FILESDIR}/${PN}-5.49.0-no-fatal-warnings.patch"
	"${FILESDIR}/${PN}-5.72.0-skip-ecm_add_test-early.patch"
	"${FILESDIR}/${PN}-5.88.0-disable-qmlplugindump.patch"
)

python_check_deps() {
	has_version "dev-python/sphinx[${PYTHON_USEDEP}]"
}

pkg_setup() {
	use doc && python-any-r1_pkg_setup
}

src_prepare() {
	kde5_src_prepare
	# Requires PyQt5, bug #680256
	sed -i -e "/^if(NOT SIP_Qt5Core_Mod_FILE)/s/NOT SIP_Qt5Core_Mod_FILE/TRUE/" \
		tests/CMakeLists.txt || die "failed to disable GenerateSipBindings tests"
}

src_configure() {
	local mycmakeargs=(
		-DDOC_INSTALL_DIR=/usr/share/doc/"${PF}"
		-DBUILD_QTHELP_DOCS=$(usex doc)
		-DBUILD_HTML_DOCS=$(usex doc)
		-DBUILD_MAN_DOCS=$(usex doc)
		-DBUILD_TESTING=$(usex test)
	)

	kde5_src_configure
}

src_test() {
	# ECMToolchainAndroidTest passes but then breaks src_install
	# ECMPoQmToolsTest is broken, bug #627806
	# KDEFetchTranslations can not possibly succeed in releases, bug #764953
	# possible race condition with multiple jobs, bug #701854
	local myctestargs=(
		-j1
		-E "(ECMToolchainAndroidTest|ECMPoQmToolsTest|KDEFetchTranslations)"
	)

	kde5_src_test
}