# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
inherit kde6 python-single-r1 xdg

DESCRIPTION="Plasma crash handler, gives the user feedback if a program crashed"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/drkonqi-6.5.5.tar.xz -> drkonqi-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="dev-libs/elfutils[utils]
	kde-frameworks/kirigami:6
	kde-frameworks/kitemmodels:6
	$(python_gen_cond_dep '
	    dev-python/psutil[${PYTHON_USEDEP}]
	    dev-python/pygdbmi[${PYTHON_USEDEP}]
	')
	|| (
		sys-devel/gdb
		dev-util/lldb
	)
	
"
DEPEND="${RDEPEND}
	${PYTHON_DEPS}
	dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/ki18n:6
	kde-frameworks/kidletime:6
	kde-frameworks/kio:6
	kde-frameworks/kjobwidgets:6
	kde-frameworks/knotifications:6
	kde-frameworks/kservice:6
	kde-frameworks/kstatusnotifieritem:6
	kde-frameworks/kwallet:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6
	kde-frameworks/syntax-highlighting:6
	sys-apps/systemd:=
	>=sys-auth/polkit-qt-0.175.0[qt6(+)]
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      -DWITH_PYTHON_VENDORING=OFF
	  )
	  kde6_src_configure
}

src_test() {
	  # needs network access, bug #698510
	  local myctestargs=(
	      -E "(connectiontest)"
	  )
	  ecm_src_test
}

pkg_postinst() {
	  if [[ -z ${REPLACING_VERSIONS} ]] && systemd_is_booted ; then
	      elog "For systemd, steps are needed for integration with systemd-coredumpd."
	      elog "As root, run the following:"
	      elog "1. systemctl enable drkonqi-coredump-processor@.service"
	      elog "2. systemctl --user enable --now --global drkonqi-coredump-launcher.socket"
	  fi
}


# vim: filetype=ebuild
