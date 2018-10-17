###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4195.nasl 10224 2018-06-15 14:29:06Z cfischer $
#
# Auto-generated from advisory DSA 4195-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704195");
  script_version("$Revision: 10224 $");
  script_cve_id("CVE-2018-0494");
  script_name("Debian Security Advisory DSA 4195-1 (wget - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-06-15 16:29:06 +0200 (Fri, 15 Jun 2018) $");
  script_tag(name:"creation_date", value:"2018-05-08 00:00:00 +0200 (Tue, 08 May 2018)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4195.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB[89]\.[0-9]+");
  script_tag(name:"affected", value:"wget on Debian Linux");
  script_tag(name:"insight", value:"Wget is a network utility to retrieve files from the web
using HTTP(S) and FTP, the two most widely used internet
protocols. It works non-interactively, so it will work in
the background, after having logged off. The program supports
recursive retrieval of web-authoring pages as well as FTP
sites -- you can use Wget to make mirrors of archives and
home pages or to travel the web like a WWW robot.");
  script_tag(name:"solution", value:"For the oldstable distribution (jessie), this problem has been fixed
in version 1.16-1+deb8u5.

For the stable distribution (stretch), this problem has been fixed in
version 1.18-5+deb9u2.

We recommend that you upgrade your wget packages.

For the detailed security status of wget please refer to its security
tracker page at:
https://security-tracker.debian.org/tracker/wget");
  script_tag(name:"summary",  value:"Harry Sintonen discovered that wget, a network utility to retrieve files
from the web, does not properly handle '\r\n' from continuation lines
while parsing the Set-Cookie HTTP header. A malicious web server could
use this flaw to inject arbitrary cookies to the cookie jar file, adding
new or replacing existing cookie values.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"wget", ver:"1.16-1+deb8u5", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"wget", ver:"1.18-5+deb9u2", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
