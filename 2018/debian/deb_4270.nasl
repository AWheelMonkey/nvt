###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4270.nasl 12033 2018-10-23 11:14:43Z asteins $
#
# Auto-generated from advisory DSA 4270-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704270");
  script_version("$Revision: 12033 $");
  script_cve_id("CVE-2018-14424");
  script_name("Debian Security Advisory DSA 4270-1 (gdm3 - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-10-23 13:14:43 +0200 (Tue, 23 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-08-13 00:00:00 +0200 (Mon, 13 Aug 2018)");
  script_tag(name:"cvss_base", value:"4.6");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4270.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9\.[0-9]+");
  script_tag(name:"affected", value:"gdm3 on Debian Linux");
  script_tag(name:"insight", value:"GDM provides the equivalent of a 'login:' prompt for X displays: it
asks for a login and starts graphical sessions.");
  script_tag(name:"solution", value:"For the stable distribution (stretch), this problem has been fixed in
version 3.22.3-3+deb9u2.

We recommend that you upgrade your gdm3 packages.

For the detailed security status of gdm3 please refer to its security
tracker page at:
https://security-tracker.debian.org/tracker/gdm3");
  script_tag(name:"summary",  value:"Chris Coulson discovered a use-after-free flaw in the GNOME Display
Manager, triggerable by an unprivileged user via a specially crafted
sequence of D-Bus method calls, leading to denial of service or
potentially the execution of arbitrary code.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"gdm3", ver:"3.22.3-3+deb9u2", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gir1.2-gdm-1.0", ver:"3.22.3-3+deb9u2", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgdm-dev", ver:"3.22.3-3+deb9u2", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgdm1", ver:"3.22.3-3+deb9u2", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
