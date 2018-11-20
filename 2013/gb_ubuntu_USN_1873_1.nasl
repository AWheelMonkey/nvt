###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1873_1.nasl 12381 2018-11-16 11:16:30Z cfischer $
#
# Ubuntu Update for telepathy-gabble USN-1873-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.841471");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2013-06-13 10:17:45 +0530 (Thu, 13 Jun 2013)");
  script_cve_id("CVE-2013-1431", "CVE-2013-1769");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_name("Ubuntu Update for telepathy-gabble USN-1873-1");

  script_xref(name:"USN", value:"1873-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-1873-1/");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'telepathy-gabble'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(12\.04 LTS|12\.10|13\.04)");
  script_tag(name:"affected", value:"telepathy-gabble on Ubuntu 13.04,
  Ubuntu 12.10,
  Ubuntu 12.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"Maksim Otstavnov discovered that telepathy-gabble incorrectly handled
  TLS when connecting to legacy jabber servers. If a remote attacker were
  able to perform a man-in-the-middle attack, this flaw could be exploited to
  view sensitive information. (CVE-2013-1431)

  It was discovered that telepathy-gabble incorrectly handled certain
  messages. A remote attacker could use this flaw to cause applications using
  telepathy-gabble to crash, resulting in a denial of service. This issue
  only affected Ubuntu 12.04 LTS and Ubuntu 12.10. (CVE-2013-1769)");
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

if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"telepathy-gabble", ver:"0.16.0-0ubuntu3.1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU12.10")
{
  ## Updated package version from 0.16.1-2ubuntu0.1 to 0.16.1-2
  if ((res = isdpkgvuln(pkg:"telepathy-gabble", ver:"0.16.1-2", rls:"UBUNTU12.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU13.04")
{
  ## Updated package version from 0.16.5-0ubuntu1.1 to 0.16.5-0ubuntu1
  if ((res = isdpkgvuln(pkg:"telepathy-gabble", ver:"0.16.5-0ubuntu1", rls:"UBUNTU13.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
