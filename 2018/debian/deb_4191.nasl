###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4191.nasl 9731 2018-05-04 13:54:39Z cfischer $
#
# Auto-generated from advisory DSA 4191-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704191");
  script_version("$Revision: 9731 $");
  script_cve_id("CVE-2017-15568", "CVE-2017-15569", "CVE-2017-15570", "CVE-2017-15571", "CVE-2017-15572",
                "CVE-2017-15573", "CVE-2017-15574", "CVE-2017-15575", "CVE-2017-15576", "CVE-2017-15577",
                "CVE-2017-16804", "CVE-2017-18026");
  script_name("Debian Security Advisory DSA 4191-1 (redmine - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-05-04 15:54:39 +0200 (Fri, 04 May 2018) $");
  script_tag(name:"creation_date", value:"2018-05-03 00:00:00 +0200 (Thu, 03 May 2018)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4191.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9\.[0-9]+");
  script_tag(name:"affected", value:"redmine on Debian Linux");
  script_tag(name:"insight", value:"Redmine is a flexible project management web application. Written using Ruby
on Rails framework, it is cross-platform and cross-database.");
  script_tag(name:"solution", value:"For the stable distribution (stretch), these problems have been fixed in
version 3.3.1-4+deb9u1.

We recommend that you upgrade your redmine packages.

In addition, this message serves as an announcement that security
support for redmine in the Debian 8 oldstable release (jessie) is now
discontinued.

Users of redmine in Debian 8 that want security updates are strongly
encouraged to upgrade now to the current Debian 9 stable release
(stretch).

For the detailed security status of redmine please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/redmine");
  script_tag(name:"summary",  value:"Multiple vulnerabilities were discovered in Redmine, a project
management web application. They could lead to remote code execution,
information disclosure or cross-site scripting attacks.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"redmine", ver:"3.3.1-4+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"redmine-mysql", ver:"3.3.1-4+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"redmine-pgsql", ver:"3.3.1-4+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"redmine-sqlite", ver:"3.3.1-4+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
