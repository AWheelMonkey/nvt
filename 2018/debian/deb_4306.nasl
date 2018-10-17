###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4306.nasl 11681 2018-09-28 12:26:20Z cfischer $
#
# Auto-generated from advisory DSA 4306-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704306");
  script_version("$Revision: 11681 $");
  script_cve_id("CVE-2018-1000802", "CVE-2018-1060", "CVE-2018-1061", "CVE-2018-14647");
  script_name("Debian Security Advisory DSA 4306-1 (python2.7 - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-09-28 14:26:20 +0200 (Fri, 28 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-09-27 00:00:00 +0200 (Thu, 27 Sep 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4306.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9\.[0-9]+");
  script_tag(name:"affected", value:"python2.7 on Debian Linux");
  script_tag(name:"insight", value:"Python is a high-level, interactive, object-oriented language. Its 2.7 version
includes an extensive class library with lots of goodies for
network programming, system administration, sounds and graphics.");
  script_tag(name:"solution", value:"For the stable distribution (stretch), these problems have been fixed in
version 2.7.13-2+deb9u3.

We recommend that you upgrade your python2.7 packages.

For the detailed security status of python2.7 please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/python2.7");
  script_tag(name:"summary",  value:"Multiple security issues were discovered in Python: ElementTree failed
to initialise Expat's hash salt, two denial of service issues were found
in difflib and poplib and the shutil module was affected by a command
injection vulnerability.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"idle-python2.7", ver:"2.7.13-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpython2.7", ver:"2.7.13-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpython2.7-dbg", ver:"2.7.13-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpython2.7-dev", ver:"2.7.13-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpython2.7-minimal", ver:"2.7.13-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpython2.7-stdlib", ver:"2.7.13-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpython2.7-testsuite", ver:"2.7.13-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python2.7", ver:"2.7.13-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python2.7-dbg", ver:"2.7.13-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python2.7-dev", ver:"2.7.13-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python2.7-doc", ver:"2.7.13-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python2.7-examples", ver:"2.7.13-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python2.7-minimal", ver:"2.7.13-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
