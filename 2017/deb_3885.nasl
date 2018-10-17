# OpenVAS Vulnerability Test
# $Id: deb_3885.nasl 9356 2018-04-06 07:17:02Z cfischer $
# Auto-generated from advisory DSA 3885-1 using nvtgen 1.0
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
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#


if(description)
{
    script_oid("1.3.6.1.4.1.25623.1.0.703885");
    script_version("$Revision: 9356 $");
    script_cve_id("CVE-2017-9468", "CVE-2017-9469");
    script_name("Debian Security Advisory DSA 3885-1 (irssi - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:17:02 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2017-06-18 00:00:00 +0200 (Sun, 18 Jun 2017)");
    script_tag(name:"cvss_base", value:"5.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2017/dsa-3885.html");

    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "irssi on Debian Linux");
        script_tag(name: "insight",   value: "Irssi is a terminal based IRC client for UNIX systems. It also supports
SILC and ICB protocols via plugins.");
    script_tag(name: "solution",  value: "For the oldstable distribution (jessie), these problems have been fixed
in version 0.8.17-1+deb8u4.

For the stable distribution (stretch), these problems have been fixed in
version 1.0.2-1+deb9u1.

For the unstable distribution (sid), these problems have been fixed in
version 1.0.3-1.

We recommend that you upgrade your irssi packages.");
    script_tag(name: "summary",   value: "Multiple vulnerabilities have been discovered in Irssi, a terminal based
IRC client. The Common Vulnerabilities and Exposures project identifies
the following problems:

CVE-2017-9468 
Joseph Bisch discovered that Irssi does not properly handle DCC
messages without source nick/host. A malicious IRC server can take
advantage of this flaw to cause Irssi to crash, resulting in a
denial of service.

CVE-2017-9469 
Joseph Bisch discovered that Irssi does not properly handle
receiving incorrectly quoted DCC files. A remote attacker can take
advantage of this flaw to cause Irssi to crash, resulting in a
denial of service.");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");

    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"irssi", ver:"0.8.17-1+deb8u4", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"irssi-dbg", ver:"0.8.17-1+deb8u4", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"irssi-dev", ver:"0.8.17-1+deb8u4", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"irssi", ver:"1.0.2-1+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"irssi-dev", ver:"1.0.2-1+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
