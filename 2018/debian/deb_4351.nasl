###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4351.nasl 12858 2018-12-21 08:05:36Z ckuersteiner $
#
# Auto-generated from advisory DSA 4351-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704351");
  script_version("$Revision: 12858 $");
  script_cve_id("CVE-2018-19296");
  script_name("Debian Security Advisory DSA 4351-1 (libphp-phpmailer - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-12-21 09:05:36 +0100 (Fri, 21 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-12-07 00:00:00 +0100 (Fri, 07 Dec 2018)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4351.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9\.[0-9]+");
  script_tag(name:"affected", value:"libphp-phpmailer on Debian Linux");
  script_tag(name:"insight", value:"Many PHP developers utilize email in their code. The only PHP function
that supports this is the mail() function. However, it does not provide
any assistance for making use of popular features such as HTML-based
emails and attachments.");
  script_tag(name:"solution", value:"For the stable distribution (stretch), this problem has been fixed in
version 5.2.14+dfsg-2.3+deb9u1.

We recommend that you upgrade your libphp-phpmailer packages.

For the detailed security status of libphp-phpmailer please refer to its
security tracker page at:
https://security-tracker.debian.org/tracker/libphp-phpmailer");
  script_tag(name:"summary",  value:"It was discovered that PHPMailer, a library to send email from PHP
applications, is prone to a PHP object injection vulnerability,
potentially allowing a remote attacker to execute arbitrary code.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libphp-phpmailer", ver:"5.2.14+dfsg-2.3+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
