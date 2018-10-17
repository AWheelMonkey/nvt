# OpenVAS Vulnerability Test
# $Id: deb_3850.nasl 9356 2018-04-06 07:17:02Z cfischer $
# Auto-generated from advisory DSA 3850-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703850");
    script_version("$Revision: 9356 $");
    script_cve_id("CVE-2015-8270", "CVE-2015-8271", "CVE-2015-8272");
    script_name("Debian Security Advisory DSA 3850-1 (rtmpdump - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:17:02 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2017-05-12 00:00:00 +0200 (Fri, 12 May 2017)");
    script_tag(name:"cvss_base", value:"7.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2017/dsa-3850.html");

    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "rtmpdump on Debian Linux");
        script_tag(name: "insight",   value: "A small dumper for media content streamed over the RTMP protocol (like BBC's
iPlayer high quality streams). Supplying an RTMP URL will result in a dumped
flv file, which can be played/transcoded with standard tools.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie), these problems have been fixed in
version 2.4+20150115.gita107cef-1+deb8u1.

For the upcoming stable distribution (stretch), these problems have been
fixed in version 2.4+20151223.gitfa8646d.1-1.

For the unstable distribution (sid), these problems have been fixed in
version 2.4+20151223.gitfa8646d.1-1.

We recommend that you upgrade your rtmpdump packages.");
    script_tag(name: "summary",   value: "Dave McDaniel discovered multiple vulnerabilities in rtmpdump, a small
dumper/library for RTMP media streams, which may result in denial of
service or the execution of arbitrary code if a malformed stream is
dumped.");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");

    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"librtmp-dev", ver:"2.4+20150115.gita107cef-1+deb8u1", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"librtmp1", ver:"2.4+20150115.gita107cef-1+deb8u1", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"rtmpdump", ver:"2.4+20150115.gita107cef-1+deb8u1", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"librtmp-dev", ver:"2.4+20151223.gitfa8646d.1-1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"librtmp1", ver:"2.4+20151223.gitfa8646d.1-1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"rtmpdump", ver:"2.4+20151223.gitfa8646d.1-1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
