###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_987.nasl 10474 2018-07-10 08:12:26Z cfischer $
#
# Auto-generated from advisory DLA 987-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.890987");
  script_version("$Revision: 10474 $");
  script_cve_id("CVE-2015-7686", "CVE-2016-6127", "CVE-2017-5361", "CVE-2017-5943", "CVE-2017-5944");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 987-1] request-tracker4 security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-07-10 10:12:26 +0200 (Tue, 10 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-01-29 00:00:00 +0100 (Mon, 29 Jan 2018)");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2017/06/msg00016.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB7\.[0-9]+");
  script_tag(name:"affected", value:"request-tracker4 on Debian Linux");
  script_tag(name:"insight", value:"Request Tracker (RT) is a ticketing system which
enables a group of people to intelligently and efficiently manage
tasks, issues, and requests submitted by a community of users. It
features web, email, and command-line interfaces (see the package
rt4-clients).");
  script_tag(name:"solution", value:"For Debian 7 'Wheezy', these problems have been fixed in version
4.0.7-5+deb7u5.

We recommend that you upgrade your request-tracker4 packages.");
  script_tag(name:"summary",  value:"Multiple vulnerabilities have been discovered in Request Tracker, an
extensible trouble-ticket tracking system. The Common Vulnerabilities
and Exposures project identifies the following problems:

CVE-2016-6127

It was discovered that Request Tracker is vulnerable to a cross-site
scripting (XSS) attack if an attacker uploads a malicious file with
a certain content type. Installations which use the
AlwaysDownloadAttachments config setting are unaffected by this
flaw. The applied fix addresses all existent and future uploaded
attachments.

CVE-2017-5361

It was discovered that Request Tracker is vulnerable to timing
side-channel attacks for user passwords.

CVE-2017-5943

It was discovered that Request Tracker is prone to an information
leak of cross-site request forgery (CSRF) verification tokens if a
user is tricked into visiting a specially crafted URL by an
attacker.

CVE-2017-5944

It was discovered that Request Tracker is prone to a remote code
execution vulnerability in the dashboard subscription interface. A
privileged attacker can take advantage of this flaw through
carefully-crafted saved search names to cause unexpected code to be
executed. The applied fix addresses all existent and future saved
searches.

Additionally to the above mentioned CVEs, this update works around
CVE-2015-7686 in Email::Address which could induce a denial of service
of Request Tracker itself.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"request-tracker4", ver:"4.0.7-5+deb7u5", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"rt4-apache2", ver:"4.0.7-5+deb7u5", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"rt4-clients", ver:"4.0.7-5+deb7u5", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"rt4-db-mysql", ver:"4.0.7-5+deb7u5", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"rt4-db-postgresql", ver:"4.0.7-5+deb7u5", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"rt4-db-sqlite", ver:"4.0.7-5+deb7u5", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"rt4-fcgi", ver:"4.0.7-5+deb7u5", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
