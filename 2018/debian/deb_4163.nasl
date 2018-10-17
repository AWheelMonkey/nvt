###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4163.nasl 9953 2018-05-25 04:01:23Z ckuersteiner $
#
# Auto-generated from advisory DSA 4163-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704163");
  script_version("$Revision: 9953 $");
  script_cve_id("CVE-2018-0492");
  script_name("Debian Security Advisory DSA 4163-1 (beep - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-05-25 06:01:23 +0200 (Fri, 25 May 2018) $");
  script_tag(name:"creation_date", value:"2018-04-02 00:00:00 +0200 (Mon, 02 Apr 2018)");
  script_tag(name:"cvss_base", value:"4.4");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4163.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB[89]\.[0-9]+");
  script_tag(name:"affected", value:"beep on Debian Linux");
  script_tag(name:"insight", value:"beep does what you'd expect: it beeps. But unlike printf '\a' beep allows
you to control pitch, duration, and repetitions. Its job is to live inside
shell/perl scripts and allow more granularity than one has otherwise. It is
controlled completely through command line options. It's not supposed to be
complex, and it isn't - but it makes system monitoring (or whatever else it
gets hacked into) much more informative.");
  script_tag(name:"solution", value:"For the oldstable distribution (jessie), this problem has been fixed
in version 1.3-3+deb8u1.

For the stable distribution (stretch), this problem has been fixed in
version 1.3-4+deb9u1.

We recommend that you upgrade your beep packages.

For the detailed security status of beep please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/beep");
  script_tag(name:"summary",  value:"It was discovered that a race condition in beep (if configured as setuid
via debconf) allows local privilege escalation.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"beep", ver:"1.3-4+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"beep", ver:"1.3-3+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}
