###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1497_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for nova USN-1497-1
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

include("revisions-lib.inc");



if(description)
{
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-1497-1/");
  script_oid("1.3.6.1.4.1.25623.1.0.841074");
  script_tag(name:"cvss_base", value:"5.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:P/A:P");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2012-07-06 09:59:13 +0530 (Fri, 06 Jul 2012)");
  script_cve_id("CVE-2012-3360", "CVE-2012-3361");
  script_xref(name:"USN", value:"1497-1");
  script_name("Ubuntu Update for nova USN-1497-1");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(12\.04 LTS|11\.10)");
  script_tag(name:"summary", value:"Ubuntu Update for Linux kernel vulnerabilities USN-1497-1");
  script_tag(name:"affected", value:"nova on Ubuntu 12.04 LTS,
  Ubuntu 11.10");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"Matthias Weckbecker discovered that, when using the OpenStack API to
  setup libvirt-based hypervisors, an authenticated user could inject
  files in arbitrary locations on the file system of the host running
  Nova. A remote attacker could use this to gain root privileges. This
  issue only affects Ubuntu 12.04 LTS. (CVE-2012-3360)

  P&#225;draig Brady discovered that an authenticated user could corrupt
  arbitrary files of the host running Nova. A remote attacker could
  use this to cause a denial of service or possibly gain privileges.
  (CVE-2012-3361)");
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

  if ((res = isdpkgvuln(pkg:"python-nova", ver:"2012.1+stable~20120612-3ee026e-0ubuntu1.1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU11.10")
{

  if ((res = isdpkgvuln(pkg:"python-nova", ver:"2011.3-0ubuntu6.9", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
