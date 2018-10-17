###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4145.nasl 9594 2018-04-25 02:13:41Z ckuersteiner $
#
# Auto-generated from advisory DSA 4145-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704145");
  script_version("$Revision: 9594 $");
  script_cve_id("CVE-2017-0915", "CVE-2017-0916", "CVE-2017-0917", "CVE-2017-0918", "CVE-2017-0925", "CVE-2017-0926", "CVE-2018-3710");
  script_name("Debian Security Advisory DSA 4145-1 (gitlab - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-04-25 04:13:41 +0200 (Wed, 25 Apr 2018) $");
  script_tag(name:"creation_date", value:"2018-03-18 00:00:00 +0100 (Sun, 18 Mar 2018)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4145.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9\.[0-9]+");
  script_tag(name:"affected", value:"gitlab on Debian Linux");
  script_tag(name:"insight", value:"gitlab provides web based interface to host source code and track issues.
It allows anyone for fork a repository and send merge requests. Code review
is possible using merge request workflow. Using groups and roles project
access can be controlled.");
  script_tag(name:"solution", value:"For the stable distribution (stretch), these problems have been fixed in
version 8.13.11+dfsg1-8+deb9u1.

We recommend that you upgrade your gitlab packages.

For the detailed security status of gitlab please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/gitlab");
  script_tag(name:"summary",  value:"Several vulnerabilities have been discovered in Gitlab, a software
platform to collaborate on code:

CVE-2017-0915 / CVE-2018-3710 
Arbitrary code execution in project import.

CVE-2017-0916 
Command injection via Webhooks.

CVE-2017-0917 
Cross-site scripting in CI job output.

CVE-2017-0918 
Insufficient restriction of CI runner for project cache access.

CVE-2017-0925 
Information disclosure in Services API.

CVE-2017-0926 
Restrictions for disabled OAuth providers could be bypassed.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"gitlab", ver:"8.13.11+dfsg1-8+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}
