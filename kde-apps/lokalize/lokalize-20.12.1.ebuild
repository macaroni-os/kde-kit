# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
PYTHON_COMPAT=( python3+ )
FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.1
inherit eutils kde5 python-single-r1

DESCRIPTION="Localization tool for KDE software and other free and open source software"
HOMEPAGE="https://apps.kde.org/en/lokalize https://l10n.kde.org/tools/"

LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RESTRICT+=" test" # tests are broken, bug 739734

DEPEND="${PYTHON_DEPS}
	>=app-text/hunspell-1.2.8:=
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtscript)
	$(add_qt_dep qtsql sqlite)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kitemviews)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep kross)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	$(add_frameworks_dep sonnet)
"
RDEPEND="${DEPEND}
	$(python_gen_cond_dep '
		dev-python/translate-toolkit[${PYTHON_MULTI_USEDEP}]
	')
"

pkg_setup() {
	python-single-r1_pkg_setup
	kde5_pkg_setup
}

src_install() {
	kde5_src_install
	rm "${ED}"/usr/share/lokalize/scripts/msgmerge.{py,rc} || die
	python_fix_shebang "${ED}"/usr/share/${PN}
}

pkg_postinst() {
	if [[ -z "${REPLACING_VERSIONS}" ]]; then
		elog "Optional dependencies:"
		optfeature "Autofetch kde.org translations in new project wizard" dev-vcs/subversion
		optfeature "Spell and grammar checking" app-text/languagetool
	fi
	kde5_pkg_postinst
}
