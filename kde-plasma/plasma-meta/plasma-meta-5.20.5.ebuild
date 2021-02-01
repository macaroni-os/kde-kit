# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kde5

DESCRIPTION="Merge this to pull in all Plasma 5 packages"
HOMEPAGE="https://kde.org/plasma-desktop"
SRC_URI=""

LICENSE="metapackage"
SLOT="5"
KEYWORDS="*"
IUSE="bluetooth +browser-integration crypt +desktop-portal discover +display-manager
elogind grub gtk +handbook +kwallet +legacy-systray +networkmanager
plymouth pulseaudio qrcode +sddm sdk +smart thunderbolt +wallpapers"

RDEPEND="
	$(add_plasma_dep breeze)
	$(add_plasma_dep drkonqi)
	$(add_plasma_dep kactivitymanagerd)
	$(add_plasma_dep kde-cli-tools)
	$(add_plasma_dep kdecoration)
	$(add_plasma_dep kdeplasma-addons)
	$(add_plasma_dep kgamma)
	$(add_plasma_dep khotkeys)
	$(add_plasma_dep kinfocenter)
	$(add_plasma_dep kmenuedit)
	$(add_plasma_dep kscreen)
	$(add_plasma_dep kscreenlocker)
	$(add_plasma_dep ksshaskpass)
	$(add_plasma_dep ksysguard)
	$(add_plasma_dep kwayland-integration)
	$(add_plasma_dep kwayland-server)
	$(add_plasma_dep kwin)
	$(add_plasma_dep kwrited)
	$(add_plasma_dep libkscreen)
	$(add_plasma_dep libksysguard)
	$(add_plasma_dep milou)
	$(add_plasma_dep oxygen)
	$(add_plasma_dep plasma-desktop)
	$(add_plasma_dep plasma-integration)
	$(add_plasma_dep plasma-workspace)
	$(add_plasma_dep polkit-kde-agent)
	$(add_plasma_dep powerdevil)
	$(add_plasma_dep systemsettings)
	sys-apps/dbus[elogind?]
	sys-auth/polkit[elogind?]
	sys-fs/udisks:2[elogind?]
	bluetooth? ( $(add_plasma_dep bluedevil) )
	browser-integration? ( $(add_plasma_dep plasma-browser-integration) )
	crypt? ( $(add_plasma_dep plasma-vault) )
	desktop-portal? ( $(add_plasma_dep xdg-desktop-portal-kde) )
	discover? ( $(add_plasma_dep discover) )
	display-manager? (
		sddm? (
			$(add_plasma_dep sddm-kcm)
			x11-misc/sddm[elogind?]
		)
		!sddm? ( x11-misc/lightdm )
	)
	grub? ( $(add_plasma_dep breeze-grub) )
	gtk? (
		$(add_plasma_dep breeze-gtk)
		$(add_plasma_dep kde-gtk-config)
		x11-misc/appmenu-gtk-module
	)
	handbook? ( kde-apps/khelpcenter:5 )
	kwallet? ( $(add_plasma_dep kwallet-pam) )
	legacy-systray? ( $(add_plasma_dep xembed-sni-proxy) )
	networkmanager? (
		$(add_plasma_dep plasma-nm)
		net-misc/networkmanager[elogind?]
		qrcode? ( kde-frameworks/prison[qml] )
	)
	plymouth? (
		$(add_plasma_dep breeze-plymouth)
		$(add_plasma_dep plymouth-kcm)
	)
	pulseaudio? ( $(add_plasma_dep plasma-pa) )
	sdk? ( $(add_plasma_dep plasma-sdk) )
	smart? ( $(add_plasma_dep plasma-disks) )
	thunderbolt? ( $(add_plasma_dep plasma-thunderbolt) )
	wallpapers? ( $(add_plasma_dep plasma-workspace-wallpapers) )
"

pkg_postinst() {
	has_version sys-auth/consolekit || return
	use elogind || return
	ewarn "An existing installation of sys-auth/consolekit was detected even though"
	ewarn "${PN} was configured with USE elogind."
	ewarn "There can only be one session manager at runtime, otherwise random issues"
	ewarn "may occur. Please make sure USE consolekit is nowhere enabled in make.conf"
	ewarn "or package.use and remove sys-auth/consolekit before raising bugs."
	ewarn "For more information, visit https://wiki.gentoo.org/wiki/KDE"
}
