# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="true"
FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.2
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Library for accessing Google calendar and contact resources"
HOMEPAGE="https://api.kde.org/kdepim/libkgapi/html/index.html"
LICENSE="LGPL-2.1+"
SLOT="5"
KEYWORDS="*"
IUSE="nls"

BDEPEND="
	nls? ( $(add_qt_dep linguist-tools) )
"
DEPEND="
	dev-libs/cyrus-sasl:2
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep kcalendarcore)
	$(add_frameworks_dep kcontacts)
	$(add_frameworks_dep kwallet)
"
RDEPEND="${DEPEND}"