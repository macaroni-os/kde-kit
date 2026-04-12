# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="The LXQt desktop panel"
HOMEPAGE="https://lxqt-project.org"
SRC_URI="https://api.github.com/repos/lxqt/lxqt-panel/tarball/2.3.3 -> lxqt-panel-2.3.3-96971e5.tar.gz"
LICENSE="LGPL-2.1 LGPL-2.1+"
SLOT="0"
KEYWORDS="*"
IUSE="+alsa colorpicker cpuload +desktopswitch +directorymenu dom +kbindicator +mainmenu +mount networkmonitor pulseaudio +quicklaunch lm_sensors +showdesktop +spacer +statusnotifier sysstat +taskbar tray +volume +worldclock"
REQUIRED_USE="|| ( desktopswitch mainmenu showdesktop taskbar )
volume? ( || ( alsa pulseaudio ) )
"
RDEPEND="dev-libs/libqtxdg
	dev-libs/wayland
	dev-qt/qtbase:6[gui]
	dev-qt/qtsvg:6
	dev-qt/qtwayland:6
	kde-frameworks/kwindowsystem:6[X]
	kde-plasma/layer-shell-qt:6
	lxqt-base/liblxqt
	lxqt-base/lxqt-globalkeys
	lxqt-base/lxqt-menu-data
	x11-libs/libX11
	cpuload? ( sys-libs/libstatgrab )
	kbindicator? ( x11-libs/libxkbcommon )
	lm_sensors? ( sys-apps/lm_sensors )
	mount? ( kde-frameworks/solid:6 )
	networkmonitor? ( sys-libs/libstatgrab )
	statusnotifier? (
	    dev-libs/libdbusmenu-lxqt
	    dev-qt/qtbase:6
	)
	sysstat? ( lxqt-base/libsysstat )
	tray? (
	    x11-libs/libxcb:=
	    x11-libs/libXcomposite
	    x11-libs/libXdamage
	    x11-libs/libXrender
	    x11-libs/libXtst
	    x11-libs/xcb-util
	    x11-libs/xcb-util-image
	)
	volume? (
	    alsa? ( media-libs/alsa-lib )
	    pulseaudio? (
	        media-sound/pulseaudio
	        media-sound/pavucontrol-qt
	    )
	)
	
"
DEPEND="${RDEPEND}
	dev-util/lxqt-build-tools
	dev-qt/qttools:6[linguist]
	virtual/pkgconfig
	
"

post_src_unpack() {
	mv lxqt-lxqt-panel-* ${S}
}


src_configure() {
	  local mycmakeargs=(
	      -DCOLORPICKER_PLUGIN=$(usex colorpicker)
	      -DCPULOAD_PLUGIN=$(usex cpuload)
	      -DDESKTOPSWITCH_PLUGIN=$(usex desktopswitch)
	      -DDIRECTORYMENU_PLUGIN=$(usex directorymenu)
	      -DDOM_PLUGIN=$(usex dom)
	      -DKBINDICATOR_PLUGIN=$(usex kbindicator)
	      -DMAINMENU_PLUGIN=$(usex mainmenu)
	      -DMOUNT_PLUGIN=$(usex mount)
	      -DNETWORKMONITOR_PLUGIN=$(usex networkmonitor)
	      -DQUICKLAUNCH_PLUGIN=$(usex quicklaunch)
	      -DSENSORS_PLUGIN=$(usex lm_sensors)
	      -DSHOWDESKTOP_PLUGIN=$(usex showdesktop)
	      -DSPACER_PLUGIN=$(usex spacer)
	      -DSTATUSNOTIFIER_PLUGIN=$(usex statusnotifier)
	      -DSYSSTAT_PLUGIN=$(usex sysstat)
	      -DTASKBAR_PLUGIN=$(usex taskbar)
	      -DTRAY_PLUGIN=$(usex tray)
	      -DVOLUME_PLUGIN=$(usex volume)
	      -DWORLDCLOCK_PLUGIN=$(usex worldclock)
	  )
	  if use volume; then
	      mycmakeargs+=(
	          -DVOLUME_USE_ALSA=$(usex alsa)
	          -DVOLUME_USE_PULSEAUDIO=$(usex pulseaudio)
	      )
	  fi
	  cmake_src_configure
}
src_install() {
	  cmake_src_install
	  doman panel/man/*.1
}



# vim: filetype=ebuild
