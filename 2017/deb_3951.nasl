###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_3951.nasl 7013 2017-08-25 13:17:51Z asteins $
#
# Auto-generated from advisory DSA 3951-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.703951");
  script_version("$Revision: 7013 $");
  script_cve_id("CVE-2017-8849");
  script_name("Debian Security Advisory DSA 3951-1 (smb4k - security update)");
  script_tag(name:"last_modification", value:"$Date: 2017-08-25 15:17:51 +0200 (Fri, 25 Aug 2017) $");
  script_tag(name:"creation_date", value:"2017-08-22 00:00:00 +0200 (Tue, 22 Aug 2017)");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"http://www.debian.org/security/2017/dsa-3951.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"smb4k on Debian Linux");
  script_tag(name:"insight", value:"Smb4K is an advanced network neighborhood browser. It uses the Samba software
suite to access the shares of the local network neighborhood. Its purpose is
to provide a program that's easy to use and has as many features as possible.");
  script_tag(name:"solution", value:"For the oldstable distribution (jessie), this problem has been fixed
in version 1.2.1-2~deb8u1.

We recommend that you upgrade your smb4k packages.");
  script_tag(name:"summary",  value:"Sebastian Krahmer discovered that a programming error in the mount
helper binary of the Smb4k Samba network share browser may result in
local privilege escalation.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"smb4k", ver:"1.2.1-2~deb8u1", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}
