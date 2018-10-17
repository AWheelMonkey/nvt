###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_2284_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for linux-ti-omap4 USN-2284-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.841904");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2014-07-21 18:03:43 +0530 (Mon, 21 Jul 2014)");
  script_cve_id("CVE-2014-4943", "CVE-2014-0131", "CVE-2014-4608");
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Ubuntu Update for linux-ti-omap4 USN-2284-1");


  script_tag(name:"affected", value:"linux-ti-omap4 on Ubuntu 12.04 LTS");
  script_tag(name:"insight", value:"Sasha Levin reported a flaw in the Linux kernel's
point-to-point protocol (PPP) when used with the Layer Two Tunneling Protocol
(L2TP). A local user could exploit this flaw to gain administrative privileges.
(CVE-2014-4943)

Michael S. Tsirkin discovered an information leak in the Linux kernel's
segmentation of skbs when using the zerocopy feature of vhost-net. A local
attacker could exploit this flaw to gain potentially sensitive information
from kernel memory. (CVE-2014-0131)

Don Bailey discovered a flaw in the LZO decompress algorithm used by the
Linux kernel. An attacker could exploit this flaw to cause a denial of
service (memory corruption or OOPS). (CVE-2014-4608)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"USN", value:"2284-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2284-1/");
  script_tag(name:"summary", value:"Check for the Version of linux-ti-omap4");
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

  if ((res = isdpkgvuln(pkg:"linux-image-3.2.0-1451-omap4", ver:"3.2.0-1451.71", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
