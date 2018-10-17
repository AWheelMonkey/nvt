###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4108.nasl 8811 2018-02-14 12:41:44Z cfischer $
#
# Auto-generated from advisory DSA 4108-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704108");
  script_version("$Revision: 8811 $");
  script_cve_id("CVE-2018-5950");
  script_name("Debian Security Advisory DSA 4108-1 (mailman - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-02-14 13:41:44 +0100 (Wed, 14 Feb 2018) $");
  script_tag(name:"creation_date", value:"2018-02-09 00:00:00 +0100 (Fri, 09 Feb 2018)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4108.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"mailman on Debian Linux");
  script_tag(name:"insight", value:"The GNU Mailing List Manager, which manages email discussion lists
much like Majordomo and Smartmail. Unlike most similar products,
Mailman gives each mailing list a web page, and allows users to
subscribe, unsubscribe, etc. over the web. Even the list manager can
administer his or her list entirely from the web.");
  script_tag(name:"solution", value:"For the oldstable distribution (jessie), this problem has been fixed
in version 2.1.18-2+deb8u2.

For the stable distribution (stretch), this problem has been fixed in
version 2.1.23-1+deb9u2.

We recommend that you upgrade your mailman packages.

For the detailed security status of mailman please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/mailman");
  script_tag(name:"summary",  value:"Calum Hutton and the Mailman team discovered a cross site scripting and
information leak vulnerability in the user options page. A remote
attacker could use a crafted URL to steal cookie information or to
fish for whether a user is subscribed to a list with a private roster.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"mailman", ver:"2.1.18-2+deb8u2", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"mailman", ver:"2.1.23-1+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}
