# OpenVAS Vulnerability Test
# $Id: deb_3243.nasl 9355 2018-04-06 07:16:07Z cfischer $
# Auto-generated from advisory DSA 3243-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703243");
    script_version("$Revision: 9355 $");
    script_cve_id("CVE-2015-3451");
    script_name("Debian Security Advisory DSA 3243-1 (libxml-libxml-perl - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:16:07 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2015-05-01 00:00:00 +0200 (Fri, 01 May 2015)");
    script_tag(name:"cvss_base", value:"5.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2015/dsa-3243.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "libxml-libxml-perl on Debian Linux");
        script_tag(name: "insight",   value: "XML::LibXML is a Perl interface to the GNOME libxml2 library, which provides
interfaces for parsing and manipulating XML files. This module allows Perl
programmers to make use of the highly capable validating XML parser and the
high performance Document Object Model (DOM) implementation. Additionally, it
supports using the XML Path Language (XPath) to find and extract information.");
    script_tag(name: "solution",  value: "For the oldstable distribution (wheezy), this problem has been fixed
in version 2.0001+dfsg-1+deb7u1.

For the stable distribution (jessie), this problem has been fixed in
version 2.0116+dfsg-1+deb8u1.

For the unstable distribution (sid), this problem has been fixed in
version 2.0116+dfsg-2.

We recommend that you upgrade your libxml-libxml-perl packages.");
    script_tag(name: "summary",   value: "Tilmann Haak from xing.com discovered that XML::LibXML, a Perl interface
to the libxml2 library, did not respect the expand_entities parameter to
disable processing of external entities in some circumstances. This may
allow attackers to gain read access to otherwise protected resources,
depending on how the library is used.");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libxml-libxml-perl", ver:"2.0001+dfsg-1+deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libxml-libxml-perl", ver:"2.0116+dfsg-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
