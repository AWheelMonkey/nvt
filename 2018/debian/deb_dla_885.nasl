###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_885.nasl 10474 2018-07-10 08:12:26Z cfischer $
#
# Auto-generated from advisory DLA 885-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.890885");
  script_version("$Revision: 10474 $");
  script_cve_id("CVE-2017-7233", "CVE-2017-7234");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 885-1] python-django security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-07-10 10:12:26 +0200 (Tue, 10 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-01-17 00:00:00 +0100 (Wed, 17 Jan 2018)");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2017/04/msg00004.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB7\.[0-9]+");
  script_tag(name:"affected", value:"python-django on Debian Linux");
  script_tag(name:"insight", value:"Django is a high-level web application framework that loosely follows the
model-view-controller design pattern.");
  script_tag(name:"solution", value:"For Debian 7 'Wheezy', this issue has been fixed in python-django version
1.4.22-1+deb7u3.

We recommend that you upgrade your python-django packages.");
  script_tag(name:"summary",  value:", #859516

It was discovered that there were two vulnerabilities in python-django, a
high-level Python web development framework.

CVE-2017-7233 (#859515): Open redirect and possible XSS attack via
user-supplied numeric redirect URLs. Django relies on user input in some cases
(e.g. django.contrib.auth.views.login() and i18n) to redirect the user to an
'on success' URL. The security check for these redirects (namely is_safe_url())
considered some numeric URLs (e.g. http:999999999) 'safe' when they shouldn't
be. Also, if a developer relied on is_safe_url() to provide safe redirect
targets and puts such a URL into a link, they could suffer from an XSS attack.

CVE-2017-7234 (#895516): Open redirect vulnerability in
django.views.static.serve; A maliciously crafted URL to a Django site using the
serve() view could redirect to any other domain. The view no longer does any
redirects as they don't provide any known, useful functionality.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"python-django", ver:"1.4.22-1+deb7u3", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-django-doc", ver:"1.4.22-1+deb7u3", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
