###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1617_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for webkit USN-1617-1
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
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-1617-1/");
  script_oid("1.3.6.1.4.1.25623.1.0.841198");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2012-10-26 09:44:32 +0530 (Fri, 26 Oct 2012)");
  script_cve_id("CVE-2011-3031", "CVE-2011-3038", "CVE-2011-3042", "CVE-2011-3043", "CVE-2011-3044", "CVE-2011-3051", "CVE-2011-3053", "CVE-2011-3059", "CVE-2011-3060", "CVE-2011-3064", "CVE-2011-3067", "CVE-2011-3076", "CVE-2011-3081", "CVE-2011-3086", "CVE-2011-3090", "CVE-2012-1521", "CVE-2012-3598", "CVE-2012-3601", "CVE-2012-3604", "CVE-2012-3611", "CVE-2012-3612", "CVE-2012-3617", "CVE-2012-3625", "CVE-2012-3626", "CVE-2012-3627", "CVE-2012-3628", "CVE-2012-3645", "CVE-2012-3652", "CVE-2012-3657", "CVE-2012-3669", "CVE-2012-3670", "CVE-2012-3671", "CVE-2012-3672", "CVE-2012-3674");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name:"USN", value:"1617-1");
  script_name("Ubuntu Update for webkit USN-1617-1");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU12\.04 LTS");
  script_tag(name:"summary", value:"Ubuntu Update for Linux kernel vulnerabilities USN-1617-1");
  script_tag(name:"affected", value:"webkit on Ubuntu 12.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"A large number of security issues were discovered in the WebKit browser and
  JavaScript engines. If a user were tricked into viewing a malicious
  website, a remote attacker could exploit a variety of issues related to web
  browser security, including cross-site scripting attacks, denial of
  service attacks, and arbitrary code execution.");
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

  if ((res = isdpkgvuln(pkg:"libjavascriptcoregtk-1.0-0", ver:"1.8.3-0ubuntu0.12.04.1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libjavascriptcoregtk-3.0-0", ver:"1.8.3-0ubuntu0.12.04.1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libwebkitgtk-1.0-0", ver:"1.8.3-0ubuntu0.12.04.1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libwebkitgtk-3.0-0", ver:"1.8.3-0ubuntu0.12.04.1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
