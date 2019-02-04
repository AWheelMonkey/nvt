###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4347.nasl 12938 2019-01-04 07:18:11Z asteins $
#
# Auto-generated from advisory DSA 4347-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704347");
  script_version("$Revision: 12938 $");
  script_cve_id("CVE-2018-18311", "CVE-2018-18312", "CVE-2018-18313", "CVE-2018-18314");
  script_name("Debian Security Advisory DSA 4347-1 (perl - security update)");
  script_tag(name:"last_modification", value:"$Date: 2019-01-04 08:18:11 +0100 (Fri, 04 Jan 2019) $");
  script_tag(name:"creation_date", value:"2018-11-29 00:00:00 +0100 (Thu, 29 Nov 2018)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4347.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9\.[0-9]+");
  script_tag(name:"affected", value:"perl on Debian Linux");
  script_tag(name:"insight", value:"Perl is a highly capable, feature-rich programming language with over
20 years of development. Perl 5 runs on over 100 platforms from
portables to mainframes. Perl is suitable for both rapid prototyping
and large scale development projects.");
  script_tag(name:"solution", value:"For the stable distribution (stretch), these problems have been fixed in
version 5.24.1-3+deb9u5.

We recommend that you upgrade your perl packages.

For the detailed security status of perl please refer to its security
tracker page at:
https://security-tracker.debian.org/tracker/perl");
  script_tag(name:"summary",  value:"Multiple vulnerabilities were discovered in the implementation of the
Perl programming language. The Common Vulnerabilities and Exposures
project identifies the following problems:

CVE-2018-18311 
Jayakrishna Menon and Christophe Hauser discovered an integer
overflow vulnerability in Perl_my_setenv leading to a heap-based
buffer overflow with attacker-controlled input.

CVE-2018-18312 
Eiichi Tsukata discovered that a crafted regular expression could
cause a heap-based buffer overflow write during compilation,
potentially allowing arbitrary code execution.

CVE-2018-18313 
Eiichi Tsukata discovered that a crafted regular expression could
cause a heap-based buffer overflow read during compilation which
leads to information leak.

CVE-2018-18314 
Jakub Wilk discovered that a specially crafted regular expression
could lead to a heap-based buffer overflow.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libperl-dev", ver:"5.24.1-3+deb9u5", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libperl5.24", ver:"5.24.1-3+deb9u5", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"perl", ver:"5.24.1-3+deb9u5", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"perl-base", ver:"5.24.1-3+deb9u5", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"perl-debug", ver:"5.24.1-3+deb9u5", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"perl-doc", ver:"5.24.1-3+deb9u5", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"perl-modules-5.24", ver:"5.24.1-3+deb9u5", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
