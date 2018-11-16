###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_864.nasl 12252 2018-11-08 07:19:31Z asteins $
#
# Auto-generated from advisory DLA 864-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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
  script_oid("1.3.6.1.4.1.25623.1.0.890864");
  script_version("$Revision: 12252 $");
  script_cve_id("CVE-2016-3822");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 864-1] jhead security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-11-08 08:19:31 +0100 (Thu, 08 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-01-12 00:00:00 +0100 (Fri, 12 Jan 2018)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2017/03/msg00021.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB7\.[0-9]+");
  script_tag(name:"affected", value:"jhead on Debian Linux");
  script_tag(name:"insight", value:"jhead is a command line driven utility for extracting digital camera settings
from the Exif format files used by many digital cameras. It handles the
various confusing ways these can be expressed, and displays them as F-stop,
shutter speed, etc. It is also able to reduce the size of digital camera JPEGs
without loss of information, by deleting integral thumbnails that digital
cameras put into the Exif header.");
  script_tag(name:"solution", value:"For Debian 7 'Wheezy', this issue has been fixed in jhead version
1:2.95-1+deb7u1.

We recommend that you upgrade your jhead packages.");
  script_tag(name:"summary",  value:"It was discovered that there was a vulnerability in jhead, a tool to manipulate
the non-image part of EXIF-compliant JPEG files. Remote attackers were able to
execute arbitrary code via crafted image data.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"jhead", ver:"1:2.95-1+deb7u1", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
