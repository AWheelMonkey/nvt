###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_2211_1.nasl 12381 2018-11-16 11:16:30Z cfischer $
#
# Ubuntu Update for libxfont USN-2211-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.841825");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2014-05-19 11:24:57 +0530 (Mon, 19 May 2014)");
  script_cve_id("CVE-2014-0209", "CVE-2014-0210", "CVE-2014-0211");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("Ubuntu Update for libxfont USN-2211-1");


  script_tag(name:"affected", value:"libxfont on Ubuntu 14.04 LTS,
  Ubuntu 13.10,
  Ubuntu 12.10,
  Ubuntu 12.04 LTS,
  Ubuntu 10.04 LTS");
  script_tag(name:"insight", value:"Ilja van Sprundel discovered that libXfont incorrectly handled
font metadata file parsing. A local attacker could use this issue to cause
libXfont to crash, or possibly execute arbitrary code in order to gain
privileges. (CVE-2014-0209)

Ilja van Sprundel discovered that libXfont incorrectly handled X Font
Server replies. A malicious font server could return specially-crafted data
that could cause libXfont to crash, or possibly execute arbitrary code.
This issue only affected Ubuntu 10.04 LTS, Ubuntu 12.04 LTS, Ubuntu 12.10
and Ubuntu 13.10. (CVE-2014-0210, CVE-2014-0211)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"USN", value:"2211-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2211-1/");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'libxfont'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(14\.04 LTS|12\.04 LTS|10\.04 LTS|13\.10|12\.10)");
  exit(0);
}


include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libxfont1:i386", ver:"1:1.4.7-1ubuntu0.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libxfont1", ver:"1:1.4.4-1ubuntu0.2", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU10.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libxfont1", ver:"1:1.4.1-1ubuntu0.3", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU13.10")
{

  if ((res = isdpkgvuln(pkg:"libxfont1:i386", ver:"1:1.4.6-1ubuntu0.2", rls:"UBUNTU13.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU12.10")
{

  if ((res = isdpkgvuln(pkg:"libxfont1", ver:"1:1.4.5-2ubuntu0.12.10.2", rls:"UBUNTU12.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
