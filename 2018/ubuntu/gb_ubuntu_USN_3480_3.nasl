###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3480_3.nasl 12130 2018-10-26 13:59:17Z cfischer $
#
# Ubuntu Update for apport USN-3480-3
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
  script_oid("1.3.6.1.4.1.25623.1.0.843719");
  script_version("$Revision: 12130 $");
  script_cve_id("CVE-2017-14177", "CVE-2017-14180");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 15:59:17 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-10-26 06:11:02 +0200 (Fri, 26 Oct 2018)");
  script_name("Ubuntu Update for apport USN-3480-3");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(17\.10|17\.04|16\.04 LTS)");

  script_xref(name:"USN", value:"3480-3");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3480-3/");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'apport'
  package(s) announced via the USN-3480-3 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"USN-3480-2 fixed regressions in Apport. The update introduced a new
regression in the container support. This update addresses the problem.

We apologize for the inconvenience.

Original advisory details:

Sander Bos discovered that Apport incorrectly handled core dumps for
setuid binaries. A local attacker could use this issue to perform a
denial of service via resource exhaustion or possibly gain root
privileges. (CVE-2017-14177)

Sander Bos discovered that Apport incorrectly handled core dumps for
processes in a different PID namespace. A local attacker could use
this issue to perform a denial of service via resource exhaustion or
possibly gain root privileges. (CVE-2017-14180)");

  script_tag(name:"affected", value:"apport on Ubuntu 17.10,
  Ubuntu 17.04,
  Ubuntu 16.04 LTS.");

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

if(release == "UBUNTU17.10")
{

  if ((res = isdpkgvuln(pkg:"apport", ver:"2.20.7-0ubuntu3.7", rls:"UBUNTU17.10", remove_arch:TRUE)) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU17.04")
{

  if ((res = isdpkgvuln(pkg:"apport", ver:"2.20.4-0ubuntu4.10", rls:"UBUNTU17.04", remove_arch:TRUE)) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"apport", ver:"2.20.1-0ubuntu2.15", rls:"UBUNTU16.04 LTS", remove_arch:TRUE)) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
