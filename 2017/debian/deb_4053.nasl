###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4053.nasl 8091 2017-12-13 06:22:57Z teissa $
#
# Auto-generated from advisory DSA 4053-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.704053");
  script_version("$Revision: 8091 $");
  script_cve_id("CVE-2017-16943", "CVE-2017-16944");
  script_name("Debian Security Advisory DSA 4053-1 (exim4 - security update)");
  script_tag(name:"last_modification", value:"$Date: 2017-12-13 07:22:57 +0100 (Wed, 13 Dec 2017) $");
  script_tag(name:"creation_date", value:"2017-11-30 00:00:00 +0100 (Thu, 30 Nov 2017)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2017/dsa-4053.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"exim4 on Debian Linux");
  script_tag(name:"insight", value:"Exim (v4) is a mail transport agent. exim4 is the metapackage depending
on the essential components for a basic exim4 installation.");
  script_tag(name:"solution", value:"For the stable distribution (stretch), these problems have been fixed in
version 4.89-2+deb9u2. Default installations disable advertising the
ESMTP CHUNKING extension and are not affected by these issues.

We recommend that you upgrade your exim4 packages.

For the detailed security status of exim4 please refer to its security
tracker page at:
https://security-tracker.debian.org/tracker/exim4");
  script_tag(name:"summary",  value:"Several vulnerabilities have been discovered in Exim, a mail transport
agent. The Common Vulnerabilities and Exposures project identifies the
following issues:

CVE-2017-16943 
A use-after-free vulnerability was discovered in Exim's routines
responsible for parsing mail headers. A remote attacker can take
advantage of this flaw to cause Exim to crash, resulting in a denial
of service, or potentially for remote code execution.

CVE-2017-16944 
It was discovered that Exim does not properly handle BDAT data
headers allowing a remote attacker to cause Exim to crash, resulting
in a denial of service.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"exim4", ver:"4.89-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4-base", ver:"4.89-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4-config", ver:"4.89-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4-daemon-heavy", ver:"4.89-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4-daemon-heavy-dbg", ver:"4.89-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4-daemon-light", ver:"4.89-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4-daemon-light-dbg", ver:"4.89-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4-dbg", ver:"4.89-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4-dev", ver:"4.89-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"eximon4", ver:"4.89-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}
