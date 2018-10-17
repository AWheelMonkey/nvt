###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for firefox USN-2833-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.842560");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2015-12-16 05:50:34 +0100 (Wed, 16 Dec 2015)");
  script_cve_id("CVE-2015-7201", "CVE-2015-7202", "CVE-2015-7203", "CVE-2015-7220",
                "CVE-2015-7221", "CVE-2015-7204", "CVE-2015-7205", "CVE-2015-7207",
                "CVE-2015-7208", "CVE-2015-7210", "CVE-2015-7211", "CVE-2015-7212",
                "CVE-2015-7213", "CVE-2015-7214", "CVE-2015-7215", "CVE-2015-7216",
                "CVE-2015-7217", "CVE-2015-7218", "CVE-2015-7219", "CVE-2015-7222",
                "CVE-2015-7223");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for firefox USN-2833-1");
  script_tag(name:"summary", value:"Check the version of firefox");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Andrei Vaida, Jesse Ruderman, Bob Clary,
Christian Holler, Jesse Ruderman, Eric Rahm, Robert Kaiser, Harald Kirschner, and
Michael Henretty discovered multiple memory safety issues in Firefox. If a user
were tricked in to opening a specially crafted website, an attacker could
potentially exploit these to cause a denial of service via application
crash, or execute arbitrary code with the privileges of the user invoking
Firefox. (CVE-2015-7201, CVE-2015-7202)

Ronald Crane discovered three buffer overflows through code inspection.
If a user were tricked in to opening a specially crafted website, an
attacker could potentially exploit these to cause a denial of service via
application crash, or execute arbitrary code with the privileges of the
user invoking Firefox. (CVE-2015-7203, CVE-2015-7220, CVE-2015-7221)

Cajus Pollmeier discovered a crash during javascript variable assignments
in some circumstances. If a user were tricked in to opening a specially
crafted website, an attacker could potentially exploit this to execute
arbitrary code with the privileges of the user invoking Firefox.
(CVE-2015-7204)

Ronald Crane discovered a buffer overflow through code inspection. If a
user were tricked in to opening a specially crafted website, an attacker
could potentially exploit this to cause a denial of service via
application crash, or execute arbitrary code with the privileges of the
user invoking Firefox. (CVE-2015-7205)

It was discovered that it is possible to read cross-origin URLs following
a redirect if performance.getEntries() is used with an iframe to host a
page. If a user were tricked in to opening a specially crafted website, an
attacker could potentially exploit this to bypass same-origin
restrictions. (CVE-2015-7207)

It was discovered that Firefox allows for control characters to be set in
cookies. An attacker could potentially exploit this to conduct cookie
injection attacks on some web servers. (CVE-2015-7208)

Looben Yang discovered a use-after-free in WebRTC when closing channels in
some circumstances. If a user were tricked in to opening a specially
crafted website, an attacker could potentially exploit this to cause a
denial of service via application crash, or execute arbitrary code with
the privileges of the user invoking Firefox. (CVE-2015-7210)

Abdulrahman Alqabandi discovered that hash symbol is incorrectly handled
when parsing data: URLs. An attacker could potentially exploit this to
conduct URL spoofing attacks. (CVE-2015-7211)

Abhishek Arya discovered an integer overflow when allocating large
textures. If a user ...

  Description truncated, for more information please check the Reference URL");
  script_tag(name:"affected", value:"firefox on Ubuntu 15.10,
  Ubuntu 15.04,
  Ubuntu 14.04 LTS,
  Ubuntu 12.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_xref(name:"USN", value:"2833-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2833-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(15\.04|14\.04 LTS|12\.04 LTS|15\.10)");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU15.04")
{

  if ((res = isdpkgvuln(pkg:"firefox", ver:"43.0+build1-0ubuntu0.15.04.1", rls:"UBUNTU15.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"firefox", ver:"43.0+build1-0ubuntu0.14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"firefox", ver:"43.0+build1-0ubuntu0.12.04.1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU15.10")
{

  if ((res = isdpkgvuln(pkg:"firefox", ver:"43.0+build1-0ubuntu0.15.10.1", rls:"UBUNTU15.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
