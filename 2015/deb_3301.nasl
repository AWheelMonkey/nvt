# OpenVAS Vulnerability Test
# $Id: deb_3301.nasl 9355 2018-04-06 07:16:07Z cfischer $
# Auto-generated from advisory DSA 3301-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net
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
    script_oid("1.3.6.1.4.1.25623.1.0.703301");
    script_version("$Revision: 9355 $");
    script_cve_id("CVE-2015-3281");
    script_name("Debian Security Advisory DSA 3301-1 (haproxy - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:16:07 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2015-07-05 00:00:00 +0200 (Sun, 05 Jul 2015)");
    script_tag(name:"cvss_base", value:"5.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2015/dsa-3301.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "haproxy on Debian Linux");
        script_tag(name: "insight",   value: "HAProxy is a TCP/HTTP reverse proxy which is particularly suited for high
availability environments. It features connection persistence through HTTP
cookies, load balancing, header addition, modification, deletion both ways. It
has request blocking capabilities and provides interface to display server
status.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie), this problem has been fixed in
version 1.5.8-3+deb8u1.

For the unstable distribution (sid), this problem has been fixed in
version 1.5.14-1.

We recommend that you upgrade your haproxy packages.");
    script_tag(name: "summary",   value: "Charlie Smurthwaite of aTech Media discovered a flaw in HAProxy, a fast
and reliable load balancing reverse proxy, when HTTP pipelining is used.
A client can take advantage of this flaw to cause data corruption and
retrieve uninitialized memory contents that exhibit data from a past
request or session.");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"haproxy", ver:"1.5.8-3+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"haproxy-dbg", ver:"1.5.8-3+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"haproxy-doc", ver:"1.5.8-3+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"vim-haproxy", ver:"1.5.8-3+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
