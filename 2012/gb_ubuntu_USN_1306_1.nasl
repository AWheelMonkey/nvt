###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1306_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for firefox USN-1306-1
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
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-1306-1/");
  script_oid("1.3.6.1.4.1.25623.1.0.840857");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2012-01-09 13:29:54 +0530 (Mon, 09 Jan 2012)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name:"USN", value:"1306-1");
  script_cve_id("CVE-2011-3660", "CVE-2011-3661", "CVE-2011-3658", "CVE-2011-3663", "CVE-2011-3665");
  script_name("Ubuntu Update for firefox USN-1306-1");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU11\.04");
  script_tag(name:"summary", value:"Ubuntu Update for Linux kernel vulnerabilities USN-1306-1");
  script_tag(name:"affected", value:"firefox on Ubuntu 11.04");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"Alexandre Poirot, Chris Blizzard, Kyle Huey, Scoobidiver, Christian Holler,
  David Baron, Gary Kwong, Jim Blandy, Bob Clary, Jesse Ruderman, Marcia
  Knous, and Rober Longson discovered several memory safety issues which
  could possibly be exploited to crash Firefox or execute arbitrary code as
  the user that invoked Firefox. (CVE-2011-3660)

  Aki Helin discovered a crash in the YARR regular expression library that
  could be triggered by javascript in web content. (CVE-2011-3661)

  It was discovered that a flaw in the Mozilla SVG implementation could
  result in an out-of-bounds memory access if SVG elements were removed
  during a DOMAttrModified event handler. An attacker could potentially
  exploit this vulnerability to crash Firefox. (CVE-2011-3658)

  Mario Heiderich discovered it was possible to use SVG animation accessKey
  events to detect key strokes even when JavaScript was disabled. A malicious
  web page could potentially exploit this to trick a user into interacting
  with a prompt thinking it came from the browser in a context where the user
  believed scripting was disabled. (CVE-2011-3663)

  It was discovered that it was possible to crash Firefox when scaling an OGG
  &lt;video&gt; element to extreme sizes. (CVE-2011-3665)");
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

  if ((res = isdpkgvuln(pkg:"firefox", ver:"9.0.1+build1-0ubuntu0.11.04.1", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
