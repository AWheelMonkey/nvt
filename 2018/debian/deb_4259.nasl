###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4259.nasl 10743 2018-08-03 02:50:31Z ckuersteiner $
#
# Auto-generated from advisory DSA 4259-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.704259");
  script_version("$Revision: 10743 $");
  script_cve_id("CVE-2017-17405", "CVE-2017-17742", "CVE-2017-17790", "CVE-2018-1000073", "CVE-2018-1000074",
                "CVE-2018-1000075", "CVE-2018-1000076", "CVE-2018-1000077", "CVE-2018-1000078", "CVE-2018-1000079",
                "CVE-2018-6914", "CVE-2018-8777", "CVE-2018-8778", "CVE-2018-8779", "CVE-2018-8780");
  script_name("Debian Security Advisory DSA 4259-1 (ruby2.3 - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-08-03 04:50:31 +0200 (Fri, 03 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-07-31 00:00:00 +0200 (Tue, 31 Jul 2018)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4259.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9\.[0-9]+");
  script_tag(name:"affected", value:"ruby2.3 on Debian Linux");
  script_tag(name:"insight", value:"Ruby is the interpreted scripting language for quick and easy
object-oriented programming. It has many features to process text
files and to do system management tasks (as in perl). It is simple,
straight-forward, and extensible.");
  script_tag(name:"solution", value:"For the stable distribution (stretch), these problems have been fixed in
version 2.3.3-1+deb9u3.

We recommend that you upgrade your ruby2.3 packages.

For the detailed security status of ruby2.3 please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/ruby2.3");
  script_tag(name:"summary",  value:"Several vulnerabilities have been discovered in the interpreter for the
Ruby language, which may result in incorrect processing of HTTP/FTP,
directory traversal, command injection, unintended socket creation or
information disclosure.

This update also fixes several issues in RubyGems which could allow an
attacker to use specially crafted gem files to mount cross-site scripting
attacks, cause denial of service through an infinite loop, write arbitrary
files, or run malicious code.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libruby2.3", ver:"2.3.3-1+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"ruby2.3", ver:"2.3.3-1+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"ruby2.3-dev", ver:"2.3.3-1+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"ruby2.3-doc", ver:"2.3.3-1+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"ruby2.3-tcltk", ver:"2.3.3-1+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
