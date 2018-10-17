###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for firefox USN-3124-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.842953");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2016-11-19 05:36:56 +0100 (Sat, 19 Nov 2016)");
  script_cve_id("CVE-2016-5289", "CVE-2016-5290", "CVE-2016-5291", "CVE-2016-5292",
		"CVE-2016-5296", "CVE-2016-5297", "CVE-2016-9063", "CVE-2016-9064",
		"CVE-2016-9066", "CVE-2016-9067", "CVE-2016-9069", "CVE-2016-9068",
		"CVE-2016-9070", "CVE-2016-9071", "CVE-2016-9073", "CVE-2016-9075",
		"CVE-2016-9076", "CVE-2016-9077");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for firefox USN-3124-1");
  script_tag(name:"summary", value:"Check the version of firefox");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Christian Holler, Andrew McCreight, Dan
  Minor, Tyson Smith, Jon Coppeard, Jan-Ivar Bruaroey, Jesse Ruderman, Markus
  Stange, Olli Pettay, Ehsan Akhgari, Gary Kwong, Tooru Fujisawa, and Randell
  Jesup discovered multiple memory safety issues in Firefox. If a user were
  tricked in to opening a specially crafted website, an attacker could potentially
  exploit these to cause a denial of service via application crash, or execute
  arbitrary code. (CVE-2016-5289, CVE-2016-5290)

A same-origin policy bypass was discovered with local HTML files in some
circumstances. An attacker could potentially exploit this to obtain
sensitive information. (CVE-2016-5291)

A crash was discovered when parsing URLs in some circumstances. If a user
were tricked in to opening a specially crafted website, an attacker could
potentially exploit this to execute arbitrary code. (CVE-2016-5292)

A heap buffer-overflow was discovered in Cairo when processing SVG
content. If a user were tricked in to opening a specially crafted website,
an attacker could potentially exploit this to cause a denial of service
via application crash, or execute arbitrary code. (CVE-2016-5296)

An error was discovered in argument length checking in Javascript. If a
user were tricked in to opening a specially crafted website, an attacker
could potentially exploit this to cause a denial of service via
application crash, or execute arbitrary code. (CVE-2016-5297)

An integer overflow was discovered in the Expat library. If a user were
tricked in to opening a specially crafted website, an attacker could
potentially exploit this to cause a denial of service via application
crash. (CVE-2016-9063)

It was discovered that addon updates failed to verify that the addon ID
inside the signed package matched the ID of the addon being updated.
An attacker that could perform a man-in-the-middle (MITM) attack could
potentially exploit this to provide malicious addon updates.
(CVE-2016-9064)

A buffer overflow was discovered in nsScriptLoadHandler. If a user were
tricked in to opening a specially crafted website, an attacker could
potentially exploit this to cause a denial of service via application
crash, or execute arbitrary code. (CVE-2016-9066)

2 use-after-free bugs were discovered during DOM operations in some
circumstances. If a user were tricked in to opening a specially crafted
website, an attacker could potentially exploit these to cause a denial of
service via application crash, or execute arbitrary code. (CVE-2016-9067,
CVE-2016-9069)

A heap use-after-free was discovered during web animations in some
circumstance ...

  Description truncated, for more information please check the Reference URL");
  script_tag(name:"affected", value:"firefox on Ubuntu 16.04 LTS,
  Ubuntu 16.10,
  Ubuntu 14.04 LTS,
  Ubuntu 12.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"USN", value:"3124-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3124-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(14\.04 LTS|12\.04 LTS|16\.04 LTS|16\.10)");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"firefox", ver:"50.0+build2-0ubuntu0.14.04.2", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"firefox", ver:"50.0+build2-0ubuntu0.12.04.2", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"firefox", ver:"50.0+build2-0ubuntu0.16.04.2", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU16.10")
{

  if ((res = isdpkgvuln(pkg:"firefox", ver:"50.0+build2-0ubuntu0.16.10.2", rls:"UBUNTU16.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
