###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1330_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for linux-ti-omap4 USN-1330-1
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
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-1330-1/");
  script_oid("1.3.6.1.4.1.25623.1.0.840933");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2012-03-16 10:50:09 +0530 (Fri, 16 Mar 2012)");
  script_cve_id("CVE-2011-2203", "CVE-2011-4077", "CVE-2011-4110", "CVE-2011-4132",
                "CVE-2011-4330");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name:"USN", value:"1330-1");
  script_name("Ubuntu Update for linux-ti-omap4 USN-1330-1");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU11\.10");
  script_tag(name:"summary", value:"Ubuntu Update for Linux kernel vulnerabilities USN-1330-1");
  script_tag(name:"affected", value:"linux-ti-omap4 on Ubuntu 11.10");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"Clement Lecigne discovered a bug in the HFS filesystem. A local attacker
  could exploit this to cause a kernel oops. (CVE-2011-2203)

  A bug was discovered in the XFS filesystem's handling of pathnames. A local
  attacker could exploit this to crash the system, leading to a denial of
  service, or gain root privileges. (CVE-2011-4077)

  A flaw was found in how the Linux kernel handles user-defined key types. An
  unprivileged local user could exploit this to crash the system.
  (CVE-2011-4110)

  A flaw was found in the Journaling Block Device (JBD). A local attacker
  able to mount ext3 or ext4 file systems could exploit this to crash the
  system, leading to a denial of service. (CVE-2011-4132)

  Clement Lecigne discovered a bug in the HFS file system bounds checking.
  When a malformed HFS file system is mounted a local user could crash the
  system or gain root privileges. (CVE-2011-4330)");
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

if(release == "UBUNTU11.10")
{

  if ((res = isdpkgvuln(pkg:"linux-image-3.0.0-1206-omap4", ver:"3.0.0-1206.15", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
