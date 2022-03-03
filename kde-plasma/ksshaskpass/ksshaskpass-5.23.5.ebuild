# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.86.0
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="Implementation of ssh-askpass with KDE Wallet integration"
HOMEPAGE+=" https://invent.kde.org/plasma/ksshaskpass"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kwallet)
	$(add_frameworks_dep kwidgetsaddons)
"
RDEPEND="${DEPEND}"

src_install() {
	kde5_src_install

	insinto /etc/xdg/plasma-workspace/env/
	doins "${FILESDIR}/05-ksshaskpass.sh"
}

pkg_postinst() {
	kde5_pkg_postinst

	elog "In order to have ssh-agent start with Plasma 5,"
	elog "edit /etc/xdg/plasma-workspace/env/10-agent-startup.sh"
	elog "and uncomment the lines enabling ssh-agent."
	elog
	elog "If you do so, do not forget to uncomment the respective"
	elog "lines in /etc/xdg/plasma-workspace/shutdown/10-agent-shutdown.sh"
	elog "to properly kill the agent when the session ends."
	elog
	elog "${PN} has been installed as your default askpass application"
	elog "for Plasma 5 sessions."
	elog "If that's not desired, select the one you want to use in"
	elog "/etc/xdg/plasma-workspace/env/05-ksshaskpass.sh"

	# Clean up pre-5.17.4 dirs
	rmdir -v "${EROOT}"/etc/plasma{/startup,} 2> /dev/null
}