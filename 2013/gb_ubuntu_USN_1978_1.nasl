###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1978_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for libkdcraw USN-1978-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.841572");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2013-10-03 10:20:21 +0530 (Thu, 03 Oct 2013)");
  script_cve_id("CVE-2013-1438", "CVE-2013-1439");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_name("Ubuntu Update for libkdcraw USN-1978-1");


  script_tag(name:"affected", value:"libkdcraw on Ubuntu 12.04 LTS");
  script_tag(name:"insight", value:"It was discovered that libKDcraw incorrectly handled photo files. If a user
or automated system were tricked into processing a specially crafted photo
file, applications linked against libKDcraw could be made to crash,
resulting in a denial of service. (CVE-2013-1438, CVE-2013-1439)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"USN", value:"1978-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-1978-1/");
  script_tag(name:"summary", value:"Check for the Version of libkdcraw");
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

  if ((res = isdpkgvuln(pkg:"libkdcraw20", ver:"4:4.8.5-0ubuntu0.3", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}