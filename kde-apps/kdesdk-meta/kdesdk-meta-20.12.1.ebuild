# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kde5

DESCRIPTION="KDE SDK - merge this to pull in all kdesdk-derived packages"
HOMEPAGE="https://apps.kde.org/development"
SRC_URI=""

LICENSE="metapackage"
SLOT="5"
KEYWORDS="*"
IUSE="cvs git mercurial python ruby subversion"

RDEPEND="
	$(add_kdeapps_dep kapptemplate)
	$(add_kdeapps_dep kcachegrind)
	$(add_kdeapps_dep kde-dev-scripts)
	$(add_kdeapps_dep kde-dev-utils)
	$(add_kdeapps_dep kdesdk-kioslaves)
	$(add_kdeapps_dep kdesdk-thumbnailers)
	$(add_kdeapps_dep kompare)
	$(add_kdeapps_dep libkomparediff2)
	$(add_kdeapps_dep poxml)
	$(add_kdeapps_dep umbrello)
	cvs? ( $(add_kdeapps_dep cervisia) )
	git? ( $(add_kdeapps_dep dolphin-plugins-git) )
	mercurial? ( $(add_kdeapps_dep dolphin-plugins-mercurial) )
	python? ( $(add_kdeapps_dep lokalize) )
	ruby? ( $(add_kdeapps_dep kross-interpreters) )
	subversion? ( $(add_kdeapps_dep dolphin-plugins-subversion) )
"
