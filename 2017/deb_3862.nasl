# OpenVAS Vulnerability Test
# $Id: deb_3862.nasl 9356 2018-04-06 07:17:02Z cfischer $
# Auto-generated from advisory DSA 3862-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703862");
    script_version("$Revision: 9356 $");
    script_cve_id("CVE-2017-2295");
    script_name("Debian Security Advisory DSA 3862-1 (puppet - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:17:02 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2017-05-25 00:00:00 +0200 (Thu, 25 May 2017)");
    script_tag(name:"cvss_base", value:"6.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2017/dsa-3862.html");

    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "puppet on Debian Linux");
        script_tag(name: "insight",   value: "Puppet is a server automation tool. It is composed of a declarative
language for expressing system configuration, a client and server for
distributing it, and a library for realizing the configuration.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie), this problem has been fixed in
version 3.7.2-4+deb8u1.

For the unstable distribution (sid), this problem has been fixed in
version 4.8.2-5.

We recommend that you upgrade your puppet packages.");
    script_tag(name: "summary",   value: "It was discovered that unrestricted YAML deserialisation of data sent
from agents to the server in the Puppet configuration management system
could result in the execution of arbitrary code.

Note that this fix breaks backward compability with Puppet agents older
than 3.2.2 and there is no safe way to restore it. This affects puppet
agents running on Debian wheezy; we recommend to update to the
puppet version shipped in wheezy-backports.");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");

    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"puppet", ver:"3.7.2-4+deb8u1", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"puppet-common", ver:"3.7.2-4+deb8u1", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"puppet-el", ver:"3.7.2-4+deb8u1", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"puppet-testsuite", ver:"3.7.2-4+deb8u1", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"puppetmaster", ver:"3.7.2-4+deb8u1", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"puppetmaster-common", ver:"3.7.2-4+deb8u1", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"puppetmaster-passenger", ver:"3.7.2-4+deb8u1", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"vim-puppet", ver:"3.7.2-4+deb8u1", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
