# OpenVAS Vulnerability Test
# $Id: deb_3131.nasl 9355 2018-04-06 07:16:07Z cfischer $
# Auto-generated from advisory DSA 3131-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703131");
    script_version("$Revision: 9355 $");
    script_cve_id("CVE-2014-9622");
    script_name("Debian Security Advisory DSA 3131-1 (xdg-utils - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:16:07 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2015-01-18 00:00:00 +0100 (Sun, 18 Jan 2015)");
    script_tag(name:"cvss_base", value:"6.8");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");

    script_xref(name: "URL", value: "http://www.debian.org/security/2015/dsa-3131.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "xdg-utils on Debian Linux");
    script_tag(name: "insight",   value: "xdg-utils contains utilities for
integrating applications with the desktop environment, regardless of which
desktop environment is used. They are part of freedesktop.org's Portland
project.");
    script_tag(name: "solution",  value: "For the stable distribution (wheezy),
this problem has been fixed in version 1.1.0~rc1+git20111210-6+deb7u2.

For the upcoming stable (jessie) and unstable (sid) distributions,
this problem has been fixed in version 1.1.0~rc1+git20111210-7.3.

We recommend that you upgrade your xdg-utils packages.");
    script_tag(name: "summary",   value: "John Houwer discovered a way to cause
xdg-open, a tool that automatically opens URLs in a user's preferred application,
to execute arbitrary
commands remotely.");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");
    script_tag(name:"qod_type", value:"package");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"xdg-utils", ver:"1.1.0~rc1+git20111210-6+deb7u2", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
