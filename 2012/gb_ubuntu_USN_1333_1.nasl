###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1333_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for libav USN-1333-1
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
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-1333-1/");
  script_oid("1.3.6.1.4.1.25623.1.0.840867");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2012-01-20 11:00:16 +0530 (Fri, 20 Jan 2012)");
  script_cve_id("CVE-2011-3504", "CVE-2011-4351", "CVE-2011-4352", "CVE-2011-4353", "CVE-2011-4364", "CVE-2011-4579");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name:"USN", value:"1333-1");
  script_name("Ubuntu Update for libav USN-1333-1");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU11\.04");
  script_tag(name:"summary", value:"Ubuntu Update for Linux kernel vulnerabilities USN-1333-1");
  script_tag(name:"affected", value:"libav on Ubuntu 11.04");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"Steve Manzuik discovered that Libav incorrectly handled certain malformed
  Matroska files. If a user were tricked into opening a crafted Matroska
  file, an attacker could cause a denial of service via application crash, or
  possibly execute arbitrary code with the privileges of the user invoking
  the program. This issue only affected Ubuntu 11.04. (CVE-2011-3504)

  Phillip Langlois discovered that Libav incorrectly handled certain
  malformed QDM2 streams. If a user were tricked into opening a crafted QDM2
  stream file, an attacker could cause a denial of service via application
  crash, or possibly execute arbitrary code with the privileges of the user
  invoking the program. (CVE-2011-4351)

  Phillip Langlois discovered that Libav incorrectly handled certain
  malformed VP3 streams. If a user were tricked into opening a crafted file,
  an attacker could cause a denial of service via application crash, or
  possibly execute arbitrary code with the privileges of the user invoking
  the program. (CVE-2011-4352)

  Phillip Langlois discovered that Libav incorrectly handled certain
  malformed VP5 and VP6 streams. If a user were tricked into opening a
  crafted file, an attacker could cause a denial of service via application
  crash, or possibly execute arbitrary code with the privileges of the user
  invoking the program. (CVE-2011-4353)

  It was discovered that Libav incorrectly handled certain malformed VMD
  files. If a user were tricked into opening a crafted VMD file, an attacker
  could cause a denial of service via application crash, or possibly execute
  arbitrary code with the privileges of the user invoking the program.
  (CVE-2011-4364)

  Phillip Langlois discovered that Libav incorrectly handled certain
  malformed SVQ1 streams. If a user were tricked into opening a crafted SVQ1
  stream file, an attacker could cause a denial of service via application
  crash, or possibly execute arbitrary code with the privileges of the user
  invoking the program. (CVE-2011-4579)");
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

if(release == "UBUNTU11.04")
{

  if ((res = isdpkgvuln(pkg:"libavcodec52", ver:"4:0.6.4-0ubuntu0.11.04.1", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libavformat52", ver:"4:0.6.4-0ubuntu0.11.04.1", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
