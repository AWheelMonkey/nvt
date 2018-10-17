# OpenVAS Vulnerability Test
# $Id: deb_3213.nasl 9355 2018-04-06 07:16:07Z cfischer $
# Auto-generated from advisory DSA 3213-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703213");
    script_version("$Revision: 9355 $");
    script_cve_id("CVE-2015-0556", "CVE-2015-0557", "CVE-2015-2782");
    script_name("Debian Security Advisory DSA 3213-1 (arj - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:16:07 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2015-04-06 00:00:00 +0200 (Mon, 06 Apr 2015)");
    script_tag(name:"cvss_base", value:"7.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2015/dsa-3213.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "arj on Debian Linux");
    script_tag(name: "insight",   value: "This package is an open source version
of the arj archiver. This version has been created with the intent to preserve
maximum compatibility andretain the feature set of original ARJ archiver as
provided by ARJ Software, Inc.");
    script_tag(name: "solution",  value: "For the stable distribution (wheezy),
these problems have been fixed in version 3.10.22-10+deb7u1.

For the upcoming stable distribution (jessie), these problems have been
fixed in version 3.10.22-13.

For the unstable distribution (sid), these problems have been fixed in
version 3.10.22-13.

We recommend that you upgrade your arj packages.");
    script_tag(name: "summary",   value: "Multiple vulnerabilities have
been discovered in arj, an open source version of the arj archiver. The
Common Vulnerabilities and Exposures project identifies the following problems:

CVE-2015-0556 
Jakub Wilk discovered that arj follows symlinks created during
unpacking of an arj archive. A remote attacker could use this flaw
to perform a directory traversal attack if a user or automated
system were tricked into processing a specially crafted arj archive.

CVE-2015-0557 
Jakub Wilk discovered that arj does not sufficiently protect from
directory traversal while unpacking an arj archive containing file
paths with multiple leading slashes. A remote attacker could use
this flaw to write to arbitrary files if a user or automated system
were tricked into processing a specially crafted arj archive.

CVE-2015-2782 
Jakub Wilk and Guillem Jover discovered a buffer overflow
vulnerability in arj. A remote attacker could use this flaw to cause
an application crash or, possibly, execute arbitrary code with the
privileges of the user running arj.");
    script_tag(name: "vuldetect", value: "This check tests the installed
software version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"arj", ver:"3.10.22-10+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
