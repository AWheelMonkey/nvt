###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4219.nasl 10171 2018-06-13 06:19:25Z cfischer $
#
# Auto-generated from advisory DSA 4219-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704219");
  script_version("$Revision: 10171 $");
  script_cve_id("CVE-2018-1000073", "CVE-2018-1000074", "CVE-2018-1000075", "CVE-2018-1000076", "CVE-2018-1000077",
                "CVE-2018-1000078", "CVE-2018-1000079");
  script_name("Debian Security Advisory DSA 4219-1 (jruby - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-06-13 08:19:25 +0200 (Wed, 13 Jun 2018) $");
  script_tag(name:"creation_date", value:"2018-06-08 00:00:00 +0200 (Fri, 08 Jun 2018)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4219.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9\.[0-9]+");
  script_tag(name:"affected", value:"jruby on Debian Linux");
  script_tag(name:"insight", value:"JRuby is a high performance, stable, fully threaded Java implementation
of the Ruby programming language.");
  script_tag(name:"solution", value:"For the stable distribution (stretch), these problems have been fixed in
version 1.7.26-1+deb9u1.

We recommend that you upgrade your jruby packages.

In addition, this message serves as an announcement that security
support for jruby in the Debian 8 oldstable release (jessie) is now
discontinued.

Users of jruby in Debian 8 that want security updates are strongly
encouraged to upgrade now to the current Debian 9 stable release
(stretch).

For the detailed security status of jruby please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/jruby");
  script_tag(name:"summary",  value:"Several vulnerabilities were discovered in jruby, a Java
implementation of the Ruby programming language. They would allow an
attacker to use specially crafted gem files to mount cross-site
scripting attacks, cause denial of service through an infinite loop,
write arbitrary files, or run malicious code.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"jruby", ver:"1.7.26-1+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
