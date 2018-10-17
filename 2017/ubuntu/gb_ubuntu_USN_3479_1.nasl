###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3479_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for postgresql-9.6 USN-3479-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.843363");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2017-11-15 07:29:47 +0100 (Wed, 15 Nov 2017)");
  script_cve_id("CVE-2017-15098", "CVE-2017-15099");
  script_tag(name:"cvss_base", value:"5.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for postgresql-9.6 USN-3479-1");
  script_tag(name:"summary", value:"Check the version of postgresql-9.6");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"David Rowley discovered that PostgreSQL
incorrectly handled memory when processing certain JSON functions. A remote
attacker could possibly use this issue to obtain sensitive information.
(CVE-2017-15098)

Dean Rasheed discovered that PostgreSQL incorrectly enforced SELECT
privileges when processing INSERT ... ON CONFLICT DO UPDATE commands. A
remote attacker could possibly use this issue to obtain sensitive
information. This issue only affected Ubuntu 16.04 LTS, Ubuntu 17.04 and
Ubuntu 17.10.");
  script_tag(name:"affected", value:"postgresql-9.6 on Ubuntu 17.10,
  Ubuntu 17.04,
  Ubuntu 16.04 LTS,
  Ubuntu 14.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"USN", value:"3479-1");
  script_xref(name:"URL", value:"https://usn.ubuntu.com/usn/usn-3479-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(14\.04 LTS|17\.10|17\.04|16\.04 LTS)");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"postgresql-9.3", ver:"9.3.20-0ubuntu0.14.04", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU17.10")
{

  if ((res = isdpkgvuln(pkg:"postgresql-9.6", ver:"9.6.6-0ubuntu0.17.10", rls:"UBUNTU17.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU17.04")
{

  if ((res = isdpkgvuln(pkg:"postgresql-9.6", ver:"9.6.6-0ubuntu0.17.04", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"postgresql-9.5", ver:"9.5.10-0ubuntu0.16.04", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
