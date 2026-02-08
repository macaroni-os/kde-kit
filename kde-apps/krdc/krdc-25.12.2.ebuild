# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Remote desktop connection (RDP and VNC) client"
HOMEPAGE="https://apps.kde.org/krdc/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/krdc-25.12.2.tar.xz -> krdc-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="activities +rdp +ssh +vnc"
BDEPEND="x11-misc/shared-mime-info
	
"
RDEPEND="dev-qt/qtbase:6[gui,wayland]
	kde-frameworks/kbookmarks:6
	kde-frameworks/kcmutils:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdnssd:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/knotifications:6
	kde-frameworks/knotifyconfig:6
	kde-frameworks/kservice:6
	kde-frameworks/kstatusnotifieritem:6
	kde-frameworks/kwallet:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6
	kde-frameworks/kxmlgui:6
	activities? ( kde-plasma/plasma-activities:6 )
	rdp? (
	kde-frameworks/kio:6
	>=net-misc/freerdp-2.10:3
	)
	ssh? ( net-libs/libssh:= )
	vnc? ( >=net-libs/libvncserver-0.9.15 )
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
