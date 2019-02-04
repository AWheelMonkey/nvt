###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1591.nasl 12851 2018-12-21 01:34:55Z ckuersteiner $
#
# Auto-generated from advisory DLA 1591-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891591");
  script_version("$Revision: 12851 $");
  script_cve_id("CVE-2017-5223", "CVE-2018-19296");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1591-1] libphp-phpmailer security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-12-21 02:34:55 +0100 (Fri, 21 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-11-23 00:00:00 +0100 (Fri, 23 Nov 2018)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/11/msg00027.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"libphp-phpmailer on Debian Linux");
  script_tag(name:"insight", value:"Many PHP developers utilize email in their code. The only PHP function
that supports this is the mail() function. However, it does not provide
any assistance for making use of popular features such as HTML-based
emails and attachments.");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', this issue has been fixed in libphp-phpmailer version
5.2.9+dfsg-2+deb8u4.

We recommend that you upgrade your libphp-phpmailer packages.");
  script_tag(name:"summary",  value:"It was discovered that there were two vulnerabilities libphp-phpmailer, an
email library for the PHP programming language:

* CVE-2017-5223: Local file disclosure vulnerability via relative path
HTML transformations.

* CVE-2018-19296: Object injection attack.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libphp-phpmailer", ver:"5.2.9+dfsg-2+deb8u4", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
