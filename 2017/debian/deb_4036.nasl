###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4036.nasl 7968 2017-12-01 08:26:28Z asteins $
#
# Auto-generated from advisory DSA 4036-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704036");
  script_version("$Revision: 7968 $");
  script_cve_id("CVE-2017-8808", "CVE-2017-8809", "CVE-2017-8810", "CVE-2017-8811", "CVE-2017-8812", "CVE-2017-8814", "CVE-2017-8815");
  script_name("Debian Security Advisory DSA 4036-1 (mediawiki - security update)");
  script_tag(name:"last_modification", value:"$Date: 2017-12-01 09:26:28 +0100 (Fri, 01 Dec 2017) $");
  script_tag(name:"creation_date", value:"2017-11-15 00:00:00 +0100 (Wed, 15 Nov 2017)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2017/dsa-4036.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"mediawiki on Debian Linux");
  script_tag(name:"insight", value:"MediaWiki is a wiki engine (a program for creating a collaboratively
edited website). It is designed to handle heavy websites containing
library-like document collections, and supports user uploads of
images/sounds, multilingual content, TOC autogeneration, ISBN links,
etc.");
  script_tag(name:"solution", value:"For the stable distribution (stretch), these problems have been fixed in
version 1:1.27.4-1~deb9u1.

We recommend that you upgrade your mediawiki packages.");
  script_tag(name:"summary",  value:"Multiple security vulnerabilities have been discovered in MediaWiki, a
website engine for collaborative work:

CVE-2017-8808 
Cross-site-scripting with non-standard URL escaping and
$wgShowExceptionDetails disabled.

CVE-2017-8809 
Reflected file download in API.

CVE-2017-8810 
On private wikis the login form didn't distinguish between
login failure due to bad username and bad password.

CVE-2017-8811 
It was possible to mangle HTML via raw message parameter
expansion.

CVE-2017-8812 
id attributes in headlines allowed raw '>'.

CVE-2017-8814 
Language converter could be tricked into replacing text inside tags.

CVE-2017-8815 
Unsafe attribute injection via glossary rules in language converter.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"mediawiki", ver:"1:1.27.4-1~deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"mediawiki-classes", ver:"1:1.27.4-1~deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}
