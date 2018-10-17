# OpenVAS Vulnerability Test
# $Id: deb_2829.nasl 9353 2018-04-06 07:14:20Z cfischer $
# Auto-generated from advisory DSA 2829-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH http://greenbone.net
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

include("revisions-lib.inc");

tag_affected  = "hplip on Debian Linux";
tag_insight   = "The HP Linux Printing and Imaging System provides full support for
printing on most HP SFP (single function peripheral) inkjets and many
LaserJets, and for scanning, sending faxes and for photo-card access on
most HP MFP (multi-function peripheral) printers.";
tag_solution  = "For the oldstable distribution (squeeze), these problems have been fixed in
version 3.10.6-2+squeeze2.

For the stable distribution (wheezy), these problems have been fixed in
version 3.12.6-3.1+deb7u1.

For the unstable distribution (sid), these problems have been fixed in
version 3.13.11-2.

We recommend that you upgrade your hplip packages.";
tag_summary   = "Multiple vulnerabilities have been found in the HP Linux Printing and
Imaging System: Insecure temporary files, insufficient permission checks
in PackageKit and the insecure hp-upgrade service has been disabled.";
tag_vuldetect = "This check tests the installed software version using the apt package manager.";

if(description)
{
    script_oid("1.3.6.1.4.1.25623.1.0.702829");
    script_version("$Revision: 9353 $");
    script_cve_id("CVE-2013-0200", "CVE-2013-4325", "CVE-2013-6402", "CVE-2013-6427");
    script_name("Debian Security Advisory DSA 2829-1 (hplip - several vulnerabilities)");
    script_tag(name: "last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value:"2013-12-28 00:00:00 +0100 (Sat, 28 Dec 2013)");
    script_tag(name:"cvss_base", value:"6.9");
    script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");

    script_xref(name: "URL", value: "http://www.debian.org/security/2013/dsa-2829.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2013 Greenbone Networks GmbH http://greenbone.net");
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

include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"hpijs", ver:"3.10.6-2+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"hpijs-ppds", ver:"3.10.6-2+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"hplip", ver:"3.10.6-2+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"hplip-cups", ver:"3.10.6-2+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"hplip-data", ver:"3.10.6-2+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"hplip-dbg", ver:"3.10.6-2+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"hplip-doc", ver:"3.10.6-2+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"hplip-gui", ver:"3.10.6-2+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libhpmud-dev", ver:"3.10.6-2+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libhpmud0", ver:"3.10.6-2+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsane-hpaio", ver:"3.10.6-2+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"hpijs", ver:"3.12.6-3.1+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"hpijs-ppds", ver:"3.12.6-3.1+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"hplip", ver:"3.12.6-3.1+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"hplip-cups", ver:"3.12.6-3.1+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"hplip-data", ver:"3.12.6-3.1+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"hplip-dbg", ver:"3.12.6-3.1+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"hplip-doc", ver:"3.12.6-3.1+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"hplip-gui", ver:"3.12.6-3.1+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libhpmud-dev", ver:"3.12.6-3.1+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libhpmud0", ver:"3.12.6-3.1+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsane-hpaio", ver:"3.12.6-3.1+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"printer-driver-hpcups", ver:"3.12.6-3.1+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"printer-driver-hpijs", ver:"3.12.6-3.1+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"printer-driver-postscript-hp", ver:"3.12.6-3.1+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
