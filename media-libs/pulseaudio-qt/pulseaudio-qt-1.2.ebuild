# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
KDE_QTHELP="true"
KDE_TEST="optional"
QT_MINIMAL=5.12.3
inherit kde5

DESCRIPTION="Qt bindings for libpulse"
HOMEPAGE="https://invent.kde.org/libraries/pulseaudio-qt"
SRC_URI="mirror://kde/stable/${PN}/${P}.tar.xz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="*"

RDEPEND="
	dev-libs/glib:2
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	media-sound/pulseaudio
"
DEPEND="${RDEPEND}
	test? (
		$(add_qt_dep qtdeclarative)
		$(add_qt_dep qtquickcontrols2)
	)
"
