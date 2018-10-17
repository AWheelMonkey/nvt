# OpenVAS Vulnerability Test
# $Id: deb_2870.nasl 9354 2018-04-06 07:15:32Z cfischer $
# Auto-generated from advisory DSA 2870-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2014 Greenbone Networks GmbH http://greenbone.net
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

tag_affected  = "libyaml-libyaml-perl on Debian Linux";
tag_insight   = "YAML::LibYAML (or YAML::XS) is a Perl interface to Kirill Siminov's libyaml
library, a YAML Ain't Markup Language (YAML) implementation written in C to
support the YAML 1.1 specification. There provided Dump and Load routines
are compatible with the Perl YAML module (see libyaml-perl).";
tag_solution  = "For the oldstable distribution (squeeze), this problem has been fixed in
version 0.33-1+squeeze2.

For the stable distribution (wheezy), this problem has been fixed in
version 0.38-3+deb7u1.

For the testing distribution (jessie), this problem has been fixed in
version 0.41-4.

For the unstable distribution (sid), this problem has been fixed in
version 0.41-4.

We recommend that you upgrade your libyaml-libyaml-perl packages.";
tag_summary   = "Florian Weimer of the Red Hat Product Security Team discovered a
heap-based buffer overflow flaw in LibYAML, a fast YAML 1.1 parser and
emitter library. A remote attacker could provide a YAML document with a
specially-crafted tag that, when parsed by an application using libyaml,
would cause the application to crash or, potentially, execute arbitrary
code with the privileges of the user running the application.

This update corrects this flaw in the copy that is embedded in the
libyaml-libyaml-perl package.";
tag_vuldetect = "This check tests the installed software version using the apt package manager.";

if(description)
{
    script_oid("1.3.6.1.4.1.25623.1.0.702870");
    script_version("$Revision: 9354 $");
    script_cve_id("CVE-2013-6393");
    script_name("Debian Security Advisory DSA 2870-1 (libyaml-libyaml-perl - heap-based buffer overflow)");
    script_tag(name: "last_modification", value:"$Date: 2018-04-06 09:15:32 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value:"2014-03-08 00:00:00 +0100 (Sat, 08 Mar 2014)");
    script_tag(name: "cvss_base", value:"6.8");
    script_tag(name: "cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");

    script_xref(name: "URL", value: "http://www.debian.org/security/2014/dsa-2870.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2014 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: tag_affected);
    script_tag(name: "insight",   value: tag_insight);
#    script_tag(name: "impact",    value: tag_impact);
    script_tag(name: "solution",  value: tag_solution);
    script_tag(name: "summary",   value: tag_summary);
    script_tag(name: "vuldetect", value: tag_vuldetect);
    script_tag(name:"qod_type", value:"package");
    script_tag(name:"solution_type", value:"VendorFix");

    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libyaml-libyaml-perl", ver:"0.33-1+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libyaml-libyaml-perl", ver:"0.38-3+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libyaml-libyaml-perl", ver:"0.38-3+deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libyaml-libyaml-perl", ver:"0.38-3+deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libyaml-libyaml-perl", ver:"0.38-3+deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
