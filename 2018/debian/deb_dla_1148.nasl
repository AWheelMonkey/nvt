###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1148.nasl 10474 2018-07-10 08:12:26Z cfischer $
#
# Auto-generated from advisory DLA 1148-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891148");
  script_version("$Revision: 10474 $");
  script_cve_id("CVE-2017-15041");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1148-1] golang security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-07-10 10:12:26 +0200 (Tue, 10 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-02-07 00:00:00 +0100 (Wed, 07 Feb 2018)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2017/10/msg00027.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB7\.[0-9]+");
  script_tag(name:"affected", value:"golang on Debian Linux");
  script_tag(name:"insight", value:"The Go programming language is an open source project to make
programmers more productive. Go is expressive, concise, clean, and
efficient. Its concurrency mechanisms make it easy to write programs
that get the most out of multicore and networked machines, while its
novel type system enables flexible and modular program construction.
Go compiles quickly to machine code yet has the convenience of
garbage collection and the power of run-time reflection. It's a
fast, statically typed, compiled language that feels like a
dynamically typed, interpreted language.");
  script_tag(name:"solution", value:"For Debian 7 'Wheezy', these problems have been fixed in version
2:1.0.2-1.1+deb7u2.

We recommend that you upgrade your golang packages.");
  script_tag(name:"summary",  value:"Go before 1.8.4 and 1.9.x before 1.9.1 allows 'go get' remote command
execution. Using custom domains, it is possible to arrange things so
that example.com/pkg1 points to a Subversion repository but
example.com/pkg1/pkg2 points to a Git repository. If the Subversion
repository includes a Git checkout in its pkg2 directory and some
other work is done to ensure the proper ordering of operations, 'go
get' can be tricked into reusing this Git checkout for the fetch of
code from pkg2. If the Subversion repository's Git checkout has
malicious commands in .git/hooks/, they will execute on the system
running 'go get.'");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"golang", ver:"2:1.0.2-1.1+deb7u2", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"golang-dbg", ver:"2:1.0.2-1.1+deb7u2", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"golang-doc", ver:"2:1.0.2-1.1+deb7u2", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"golang-go", ver:"2:1.0.2-1.1+deb7u2", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"golang-mode", ver:"2:1.0.2-1.1+deb7u2", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"golang-src", ver:"2:1.0.2-1.1+deb7u2", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kate-syntax-go", ver:"2:1.0.2-1.1+deb7u2", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"vim-syntax-go", ver:"2:1.0.2-1.1+deb7u2", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
