###############################################################################
# OpenVAS Vulnerability Test
# $Id: freebsd_bind9-sdb-ldap.nasl 11762 2018-10-05 10:54:12Z cfischer $
#
# Auto generated from VID 1e1421f0-8d6f-11e0-89b4-001ec9578670
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
  script_oid("1.3.6.1.4.1.25623.1.0.69752");
  script_version("$Revision: 11762 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-05 12:54:12 +0200 (Fri, 05 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-08-03 04:36:20 +0200 (Wed, 03 Aug 2011)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_cve_id("CVE-2011-1910");
  script_name("FreeBSD Ports: bind9-sdb-ldap, bind9-sdb-postgresql");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com");
  script_family("FreeBSD Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/freebsd", "ssh/login/freebsdrel");

  script_tag(name:"insight", value:"The following packages are affected:

  bind9-sdb-ldap
   bind9-sdb-postgresql
   bind96
   bind97
   bind98

CVE-2011-1910
Off-by-one error in named in ISC BIND 9.x before 9.7.3-P1, 9.8.x
before 9.8.0-P2, 9.4-ESV before 9.4-ESV-R4-P1, and 9.6-ESV before
9.6-ESV-R4-P1 allows remote DNS servers to cause a denial of service
(assertion failure and daemon exit) via a negative response containing
large RRSIG RRsets.");

  script_tag(name:"solution", value:"Update your system with the appropriate patches or
  software upgrades.");

  script_xref(name:"URL", value:"http://www.isc.org/software/bind/advisories/cve-2011-1910");
  script_xref(name:"URL", value:"http://www.vuxml.org/freebsd/1e1421f0-8d6f-11e0-89b4-001ec9578670.html");

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

bver = portver(pkg:"bind9-sdb-ldap");
if(!isnull(bver) && revcomp(a:bver, b:"9.4.3.4")<0) {
  txt += 'Package bind9-sdb-ldap version ' + bver + ' is installed which is known to be vulnerable.\n';
  vuln = TRUE;
}
bver = portver(pkg:"bind9-sdb-postgresql");
if(!isnull(bver) && revcomp(a:bver, b:"9.4.3.4")<0) {
  txt += 'Package bind9-sdb-postgresql version ' + bver + ' is installed which is known to be vulnerable.\n';
  vuln = TRUE;
}
bver = portver(pkg:"bind96");
if(!isnull(bver) && revcomp(a:bver, b:"9.6.3.1.ESV.R4.1")<0) {
  txt += 'Package bind96 version ' + bver + ' is installed which is known to be vulnerable.\n';
  vuln = TRUE;
}
bver = portver(pkg:"bind97");
if(!isnull(bver) && revcomp(a:bver, b:"9.7.3.1")<0) {
  txt += 'Package bind97 version ' + bver + ' is installed which is known to be vulnerable.\n';
  vuln = TRUE;
}
bver = portver(pkg:"bind98");
if(!isnull(bver) && revcomp(a:bver, b:"9.8.0.2")<0) {
  txt += 'Package bind98 version ' + bver + ' is installed which is known to be vulnerable.\n';
  vuln = TRUE;
}

if(vuln) {
  security_message(data:txt);
} else if (__pkg_match) {
  exit(99);
}