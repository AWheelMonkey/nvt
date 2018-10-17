###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1122_3.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for thunderbird USN-1122-3
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-1122-3/");
  script_oid("1.3.6.1.4.1.25623.1.0.840675");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2011-06-10 16:29:51 +0200 (Fri, 10 Jun 2011)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name:"USN", value:"1122-3");
  script_cve_id("CVE-2011-0081", "CVE-2011-0069", "CVE-2011-0070", "CVE-2011-0080", "CVE-2011-0074", "CVE-2011-0075", "CVE-2011-0077", "CVE-2011-0078", "CVE-2011-0072", "CVE-2011-0065", "CVE-2011-0066", "CVE-2011-0073", "CVE-2011-0067", "CVE-2011-0071", "CVE-2011-1202");
  script_name("Ubuntu Update for thunderbird USN-1122-3");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU11\.04");
  script_tag(name:"summary", value:"Ubuntu Update for Linux kernel vulnerabilities USN-1122-3");
  script_tag(name:"affected", value:"thunderbird on Ubuntu 11.04");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"USN-1122-2 fixed vulnerabilities in Thunderbird on Ubuntu 11.04. A
  regression was introduced which caused Thunderbird to display an empty menu
  bar. This update fixes the problem. We apologize for the inconvenience.

  Original advisory details:

  It was discovered that there was a vulnerability in the memory handling of
  certain types of content. An attacker could exploit this to possibly run
  arbitrary code as the user running Thunderbird. (CVE-2011-0081)

  It was discovered that Thunderbird incorrectly handled certain JavaScript
  requests. If JavaScript were enabled, an attacker could exploit this to
  possibly run arbitrary code as the user running Thunderbird.
  (CVE-2011-0069)

  Ian Beer discovered a vulnerability in the memory handling of a certain
  types of documents. An attacker could exploit this to possibly run
  arbitrary code as the user running Thunderbird. (CVE-2011-0070)

  Bob Clary, Henri Sivonen, Marco Bonardo, Mats Palmgren and Jesse Ruderman
  discovered several memory vulnerabilities. An attacker could exploit these
  to possibly run arbitrary code as the user running Thunderbird.
  (CVE-2011-0080)

  Aki Helin discovered multiple vulnerabilities in the HTML rendering code.
  An attacker could exploit these to possibly run arbitrary code as the user
  running Thunderbird. (CVE-2011-0074, CVE-2011-0075)

  Ian Beer discovered multiple overflow vulnerabilities. An attacker could
  exploit these to possibly run arbitrary code as the user running
  Thunderbird. (CVE-2011-0077, CVE-2011-0078)

  Martin Barbella discovered a memory vulnerability in the handling of
  certain DOM elements. An attacker could exploit this to possibly run
  arbitrary code as the user running Thunderbird. (CVE-2011-0072)

  It was discovered that there were use-after-free vulnerabilities in
  Thunderbird's mChannel and mObserverList objects. An attacker could exploit
  these to possibly run arbitrary code as the user running Thunderbird.
  (CVE-2011-0065, CVE-2011-0066)

  It was discovered that there was a vulnerability in the handling of the
  nsTreeSelection element. An attacker sending a specially crafted E-Mail
  could exploit this to possibly run arbitrary code as the user running
  Thunderbird. (CVE-2011-0073)

  Paul Stone discovered a vulnerability in the handling of Java applets. If
  plugins were enabled, an attacker could use this to mimic interaction with
  form autocomplete controls and steal entries from the form history.
  (CVE-2011-0067)

  Soroush Dalili discovered a vulnerability in the resource: protocol. This
  could potentially allow an att ...

  Description truncated, for more information please check the Reference URL");
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

  if ((res = isdpkgvuln(pkg:"thunderbird-globalmenu", ver:"3.1.10+build1+nobinonly-0ubuntu0.11.04.2", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
