# OpenVAS Vulnerability Test
# $Id: deb_3713.nasl 8972 2018-02-28 07:02:10Z cfischer $
# Auto-generated from advisory DSA 3713-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703713");
    script_version("$Revision: 8972 $");
    script_cve_id("CVE-2016-9447");
    script_name("Debian Security Advisory DSA 3713-1 (gst-plugins-bad0.10 - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-02-28 08:02:10 +0100 (Wed, 28 Feb 2018) $");
    script_tag(name: "creation_date", value: "2016-11-15 00:00:00 +0100 (Tue, 15 Nov 2016)");
    script_tag(name:"cvss_base", value:"6.8");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3713.html");

    script_category(ACT_GATHER_INFO);
    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "gst-plugins-bad0.10 on Debian Linux");
    script_tag(name: "solution",  value: "For the stable distribution (jessie), this problem has been fixed in
version 0.10.23-7.4+deb8u1.

The unstable distribution (sid) no longer contains Gstreamer 0.10.

We recommend that you upgrade your gst-plugins-bad0.10 packages.");
    script_tag(name: "summary",   value: "Chris Evans discovered that the GStreamer 0.10 plugin to decode NES
Sound Format files allowed the execution of arbitrary code. Further
details can be found in his advisory at
http://scarybeastsecurity.blogspot.de/2016/11/0day-exploit-compromising-linux-desktop.html 
.");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");

    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"gstreamer0.10-plugins-bad", ver:"0.10.23-7.4+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gstreamer0.10-plugins-bad-dbg", ver:"0.10.23-7.4+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gstreamer0.10-plugins-bad-doc", ver:"0.10.23-7.4+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgstreamer-plugins-bad0.10-0", ver:"0.10.23-7.4+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgstreamer-plugins-bad0.10-dev", ver:"0.10.23-7.4+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
