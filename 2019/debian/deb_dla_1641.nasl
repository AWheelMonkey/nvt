###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1641.nasl 13292 2019-01-25 11:51:29Z cfischer $
#
# Auto-generated from advisory DLA 1641-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2019 Greenbone Networks GmbH http://greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.891641");
  script_version("$Revision: 13292 $");
  script_cve_id("CVE-2016-4570", "CVE-2016-4571", "CVE-2018-20004");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1641-1] mxml security update)");
  script_tag(name:"last_modification", value:"$Date: 2019-01-25 12:51:29 +0100 (Fri, 25 Jan 2019) $");
  script_tag(name:"creation_date", value:"2019-01-25 00:00:00 +0100 (Fri, 25 Jan 2019)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2019/01/msg00018.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2019 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"mxml on Debian Linux");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', these problems have been fixed in version
2.6-2+deb8u1.

We recommend that you upgrade your mxml packages.");
  script_tag(name:"summary", value:"Several stack exhaustion conditions were found in mxml that can easily
crash when parsing xml files.

CVE-2016-4570

The mxmlDelete function in mxml-node.c allows remote attackers to
cause a denial of service (stack consumption) via crafted xml file.

CVE-2016-4571

The mxml_write_node function in mxml-file.c allows remote attackers
to cause a denial of service (stack consumption) via crafted xml
file

CVE-2018-20004

A stack-based buffer overflow in mxml_write_node via vectors
involving a double-precision floating point number.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libmxml-dev", ver:"2.6-2+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmxml1", ver:"2.6-2+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
