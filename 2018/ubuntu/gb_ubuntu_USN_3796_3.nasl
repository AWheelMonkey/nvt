###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3796_3.nasl 13032 2019-01-11 07:56:51Z mmartin $
#
# Ubuntu Update for paramiko USN-3796-3
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
  script_oid("1.3.6.1.4.1.25623.1.0.843713");
  script_version("$Revision: 13032 $");
  script_cve_id("CVE-2018-1000805");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2019-01-11 08:56:51 +0100 (Fri, 11 Jan 2019) $");
  script_tag(name:"creation_date", value:"2018-10-26 06:10:11 +0200 (Fri, 26 Oct 2018)");
  script_name("Ubuntu Update for paramiko USN-3796-3");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU18\.10");

  script_xref(name:"USN", value:"3796-3");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3796-3/");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'paramiko'
  package(s) announced via the USN-3796-3 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"USN-3796-1 fixed a vulnerability in Paramiko. This update provides the
corresponding update for Ubuntu 18.10.

Original advisory details:

Daniel Hoffman discovered that Paramiko incorrectly handled authentication
when being used as a server. A remote attacker could use this issue to
bypass authentication without any credentials.");

  script_tag(name:"affected", value:"paramiko on Ubuntu 18.10.");

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

if(release == "UBUNTU18.10")
{

  if ((res = isdpkgvuln(pkg:"python-paramiko", ver:"2.4.1-0ubuntu3.1", rls:"UBUNTU18.10", remove_arch:TRUE)) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"python3-paramiko", ver:"2.4.1-0ubuntu3.1", rls:"UBUNTU18.10", remove_arch:TRUE)) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
