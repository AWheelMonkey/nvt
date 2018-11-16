###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2012_1481_1.nasl 12284 2018-11-09 12:37:21Z cfischer $
#
# SuSE Update for opera openSUSE-SU-2012:1481-1 (opera)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.850361");
  script_version("$Revision: 12284 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-09 13:37:21 +0100 (Fri, 09 Nov 2018) $");
  script_tag(name:"creation_date", value:"2012-12-13 17:01:18 +0530 (Thu, 13 Dec 2012)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_xref(name:"openSUSE-SU", value:"2012:1481_1");
  script_name("SuSE Update for opera openSUSE-SU-2012:1481-1 (opera)");

  script_tag(name:"summary", value:"Check for the Version of opera");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSE12\.1");
  script_tag(name:"affected", value:"opera on openSUSE 12.1");
  script_tag(name:"solution", value:"Please install the updated packages.");
  script_tag(name:"insight", value:"This Opera 12.10 security update fixes following security
  issues:

  - an issue that could cause Opera not to correctly check for
  certificate revocation;

  - an issue where CORS requests could incorrectly retrieve
  contents of cross origin pages;

  - an issue where data URIs could be used to facilitate
  Cross-Site Scripting;

  - a high severity issue, as reported by Gareth Heyes;
  details will be disclosed at a later date

  - an issue where specially crafted SVG images could allow
  execution of arbitrary code;

  - a moderate severity issue, as reported by the Google
  Security Group; details will be disclosed at a later date

  Full changelog available at:
  http://www.opera.com/docs/changelogs/unix/1210");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);
res = "";

if(release == "openSUSE12.1")
{

  if ((res = isrpmvuln(pkg:"opera", rpm:"opera~12.10~26.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"opera-gtk", rpm:"opera-gtk~12.10~26.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"opera-kde4", rpm:"opera-kde4~12.10~26.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
