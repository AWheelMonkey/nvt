###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4246.nasl 11561 2018-09-24 06:20:05Z cfischer $
#
# Auto-generated from advisory DSA 4246-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704246");
  script_version("$Revision: 11561 $");
  script_cve_id("CVE-2018-0618");
  script_name("Debian Security Advisory DSA 4246-1 (mailman - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-09-24 08:20:05 +0200 (Mon, 24 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-07-15 00:00:00 +0200 (Sun, 15 Jul 2018)");
  script_tag(name:"cvss_base", value:"3.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:P/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4246.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9\.[0-9]+");
  script_tag(name:"affected", value:"mailman on Debian Linux");
  script_tag(name:"insight", value:"The GNU Mailing List Manager, which manages email discussion lists
much like Majordomo and Smartmail. Unlike most similar products,
Mailman gives each mailing list a web page, and allows users to
subscribe, unsubscribe, etc. over the web. Even the list manager can
administer his or her list entirely from the web.");
  script_tag(name:"solution", value:"For the stable distribution (stretch), this problem has been fixed in
version 1:2.1.23-1+deb9u3.

We recommend that you upgrade your mailman packages.

For the detailed security status of mailman please refer to its security
tracker page at:
https://security-tracker.debian.org/tracker/mailman");
  script_tag(name:"summary",  value:"Toshitsugu Yoneyama of Mitsui Bussan Secure Directions, Inc. discovered
that mailman, a web-based mailing list manager, is prone to a cross-site
scripting flaw allowing a malicious listowner to inject scripts into the
listinfo page, due to not validated input in the host_name field.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"mailman", ver:"1:2.1.23-1+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
