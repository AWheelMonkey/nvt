###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_2169_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for python-django USN-2169-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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

include("revisions-lib.inc");

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.841784");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2014-05-02 10:10:57 +0530 (Fri, 02 May 2014)");
  script_cve_id("CVE-2014-0472", "CVE-2014-0473", "CVE-2014-0474");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Ubuntu Update for python-django USN-2169-1");


  script_tag(name:"affected", value:"python-django on Ubuntu 13.10,
  Ubuntu 12.10,
  Ubuntu 12.04 LTS,
  Ubuntu 10.04 LTS");
  script_tag(name:"insight", value:"Benjamin Bach discovered that Django incorrectly handled
dotted Python paths when using the reverse() function. An attacker could use
this issue to cause Django to import arbitrary modules from the Python path,
resulting in possible code execution. (CVE-2014-0472)

Paul McMillan discovered that Django incorrectly cached certain pages that
contained CSRF cookies. An attacker could possibly use this flaw to obtain
a valid cookie and perform attacks which bypass the CSRF restrictions.
(CVE-2014-0473)

Michael Koziarski discovered that Django did not always perform explicit
conversion of certain fields when using a MySQL database. An attacker
could possibly use this issue to obtain unexpected results. (CVE-2014-0474)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"USN", value:"2169-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2169-1/");
  script_tag(name:"summary", value:"Check for the Version of python-django");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(12\.04 LTS|10\.04 LTS|13\.10|12\.10)");
  exit(0);
}


include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"python-django", ver:"1.3.1-4ubuntu1.9", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU10.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"python-django", ver:"1.1.1-2ubuntu1.10", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU13.10")
{

  if ((res = isdpkgvuln(pkg:"python-django", ver:"1.5.4-1ubuntu1.1", rls:"UBUNTU13.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU12.10")
{

  if ((res = isdpkgvuln(pkg:"python-django", ver:"1.4.1-2ubuntu0.5", rls:"UBUNTU12.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
