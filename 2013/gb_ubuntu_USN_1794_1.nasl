###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1794_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for linux-ti-omap4 USN-1794-1
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
  script_tag(name:"affected", value:"linux-ti-omap4 on Ubuntu 12.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"Emese Revfy discovered that in the Linux kernel signal handlers could leak
  address information across an exec, making it possible to by pass ASLR
  (Address Space Layout Randomization). A local user could use this flaw to
  by pass ASLR to reliably deliver an exploit payload that would otherwise be
  stopped (by ASLR). (CVE-2013-0914)

  A memory use after free error was discover in the Linux kernel's tmpfs
  filesystem. A local user could exploit this flaw to gain privileges or
  cause a denial of service (system crash). (CVE-2013-1767)

  Mateusz Guzik discovered a race in the Linux kernel's keyring. A local user
  could exploit this flaw to cause a denial of service (system crash).
  (CVE-2013-1792)

  Mathias Krause discovered a memory leak in the Linux kernel's crypto report
  API. A local user with CAP_NET_ADMIN could exploit this leak to examine
  some of the kernel's stack memory. (CVE-2013-2546)

  Mathias Krause discovered a memory leak in the Linux kernel's crypto report
  API. A local user with CAP_NET_ADMIN could exploit this leak to examine
  some of the kernel's heap memory. (CVE-2013-2547)

  Mathias Krause discovered information leaks in the Linux kernel's crypto
  algorithm report API. A local user could exploit these flaws to leak kernel
  stack and heap memory contents. (CVE-2013-2548)");
  script_oid("1.3.6.1.4.1.25623.1.0.841390");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2013-04-15 10:16:54 +0530 (Mon, 15 Apr 2013)");
  script_cve_id("CVE-2013-0914", "CVE-2013-1767", "CVE-2013-1792", "CVE-2013-2546",
                "CVE-2013-2547", "CVE-2013-2548");
  script_tag(name:"cvss_base", value:"6.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_name("Ubuntu Update for linux-ti-omap4 USN-1794-1");

  script_xref(name:"USN", value:"1794-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-1794-1/");
  script_tag(name:"summary", value:"Check for the Version of linux-ti-omap4");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
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

  if ((res = isdpkgvuln(pkg:"linux-image-3.2.0-1429-omap4", ver:"3.2.0-1429.38", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
