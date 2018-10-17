###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_2239_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for linux-lts-saucy USN-2239-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.841848");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2014-06-09 14:59:15 +0530 (Mon, 09 Jun 2014)");
  script_cve_id("CVE-2014-3153", "CVE-2014-0155", "CVE-2014-2568", "CVE-2014-3122");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Ubuntu Update for linux-lts-saucy USN-2239-1");


  script_tag(name:"affected", value:"linux-lts-saucy on Ubuntu 12.04 LTS");
  script_tag(name:"insight", value:"Pinkie Pie discovered a flaw in the Linux kernel's futex
subsystem. An unprivileged local user could exploit this flaw to cause a denial
of service (system crash) or gain administrative privileges. (CVE-2014-3153)

A flaw was discovered in the Linux kernel virtual machine's (kvm)
validation of interrupt requests (irq). A guest OS user could exploit this
flaw to cause a denial of service (host OS crash). (CVE-2014-0155)

An information leak was discovered in the netfilter subsystem of the Linux
kernel. An attacker could exploit this flaw to obtain sensitive information
from kernel memory. (CVE-2014-2568)

Sasha Levin reported a bug in the Linux kernel's virtual memory management
subsystem. An unprivileged local user could exploit this flaw to cause a
denial of service (system crash). (CVE-2014-3122)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"USN", value:"2239-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2239-1/");
  script_tag(name:"summary", value:"Check for the Version of linux-lts-saucy");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU12\.04 LTS");
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

  if ((res = isdpkgvuln(pkg:"linux-image-3.11.0-23-generic", ver:"3.11.0-23.40~precise1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.11.0-23-generic-lpae", ver:"3.11.0-23.40~precise1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
