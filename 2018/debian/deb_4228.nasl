###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4228.nasl 10243 2018-06-19 05:46:10Z cfischer $
#
# Auto-generated from advisory DSA 4228-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704228");
  script_version("$Revision: 10243 $");
  script_cve_id("CVE-2017-15736");
  script_name("Debian Security Advisory DSA 4228-1 (spip - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-06-19 07:46:10 +0200 (Tue, 19 Jun 2018) $");
  script_tag(name:"creation_date", value:"2018-06-14 00:00:00 +0200 (Thu, 14 Jun 2018)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4228.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB[89]\.[0-9]+");
  script_tag(name:"affected", value:"spip on Debian Linux");
  script_tag(name:"insight", value:"SPIP is a publishing system for the Internet in which great importance
is attached to collaborative working, to multilingual environments,
and to simplicity of use for web authors.");
  script_tag(name:"solution", value:"For the oldstable distribution (jessie), this problem has been fixed
in version 3.0.17-2+deb8u4.

For the stable distribution (stretch), this problem has been fixed in
version 3.1.4-4~deb9u1.

We recommend that you upgrade your spip packages.

For the detailed security status of spip please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/spip");
  script_tag(name:"summary",  value:"Several vulnerabilities were found in SPIP, a website engine for
publishing, resulting in cross-site scripting and PHP injection.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"spip", ver:"3.0.17-2+deb8u4", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"spip", ver:"3.1.4-4~deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
