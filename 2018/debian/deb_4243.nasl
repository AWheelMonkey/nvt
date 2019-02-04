###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4243.nasl 13284 2019-01-25 08:13:29Z mmartin $
#
# Auto-generated from advisory DSA 4243-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704243");
  script_version("$Revision: 13284 $");
  script_cve_id("CVE-2017-15400", "CVE-2018-4180", "CVE-2018-4181", "CVE-2018-4182", "CVE-2018-4183",
                "CVE-2018-6553");
  script_name("Debian Security Advisory DSA 4243-1 (cups - security update)");
  script_tag(name:"last_modification", value:"$Date: 2019-01-25 09:13:29 +0100 (Fri, 25 Jan 2019) $");
  script_tag(name:"creation_date", value:"2018-07-11 00:00:00 +0200 (Wed, 11 Jul 2018)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4243.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9\.[0-9]+");
  script_tag(name:"affected", value:"cups on Debian Linux");
  script_tag(name:"insight", value:"The Common UNIX Printing System (or CUPS(tm)) is a printing system and
general replacement for lpd and the like. It supports the Internet
Printing Protocol (IPP), and has its own filtering driver model for
handling various document types.");
  script_tag(name:"solution", value:"For the stable distribution (stretch), these problems have been fixed in
version 2.2.1-8+deb9u2.

We recommend that you upgrade your cups packages.

For the detailed security status of cups please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/cups");
  script_tag(name:"summary",  value:"Several vulnerabilities were discovered in CUPS, the Common UNIX Printing
System. These issues have been identified with the following CVE ids:

CVE-2017-15400 
Rory McNamara discovered that an attacker is able to execute arbitrary
commands (with the privilege of the CUPS daemon) by setting a
malicious IPP server with a crafted PPD file.

CVE-2018-4180 
Dan Bastone of Gotham Digital Science discovered that a local
attacker with access to cupsctl could escalate privileges by setting
an environment variable. 

CVE-2018-4181 
Eric Rafaloff and John Dunlap of Gotham Digital Science discovered
that a local attacker can perform limited reads of arbitrary files
as root by manipulating cupsd.conf.

CVE-2018-4182 
Dan Bastone of Gotham Digital Science discovered that an attacker
with sandboxed root access can execute backends without a sandbox
profile by provoking an error in CUPS' profile creation.

CVE-2018-4183 
Dan Bastone and Eric Rafaloff of Gotham Digital Science discovered
that an attacker with sandboxed root access can execute arbitrary
commands as unsandboxed root by modifying /etc/cups/cups-files.conf

CVE-2018-6553 
Dan Bastone of Gotham Digital Science discovered that an attacker
can bypass the AppArmor cupsd sandbox by invoking the dnssd backend
using an alternate name that has been hard linked to dnssd.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"cups", ver:"2.2.1-8+deb9u2", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cups-bsd", ver:"2.2.1-8+deb9u2", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cups-client", ver:"2.2.1-8+deb9u2", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cups-common", ver:"2.2.1-8+deb9u2", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cups-core-drivers", ver:"2.2.1-8+deb9u2", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cups-daemon", ver:"2.2.1-8+deb9u2", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cups-ipp-utils", ver:"2.2.1-8+deb9u2", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cups-ppdc", ver:"2.2.1-8+deb9u2", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cups-server-common", ver:"2.2.1-8+deb9u2", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcups2", ver:"2.2.1-8+deb9u2", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcups2-dev", ver:"2.2.1-8+deb9u2", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupscgi1", ver:"2.2.1-8+deb9u2", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsimage2", ver:"2.2.1-8+deb9u2", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsimage2-dev", ver:"2.2.1-8+deb9u2", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsmime1", ver:"2.2.1-8+deb9u2", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsppdc1", ver:"2.2.1-8+deb9u2", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
