###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3770_1.nasl 12252 2018-11-08 07:19:31Z asteins $
#
# Ubuntu Update for lcms2 USN-3770-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
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
  script_oid("1.3.6.1.4.1.25623.1.0.843704");
  script_version("$Revision: 12252 $");
  script_cve_id("CVE-2016-10165", "CVE-2018-16435");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-11-08 08:19:31 +0100 (Thu, 08 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-10-26 06:08:52 +0200 (Fri, 26 Oct 2018)");
  script_name("Ubuntu Update for lcms2 USN-3770-1");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(14\.04 LTS|18\.04 LTS|16\.04 LTS)");

  script_xref(name:"USN", value:"3770-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3770-1/");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'lcms2'
  package(s) announced via the USN-3770-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Ibrahim El-Sayed discovered that Little CMS incorrectly handled certain
files. An attacker could possibly use this issue to cause a denial of
service. (CVE-2016-10165)

Quang Nguyen discovered that Little CMS incorrectly handled certain
files. An attacker could possibly use this issue to execute arbitrary
code. (CVE-2018-16435)");

  script_tag(name:"affected", value:"lcms2 on Ubuntu 18.04 LTS,
  Ubuntu 16.04 LTS,
  Ubuntu 14.04 LTS.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"liblcms2-2", ver:"2.5-0ubuntu4.2", rls:"UBUNTU14.04 LTS", remove_arch:TRUE)) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"liblcms2-utils", ver:"2.5-0ubuntu4.2", rls:"UBUNTU14.04 LTS", remove_arch:TRUE)) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU18.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"liblcms2-2", ver:"2.9-1ubuntu0.1", rls:"UBUNTU18.04 LTS", remove_arch:TRUE)) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"liblcms2-utils", ver:"2.9-1ubuntu0.1", rls:"UBUNTU18.04 LTS", remove_arch:TRUE)) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"liblcms2-2", ver:"2.6-3ubuntu2.1", rls:"UBUNTU16.04 LTS", remove_arch:TRUE)) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"liblcms2-utils", ver:"2.6-3ubuntu2.1", rls:"UBUNTU16.04 LTS", remove_arch:TRUE)) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
