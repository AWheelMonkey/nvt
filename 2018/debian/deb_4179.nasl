###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4179.nasl 9619 2018-04-26 07:38:01Z asteins $
#
# Auto-generated from advisory DSA 4179-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704179");
  script_version("$Revision: 9619 $");
  script_cve_id("CVE-2017-5715");
  script_name("Debian Security Advisory DSA 4179-1 (linux-tools - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-04-26 09:38:01 +0200 (Thu, 26 Apr 2018) $");
  script_tag(name:"creation_date", value:"2018-04-24 00:00:00 +0200 (Tue, 24 Apr 2018)");
  script_tag(name:"cvss_base", value:"4.7");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:N/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4179.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"linux-tools on Debian Linux");
  script_tag(name:"insight", value:"This package depends on the package containing the 'perf' performance
analysis tools for the latest Linux kernel.");
  script_tag(name:"solution", value:"For the oldstable distribution (jessie), this problem has been fixed
in version 3.16.56-1.

We recommend that you upgrade your linux-tools packages.

For the detailed security status of linux-tools please refer to its
security tracker page at:
https://security-tracker.debian.org/tracker/linux-tools");
  script_tag(name:"summary",  value:"This update doesn't fix a vulnerability in linux-tools, but provides
support for building Linux kernel modules with the retpoline mitigation for CVE-2017-5715 
(Spectre variant 2).

This update also includes bug fixes from the upstream Linux 3.16 stable
branch up to and including 3.16.56.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"hyperv-daemons", ver:"3.16.56-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-kbuild-3.16", ver:"3.16.56-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-tools-3.16", ver:"3.16.56-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

# nb: Those are using a different version scheme, take care of this when overwriting this LSC...
if ((res = isdpkgvuln(pkg:"libusbip-dev", ver:"2.0+3.16.56-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"usbip", ver:"2.0+3.16.56-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
