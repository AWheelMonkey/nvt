###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1512.nasl 11515 2018-09-21 08:49:04Z cfischer $
#
# Auto-generated from advisory DLA 1512-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891512");
  script_version("$Revision: 11515 $");
  script_cve_id("CVE-2018-1000671");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1512-1] sympa security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-09-21 10:49:04 +0200 (Fri, 21 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-09-21 00:00:00 +0200 (Fri, 21 Sep 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/09/msg00023.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"sympa on Debian Linux");
  script_tag(name:"insight", value:"Sympa is a scalable and highly customizable modern mailing list manager
capable of handling big setups: 20.000 lists with 700,000 subscribers.");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', this problem has been fixed in version
6.1.23~dfsg-2+deb8u3.

We recommend that you upgrade your sympa packages.");
  script_tag(name:"summary",  value:"n Open Redirect vulnerability has been discovered in sympa. The
'referer' parameter of the wwsympa.fcgi login action can result in
Open redirection and potential Cross Site Scripting via data URIs.
This attack appear to be exploitable via Victim browser opening a
crafted URL supplied by the attacker.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"sympa", ver:"6.1.23~dfsg-2+deb8u3", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
