###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1583_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for ruby1.9.1 USN-1583-1
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
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-1583-1/");
  script_oid("1.3.6.1.4.1.25623.1.0.841163");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2012-09-27 09:07:41 +0530 (Thu, 27 Sep 2012)");
  script_cve_id("CVE-2011-1005", "CVE-2012-2126", "CVE-2012-2125");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:N");
  script_xref(name:"USN", value:"1583-1");
  script_name("Ubuntu Update for ruby1.9.1 USN-1583-1");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU12\.04 LTS");
  script_tag(name:"summary", value:"Ubuntu Update for Linux kernel vulnerabilities USN-1583-1");
  script_tag(name:"affected", value:"ruby1.9.1 on Ubuntu 12.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"It was discovered that Ruby incorrectly allowed untainted strings to be
  modified in protective safe levels. An attacker could use this flaw to bypass
  intended access restrictions. (CVE-2011-1005)

  John Firebaugh discovered that the RubyGems remote gem fetcher did not properly
  verify SSL certificates. A remote attacker could exploit this to perform a man
  in the middle attack to alter gem files being downloaded for installation.
  (CVE-2012-2126)

  John Firebaugh discovered that the RubyGems remote gem fetcher allowed
  redirection from HTTPS to HTTP. A remote attacker could exploit this to perform
  a man in the middle attack to alter gem files being downloaded for
  installation. (CVE-2012-2125)");
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

  if ((res = isdpkgvuln(pkg:"libruby1.9.1", ver:"1.9.3.0-1ubuntu2.2", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
