# OpenVAS Vulnerability Test
# $Id: deb_3502.nasl 8131 2017-12-15 07:30:28Z teissa $
# Auto-generated from advisory DSA 3502-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703502");
    script_version("$Revision: 8131 $");
    script_cve_id("CVE-2014-6276");
    script_name("Debian Security Advisory DSA 3502-1 (roundup - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-12-15 08:30:28 +0100 (Fri, 15 Dec 2017) $");
    script_tag(name:"creation_date", value:"2016-03-08 12:37:54 +0530 (Tue, 08 Mar 2016)");
    script_tag(name:"cvss_base", value:"4.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:N/A:N");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3502.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "roundup on Debian Linux");
        script_tag(name: "insight",   value: "Simple-to-use and -install issue-tracking system with
command-line, web and e-mail interfaces. It is based on the winning
design from Ka-Ping Yee in the Software Carpentry 'Track' design
competition.");
    script_tag(name: "solution",  value: "For the oldstable distribution (wheezy), this problem has been fixed
in version 1.4.20-1.1+deb7u1.

For the stable distribution (jessie), this problem has been fixed in
version 1.4.20-1.1+deb8u1.

For the testing (stretch) and unstable (sid) distribution, this problem has not
yet been fixed.

We recommend that you upgrade your roundup packages.");
    script_tag(name: "summary",   value: "Ralf Schlatterbeck discovered an information leak in roundup, a
web-based issue tracking system. An authenticated attacker could use it
to see sensitive details about other users, including their hashed
password.

After applying the update, which will fix the shipped templates, the
site administrator should ensure the instanced versions (in
/var/lib/roundup usually) are also updated, either by patching them
manually or by recreating them.

More info can be found in the upstream documentation at
http://www.roundup-tracker.org/docs/upgrading.html#user-data-visibility");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");

    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"roundup", ver:"1.4.20-1.1+deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"roundup", ver:"1.4.20-1.1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
