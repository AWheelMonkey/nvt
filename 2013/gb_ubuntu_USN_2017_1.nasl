###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_2017_1.nasl 12381 2018-11-16 11:16:30Z cfischer $
#
# Ubuntu Update for linux USN-2017-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.841617");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2013-11-18 15:42:09 +0530 (Mon, 18 Nov 2013)");
  script_cve_id("CVE-2012-5374", "CVE-2012-5375", "CVE-2013-2147");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:N/C:N/I:N/A:C");
  script_name("Ubuntu Update for linux USN-2017-1");


  script_tag(name:"affected", value:"linux on Ubuntu 12.04 LTS");
  script_tag(name:"insight", value:"A denial of service flaw was discovered in the Btrfs file
system in the Linux kernel. A local user could cause a denial of service by
creating a large number of files with names that have the same CRC32 hash
value. (CVE-2012-5374)

A denial of service flaw was discovered in the Btrfs file system in the
Linux kernel. A local user could cause a denial of service (prevent file
creation) for a victim, by creating a file with a specific CRC32C hash
value in a directory important to the victim. (CVE-2012-5375)

Dan Carpenter discovered an information leak in the HP Smart Aray and
Compaq SMART2 disk-array driver in the Linux kernel. A local user could
exploit this flaw to obtain sensitive information from kernel memory.
(CVE-2013-2147)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"USN", value:"2017-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2017-1/");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'linux'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
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

  if ((res = isdpkgvuln(pkg:"linux-image-3.2.0-56-generic", ver:"3.2.0-56.86", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.2.0-56-generic-pae", ver:"3.2.0-56.86", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.2.0-56-highbank", ver:"3.2.0-56.86", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.2.0-56-omap", ver:"3.2.0-56.86", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.2.0-56-powerpc-smp", ver:"3.2.0-56.86", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.2.0-56-powerpc64-smp", ver:"3.2.0-56.86", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.2.0-56-virtual", ver:"3.2.0-56.86", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
