###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1635.nasl 13129 2019-01-17 15:14:02Z cfischer $
#
# Auto-generated from advisory DLA 1635-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2019 Greenbone Networks GmbH http://greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.891635");
  script_version("$Revision: 13129 $");
  script_cve_id("CVE-2019-3811");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1635-1] sssd security update)");
  script_tag(name:"last_modification", value:"$Date: 2019-01-17 16:14:02 +0100 (Thu, 17 Jan 2019) $");
  script_tag(name:"creation_date", value:"2019-01-17 00:00:00 +0100 (Thu, 17 Jan 2019)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2019/01/msg00011.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2019 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"sssd on Debian Linux");
  script_tag(name:"insight", value:"Provides a set of daemons to manage access to remote directories and
authentication mechanisms. It provides an NSS and PAM interface toward
the system and a pluggable backend system to connect to multiple different
account sources. It is also the basis to provide client auditing and policy
services for projects like FreeIPA.");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', this problem has been fixed in version
1.11.7-3+deb8u2.

We recommend that you upgrade your sssd packages.");
  script_tag(name:"summary", value:"vulnerability was found in sssd. If a user was configured with no home
directory set, sssd would return '/' (the root directory) instead of ''
(the empty string / no home directory). This could impact services that
restrict the user's filesystem access to within their home directory
through chroot() etc.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libipa-hbac-dev", ver:"1.11.7-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libipa-hbac0", ver:"1.11.7-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libnss-sss", ver:"1.11.7-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpam-sss", ver:"1.11.7-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsss-idmap-dev", ver:"1.11.7-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsss-idmap0", ver:"1.11.7-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsss-nss-idmap-dev", ver:"1.11.7-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsss-nss-idmap0", ver:"1.11.7-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsss-sudo", ver:"1.11.7-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-libipa-hbac", ver:"1.11.7-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-libsss-nss-idmap", ver:"1.11.7-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-sss", ver:"1.11.7-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"sssd", ver:"1.11.7-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"sssd-ad", ver:"1.11.7-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"sssd-ad-common", ver:"1.11.7-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"sssd-common", ver:"1.11.7-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"sssd-dbus", ver:"1.11.7-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"sssd-ipa", ver:"1.11.7-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"sssd-krb5", ver:"1.11.7-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"sssd-krb5-common", ver:"1.11.7-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"sssd-ldap", ver:"1.11.7-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"sssd-proxy", ver:"1.11.7-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"sssd-tools", ver:"1.11.7-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
