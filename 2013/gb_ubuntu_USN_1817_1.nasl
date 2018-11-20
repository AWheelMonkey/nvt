###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1817_1.nasl 12381 2018-11-16 11:16:30Z cfischer $
#
# Ubuntu Update for libxml2 USN-1817-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.841420");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2013-05-09 10:26:29 +0530 (Thu, 09 May 2013)");
  script_cve_id("CVE-2013-1969");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("Ubuntu Update for libxml2 USN-1817-1");

  script_xref(name:"USN", value:"1817-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-1817-1/");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'libxml2'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU13\.04");
  script_tag(name:"affected", value:"libxml2 on Ubuntu 13.04");
  script_tag(name:"insight", value:"It was discovered that libxml2 incorrectly handled memory management when
  parsing certain XML files. An attacker could use this flaw to cause libxml2
  to crash, resulting in a denial of service, or to possibly execute
  arbitrary code.");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
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

## Package name is changed to libxml2:i386
if(release == "UBUNTU13.04")
{

  if ((res = isdpkgvuln(pkg:"libxml2:i386", ver:"2.9.0+dfsg1-4ubuntu4.1", rls:"UBUNTU13.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
