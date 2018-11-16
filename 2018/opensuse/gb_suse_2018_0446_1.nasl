###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2018_0446_1.nasl 12284 2018-11-09 12:37:21Z cfischer $
#
# SuSE Update for libreoffice openSUSE-SU-2018:0446-1 (libreoffice)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.851701");
  script_version("$Revision: 12284 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-09 13:37:21 +0100 (Fri, 09 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-02-15 08:45:14 +0100 (Thu, 15 Feb 2018)");
  script_cve_id("CVE-2018-6871");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for libreoffice openSUSE-SU-2018:0446-1 (libreoffice)");
  script_tag(name:"summary", value:"Check the version of libreoffice");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"This update for libreoffice fixes the following issues:

  LibreOffice was updated to 5.4.5.1:

  - CVE-2018-6871: Fixes data exposure when using WEBSERVICE (bsc#1080249)

  This update was imported from the SUSE:SLE-12-SP3:Update update project.");
  script_tag(name:"affected", value:"libreoffice on openSUSE Leap 42.3");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"openSUSE-SU", value:"2018:0446_1");
  script_xref(name:"URL" , value:"http://lists.opensuse.org/opensuse-security-announce/2018-02/msg00025.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSELeap42\.3");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);
res = "";

if(release == "openSUSELeap42.3")
{

  if ((res = isrpmvuln(pkg:"libreoffice", rpm:"libreoffice~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-base", rpm:"libreoffice-base~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-base-debuginfo", rpm:"libreoffice-base-debuginfo~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-base-drivers-mysql", rpm:"libreoffice-base-drivers-mysql~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-base-drivers-mysql-debuginfo", rpm:"libreoffice-base-drivers-mysql-debuginfo~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-base-drivers-postgresql", rpm:"libreoffice-base-drivers-postgresql~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-base-drivers-postgresql-debuginfo", rpm:"libreoffice-base-drivers-postgresql-debuginfo~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-calc", rpm:"libreoffice-calc~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-calc-debuginfo", rpm:"libreoffice-calc-debuginfo~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-calc-extensions", rpm:"libreoffice-calc-extensions~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-debuginfo", rpm:"libreoffice-debuginfo~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-debugsource", rpm:"libreoffice-debugsource~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-draw", rpm:"libreoffice-draw~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-draw-debuginfo", rpm:"libreoffice-draw-debuginfo~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-filters-optional", rpm:"libreoffice-filters-optional~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-gnome", rpm:"libreoffice-gnome~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-gnome-debuginfo", rpm:"libreoffice-gnome-debuginfo~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-gtk3", rpm:"libreoffice-gtk3~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-gtk3-debuginfo", rpm:"libreoffice-gtk3-debuginfo~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-impress", rpm:"libreoffice-impress~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-impress-debuginfo", rpm:"libreoffice-impress-debuginfo~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-kde4", rpm:"libreoffice-kde4~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-kde4-debuginfo", rpm:"libreoffice-kde4-debuginfo~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-mailmerge", rpm:"libreoffice-mailmerge~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-math", rpm:"libreoffice-math~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-math-debuginfo", rpm:"libreoffice-math-debuginfo~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-officebean", rpm:"libreoffice-officebean~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-officebean-debuginfo", rpm:"libreoffice-officebean-debuginfo~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-pyuno", rpm:"libreoffice-pyuno~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-pyuno-debuginfo", rpm:"libreoffice-pyuno-debuginfo~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-sdk", rpm:"libreoffice-sdk~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-sdk-debuginfo", rpm:"libreoffice-sdk-debuginfo~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-sdk-doc", rpm:"libreoffice-sdk-doc~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-writer", rpm:"libreoffice-writer~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-writer-debuginfo", rpm:"libreoffice-writer-debuginfo~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-writer-extensions", rpm:"libreoffice-writer-extensions~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreofficekit", rpm:"libreofficekit~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreofficekit-devel", rpm:"libreofficekit-devel~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-branding-upstream", rpm:"libreoffice-branding-upstream~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-gdb-pretty-printers", rpm:"libreoffice-gdb-pretty-printers~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-glade", rpm:"libreoffice-glade~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-icon-theme-breeze", rpm:"libreoffice-icon-theme-breeze~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-icon-theme-galaxy", rpm:"libreoffice-icon-theme-galaxy~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-icon-theme-hicontrast", rpm:"libreoffice-icon-theme-hicontrast~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-icon-theme-sifr", rpm:"libreoffice-icon-theme-sifr~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-icon-theme-tango", rpm:"libreoffice-icon-theme-tango~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-af", rpm:"libreoffice-l10n-af~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-ar", rpm:"libreoffice-l10n-ar~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-as", rpm:"libreoffice-l10n-as~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-bg", rpm:"libreoffice-l10n-bg~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-bn", rpm:"libreoffice-l10n-bn~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-br", rpm:"libreoffice-l10n-br~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-ca", rpm:"libreoffice-l10n-ca~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-cs", rpm:"libreoffice-l10n-cs~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-cy", rpm:"libreoffice-l10n-cy~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-da", rpm:"libreoffice-l10n-da~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-de", rpm:"libreoffice-l10n-de~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-dz", rpm:"libreoffice-l10n-dz~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-el", rpm:"libreoffice-l10n-el~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-en", rpm:"libreoffice-l10n-en~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-eo", rpm:"libreoffice-l10n-eo~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-es", rpm:"libreoffice-l10n-es~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-et", rpm:"libreoffice-l10n-et~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-eu", rpm:"libreoffice-l10n-eu~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-fa", rpm:"libreoffice-l10n-fa~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-fi", rpm:"libreoffice-l10n-fi~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-fr", rpm:"libreoffice-l10n-fr~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-ga", rpm:"libreoffice-l10n-ga~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-gl", rpm:"libreoffice-l10n-gl~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-gu", rpm:"libreoffice-l10n-gu~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-he", rpm:"libreoffice-l10n-he~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-hi", rpm:"libreoffice-l10n-hi~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-hr", rpm:"libreoffice-l10n-hr~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-hu", rpm:"libreoffice-l10n-hu~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-it", rpm:"libreoffice-l10n-it~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-ja", rpm:"libreoffice-l10n-ja~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-kk", rpm:"libreoffice-l10n-kk~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-kn", rpm:"libreoffice-l10n-kn~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-ko", rpm:"libreoffice-l10n-ko~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-lt", rpm:"libreoffice-l10n-lt~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-lv", rpm:"libreoffice-l10n-lv~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-mai", rpm:"libreoffice-l10n-mai~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-ml", rpm:"libreoffice-l10n-ml~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-mr", rpm:"libreoffice-l10n-mr~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-nb", rpm:"libreoffice-l10n-nb~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-nl", rpm:"libreoffice-l10n-nl~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-nn", rpm:"libreoffice-l10n-nn~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-nr", rpm:"libreoffice-l10n-nr~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-nso", rpm:"libreoffice-l10n-nso~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-or", rpm:"libreoffice-l10n-or~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-pa", rpm:"libreoffice-l10n-pa~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-pl", rpm:"libreoffice-l10n-pl~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-pt_BR", rpm:"libreoffice-l10n-pt_BR~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-pt_PT", rpm:"libreoffice-l10n-pt_PT~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-ro", rpm:"libreoffice-l10n-ro~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-ru", rpm:"libreoffice-l10n-ru~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-si", rpm:"libreoffice-l10n-si~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-sk", rpm:"libreoffice-l10n-sk~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-sl", rpm:"libreoffice-l10n-sl~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-sr", rpm:"libreoffice-l10n-sr~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-ss", rpm:"libreoffice-l10n-ss~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-st", rpm:"libreoffice-l10n-st~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-sv", rpm:"libreoffice-l10n-sv~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-ta", rpm:"libreoffice-l10n-ta~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-te", rpm:"libreoffice-l10n-te~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-th", rpm:"libreoffice-l10n-th~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-tn", rpm:"libreoffice-l10n-tn~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-tr", rpm:"libreoffice-l10n-tr~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-ts", rpm:"libreoffice-l10n-ts~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-uk", rpm:"libreoffice-l10n-uk~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-ve", rpm:"libreoffice-l10n-ve~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-xh", rpm:"libreoffice-l10n-xh~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-zh_CN", rpm:"libreoffice-l10n-zh_CN~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-zh_TW", rpm:"libreoffice-l10n-zh_TW~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-l10n-zu", rpm:"libreoffice-l10n-zu~5.4.5.1~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
