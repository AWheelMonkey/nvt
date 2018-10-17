# OpenVAS Vulnerability Test
# $Id: deb_3133.nasl 9355 2018-04-06 07:16:07Z cfischer $
# Auto-generated from advisory DSA 3133-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703133");
    script_version("$Revision: 9355 $");
    script_cve_id("CVE-2015-1031");
    script_name("Debian Security Advisory DSA 3133-1 (privoxy - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:16:07 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2015-01-20 00:00:00 +0100 (Tue, 20 Jan 2015)");
    script_tag(name:"cvss_base", value:"7.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");

    script_xref(name: "URL", value: "http://www.debian.org/security/2015/dsa-3133.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "privoxy on Debian Linux");
    script_tag(name: "insight",   value: "Privoxy is a web proxy with advanced
filtering capabilities for protecting privacy, filtering web page content,
managing cookies, controlling access, and removing ads, banners, pop-ups and other
obnoxious Internet junk. Privoxy has a very flexible configuration
and can be customized to suit individual needs and tastes. Privoxy
has application for both stand-alone systems and multi-user networks.");
    script_tag(name: "solution",  value: "For the stable distribution (wheezy),
this problem has been fixed in version 3.0.19-2+deb7u1.

For the upcoming stable distribution (jessie), this problem will be
fixed soon.

For the unstable distribution (sid), this problem has been fixed in
version 3.0.21-5.

We recommend that you upgrade your privoxy packages.");
    script_tag(name: "summary",   value: "Multiple use-after-frees were discovered
in Privoxy, a privacy-enhancing HTTP proxy.");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");
    script_tag(name:"qod_type", value:"package");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"privoxy", ver:"3.0.19-2+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
