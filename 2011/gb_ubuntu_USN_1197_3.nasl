###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1197_3.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for firefox USN-1197-3
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-1197-3/");
  script_oid("1.3.6.1.4.1.25623.1.0.840735");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2011-09-12 16:29:49 +0200 (Mon, 12 Sep 2011)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_xref(name:"USN", value:"1197-3");
  script_name("Ubuntu Update for firefox USN-1197-3");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(10\.10|10\.04 LTS|11\.04)");
  script_tag(name:"summary", value:"Ubuntu Update for Linux kernel vulnerabilities USN-1197-3");
  script_tag(name:"affected", value:"firefox on Ubuntu 11.04,
  Ubuntu 10.10,
  Ubuntu 10.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"USN-1197-1 partially addressed an issue with Dutch Certificate Authority
  DigiNotar mis-issuing fraudulent certificates. This update actively
  distrusts the DigiNotar root certificate as well as several intermediary
  certificates. Also included in this list of distrusted certificates are the
  Staat der Nederlanden root certificates.

  Original advisory details:

  It was discovered that Dutch Certificate Authority DigiNotar, had
  mis-issued multiple fraudulent certificates. These certificates could allow
  an attacker to perform a &quot;man in the middle&quot; (MITM) attack which would make
  the user believe their connection is secure, but is actually being
  monitored.

  For the protection of its users, Mozilla has removed the DigiNotar
  certificate. Sites using certificates issued by DigiNotar will need to seek
  another certificate vendor.

  We are currently aware of a regression that blocks one of two Staat der
  Nederlanden root certificates which are believed to still be secure. This
  regression is being tracked at <A HREF='https://launchpad.net/bugs/838322.'>https://launchpad.net/bugs/838322.</A>");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();


res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU10.10")
{

  if ((res = isdpkgvuln(pkg:"firefox", ver:"3.6.22+build2+nobinonly-0ubuntu0.10.10.1", rls:"UBUNTU10.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"xulrunner-1.9.2", ver:"1.9.2.22+build2+nobinonly-0ubuntu0.10.10.1", rls:"UBUNTU10.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU10.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"firefox", ver:"3.6.22+build2+nobinonly-0ubuntu0.10.04.1", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"xulrunner-1.9.2", ver:"1.9.2.22+build2+nobinonly-0ubuntu0.10.04.1", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU11.04")
{

  if ((res = isdpkgvuln(pkg:"firefox", ver:"6.0.2+build2+nobinonly-0ubuntu0.11.04.1", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
