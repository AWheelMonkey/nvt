###############################################################################
# OpenVAS Vulnerability Test
# $Id: freebsd_asterisk14.nasl 11768 2018-10-05 14:07:38Z cfischer $
#
# Auto generated from VID 5ab9fb2a-23a5-11e0-a835-0003ba02bf30
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com
# Text descriptions are largely excerpted from the referenced
# advisories, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
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
  script_oid("1.3.6.1.4.1.25623.1.0.68814");
  script_version("$Revision: 11768 $");
  script_cve_id("CVE-2011-0495");
  script_tag(name:"last_modification", value:"$Date: 2018-10-05 16:07:38 +0200 (Fri, 05 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-01-24 17:55:59 +0100 (Mon, 24 Jan 2011)");
  script_tag(name:"cvss_base", value:"6.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:P/I:P/A:P");
  script_name("FreeBSD Ports: asterisk14");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com");
  script_family("FreeBSD Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/freebsd", "ssh/login/freebsdrel");

  script_tag(name:"insight", value:"The following packages are affected:

  asterisk14

  asterisk16
  asterisk18");

  script_tag(name:"solution", value:"Update your system with the appropriate patches or
  software upgrades.");

  script_xref(name:"URL", value:"http://downloads.asterisk.org/pub/security/AST-2011-001.pdf");
  script_xref(name:"URL", value:"http://www.vuxml.org/freebsd/5ab9fb2a-23a5-11e0-a835-0003ba02bf30.html");

  script_tag(name:"summary", value:"The remote host is missing an update to the system
  as announced in the referenced advisory.");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-bsd.inc");

vuln = FALSE;
txt = "";

bver = portver(pkg:"asterisk14");
if(!isnull(bver) && revcomp(a:bver, b:"1.4")>0 && revcomp(a:bver, b:"1.4.39.1")<0) {
  txt += 'Package asterisk14 version ' + bver + ' is installed which is known to be vulnerable.\n';
  vuln = TRUE;
}
bver = portver(pkg:"asterisk16");
if(!isnull(bver) && revcomp(a:bver, b:"1.6")>0 && revcomp(a:bver, b:"1.6.2.16.1")<0) {
  txt += 'Package asterisk16 version ' + bver + ' is installed which is known to be vulnerable.\n';
  vuln = TRUE;
}
bver = portver(pkg:"asterisk18");
if(!isnull(bver) && revcomp(a:bver, b:"1.8")>0 && revcomp(a:bver, b:"1.8.2.2")<0) {
  txt += 'Package asterisk18 version ' + bver + ' is installed which is known to be vulnerable.\n';
  vuln = TRUE;
}

if(vuln) {
  security_message(data:txt);
} else if (__pkg_match) {
  exit(99);
}