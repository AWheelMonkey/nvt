###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1561.nasl 12209 2018-11-05 07:23:30Z cfischer $
#
# Auto-generated from advisory DLA 1561-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891561");
  script_version("$Revision: 12209 $");
  script_cve_id("CVE-2016-11107", "CVE-2017-11107");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1561-1] phpldapadmin security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-11-05 08:23:30 +0100 (Mon, 05 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-11-05 00:00:00 +0100 (Mon, 05 Nov 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/10/msg00023.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"phpldapadmin on Debian Linux");
  script_tag(name:"insight", value:"phpLDAPadmin is a web-based LDAP client. It provides easy,
anywhere-accessible, multi-language administration for your LDAP
server. Its hierarchical tree-viewer and advanced search functionality
make it intuitive to browse and administer your LDAP directory. Since it
is a web application, this LDAP browser works on many platforms, making
your LDAP server easily manageable from any location.
Usually, you may access PLA by pointing your browser to
http://<webserver>/phpldapadmin .");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', this problem has been fixed in version
1.2.2-5.2+deb8u1.

Note: the package changelog mistakenly refers to the non-existent
CVE-2016-11107 identifier. The proper identifier to refer to this issue
is CVE-2017-11107.

We recommend that you upgrade your phpldapadmin packages.");
  script_tag(name:"summary",  value:"It was discovered that there was a cross-site scripting (XSS) vulnerability in
phpldapadmin, a web-based interface for administering LDAP servers.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"phpldapadmin", ver:"1.2.2-5.2+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
