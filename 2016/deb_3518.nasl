# OpenVAS Vulnerability Test
# $Id: deb_3518.nasl 8168 2017-12-19 07:30:15Z teissa $
# Auto-generated from advisory DSA 3518-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net
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
    script_oid("1.3.6.1.4.1.25623.1.0.703518");
    script_version("$Revision: 8168 $");
    script_cve_id("CVE-2016-3153", "CVE-2016-3154");
    script_name("Debian Security Advisory DSA 3518-1 (spip - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-12-19 08:30:15 +0100 (Tue, 19 Dec 2017) $");
    script_tag(name: "creation_date", value: "2016-03-16 00:00:00 +0100 (Wed, 16 Mar 2016)");
    script_tag(name:"cvss_base", value:"7.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3518.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "spip on Debian Linux");
        script_tag(name: "insight",   value: "SPIP is a publishing system for the Internet in which great importance
is attached to collaborative working, to multilingual environments,
and to simplicity of use for web authors.");
    script_tag(name: "solution",  value: "For the oldstable distribution (wheezy), these problems have been fixed
in version 2.1.17-1+deb7u5.

For the stable distribution (jessie), these problems have been fixed in
version 3.0.17-2+deb8u2.

For the testing (stretch) and unstable (sid) distributions, these
problems have been fixed in version 3.0.22-1.

We recommend that you upgrade your spip packages.");
    script_tag(name: "summary",   value: "Several vulnerabilities were found in SPIP, a website engine for
publishing, resulting in code injection.

CVE-2016-3153 
g0uZ et sambecks, from team root-me, discovered that arbitrary PHP
code could be injected when adding content.

CVE-2016-3154 
Gilles Vincent discovered that deserializing untrusted content
could result in arbitrary objects injection.");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");

    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"spip", ver:"3.0.17-2+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"spip", ver:"2.1.17-1+deb7u5", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"spip", ver:"3.0.22-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
