###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_2346_1.nasl 12381 2018-11-16 11:16:30Z cfischer $
#
# Ubuntu Update for curl USN-2346-1
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.841967");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2014-09-16 06:03:56 +0200 (Tue, 16 Sep 2014)");
  script_cve_id("CVE-2014-3613", "CVE-2014-3620");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_name("Ubuntu Update for curl USN-2346-1");
  script_tag(name:"insight", value:"Tim Ruehsen discovered that curl
incorrectly handled partial literal IP addresses. This could lead to the
disclosure of cookies to the wrong site, and malicious sites being able to set
cookies for others. (CVE-2014-3613)

Tim Ruehsen discovered that curl incorrectly allowed cookies to be set
for Top Level Domains (TLDs). This could allow a malicious site to set a
cookie that gets sent to other sites. (CVE-2014-3620)");
  script_tag(name:"affected", value:"curl on Ubuntu 14.04 LTS,
  Ubuntu 12.04 LTS,
  Ubuntu 10.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"USN", value:"2346-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2346-1/");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'curl'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(14\.04 LTS|12\.04 LTS|10\.04 LTS)");
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

  if ((res = isdpkgvuln(pkg:"libcurl3:i386", ver:"7.35.0-1ubuntu2.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  ##Added to support for 64-bit architecture
  if ((res = isdpkgvuln(pkg:"libcurl3:amd64", ver:"7.35.0-1ubuntu2.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libcurl3-gnutls:i386", ver:"7.35.0-1ubuntu2.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  ##Added to support for 64-bit architecture
  if ((res = isdpkgvuln(pkg:"libcurl3-gnutls:amd64", ver:"7.35.0-1ubuntu2.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libcurl3-nss:i386", ver:"7.35.0-1ubuntu2.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  ##Added to support for 64-bit architecture
  if ((res = isdpkgvuln(pkg:"libcurl3-nss:amd64", ver:"7.35.0-1ubuntu2.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libcurl3", ver:"7.22.0-3ubuntu4.10", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libcurl3-gnutls", ver:"7.22.0-3ubuntu4.10", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libcurl3-nss", ver:"7.22.0-3ubuntu4.10", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU10.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libcurl3", ver:"7.19.7-1ubuntu1.9", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libcurl3-gnutls", ver:"7.19.7-1ubuntu1.9", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
