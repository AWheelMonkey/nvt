###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4037.nasl 9119 2018-03-16 15:21:49Z cfischer $
#
# Auto-generated from advisory DSA 4037-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.704037");
  script_version("$Revision: 9119 $");
  script_cve_id("CVE-2017-15095", "CVE-2017-7525");
  script_name("Debian Security Advisory DSA 4037-1 (jackson-databind - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-03-16 16:21:49 +0100 (Fri, 16 Mar 2018) $");
  script_tag(name:"creation_date", value:"2017-11-16 00:00:00 +0100 (Thu, 16 Nov 2017)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2017/dsa-4037.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"jackson-databind on Debian Linux");
  script_tag(name:"solution", value:"For the oldstable distribution (jessie), this problem has been fixed
in version 2.4.2-2+deb8u2.

For the stable distribution (stretch), this problem has been fixed in
version 2.8.6-1+deb9u2.

We recommend that you upgrade your jackson-databind packages.");
  script_tag(name:"summary",  value:"It was discovered that jackson-databind, a Java library used to parse
JSON and other data formats, improperly validated user input prior to
deserializing: following DSA-4004-1 for
CVE-2017-7525 
, an additional set of classes was identified as unsafe
for deserialization.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libjackson2-databind-java", ver:"2.4.2-2+deb8u2", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libjackson2-databind-java-doc", ver:"2.4.2-2+deb8u2", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libjackson2-databind-java", ver:"2.8.6-1+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libjackson2-databind-java-doc", ver:"2.8.6-1+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}
