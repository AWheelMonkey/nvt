###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1722_1.nasl 12381 2018-11-16 11:16:30Z cfischer $
#
# Ubuntu Update for jquery USN-1722-1
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
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-1722-1/");
  script_oid("1.3.6.1.4.1.25623.1.0.841318");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2013-02-15 11:25:28 +0530 (Fri, 15 Feb 2013)");
  script_cve_id("CVE-2011-4969");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_xref(name:"USN", value:"1722-1");
  script_name("Ubuntu Update for jquery USN-1722-1");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'jquery'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(11\.10|10\.04 LTS)");
  script_tag(name:"affected", value:"jquery on Ubuntu 11.10,
  Ubuntu 10.04 LTS");
  script_tag(name:"insight", value:"It was discovered that jQuery incorrectly handled selecting elements using
  location.hash, resulting in a possible cross-site scripting (XSS) issue.
  With cross-site scripting vulnerabilities, if a user were tricked into
  viewing a specially crafted page, a remote attacker could exploit this to
  modify the contents, or steal confidential data, within the same domain.");
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

if(release == "UBUNTU11.10")
{

  if ((res = isdpkgvuln(pkg:"libjs-jquery", ver:"1.6.2-1ubuntu2.2", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU10.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libjs-jquery", ver:"1.3.3-2ubuntu1.2", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
