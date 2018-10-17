###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4025.nasl 8746 2018-02-09 14:31:43Z cfischer $
#
# Auto-generated from advisory DSA 4025-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704025");
  script_version("$Revision: 8746 $");
  script_cve_id("CVE-2017-12197");
  script_name("Debian Security Advisory DSA 4025-1 (libpam4j - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-02-09 15:31:43 +0100 (Fri, 09 Feb 2018) $");
  script_tag(name:"creation_date", value:"2017-11-08 00:00:00 +0100 (Wed, 08 Nov 2017)");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:N/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2017/dsa-4025.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"libpam4j on Debian Linux");
  script_tag(name:"solution", value:"For the oldstable distribution (jessie), this problem has been fixed
in version 1.4-2+deb8u1.

For the stable distribution (stretch), this problem has been fixed in
version 1.4-2+deb9u1.

We recommend that you upgrade your libpam4j packages.");
  script_tag(name:"summary",  value:"It was discovered that libpam4j, a Java library wrapper for the
integration of PAM did not call pam_acct_mgmt() during authentication.
As such a user who has a valid password, but a deactivated or disabled
account could still log in.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libpam4j-java", ver:"1.4-2+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpam4j-java-doc", ver:"1.4-2+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}
