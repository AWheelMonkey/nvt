###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4070.nasl 8972 2018-02-28 07:02:10Z cfischer $
#
# Auto-generated from advisory DSA 4070-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704070");
  script_version("$Revision: 8972 $");
  script_cve_id("CVE-2017-17843", "CVE-2017-17844", "CVE-2017-17845", "CVE-2017-17846", "CVE-2017-17847", "CVE-2017-17848");
  script_name("Debian Security Advisory DSA 4070-1 (enigmail - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-02-28 08:02:10 +0100 (Wed, 28 Feb 2018) $");
  script_tag(name:"creation_date", value:"2017-12-21 00:00:00 +0100 (Thu, 21 Dec 2017)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2017/dsa-4070.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"enigmail on Debian Linux");
  script_tag(name:"insight", value:"OpenPGP extension for Thunderbird. Enigmail allows users to access the
features provided by the popular GnuPG software from within Thunderbird.");
  script_tag(name:"solution", value:"For the oldstable distribution (jessie), this problem has been fixed
in version 2:1.9.9-1~deb8u1.

For the stable distribution (stretch), this problem has been fixed in
version 2:1.9.9-1~deb9u1.

We recommend that you upgrade your enigmail packages.

For the detailed security status of enigmail please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/enigmail");
  script_tag(name:"summary",  value:"Multiple vulnerabilities were discovered in Enigmail, an OpenPGP
extension for Thunderbird, which could result in a loss of
confidentiality, faked signatures, plain text leaks and denial of
service. Additional information can be found under
https://enigmail.net/download/other/EnigmailPentestReportbyCure53-Excerpt.pdf");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"enigmail", ver:"2:1.9.9-1~deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"enigmail", ver:"2:1.9.9-1~deb8u1", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}
