###############################################################################
# OpenVAS Vulnerability Test
# $Id: alas-2014-359.nasl 6724 2017-07-14 09:57:17Z teissa$
#
# Amazon Linux security check
#
# Authors:
# Eero Volotinen <eero.volotinen@iki.fi>
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://ping-viini.org
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.120316");
  script_version("$Revision: 11703 $");
  script_tag(name:"creation_date", value:"2015-09-08 13:23:24 +0200 (Tue, 08 Sep 2015)");
  script_tag(name:"last_modification", value:"$Date: 2018-10-01 10:05:31 +0200 (Mon, 01 Oct 2018) $");
  script_name("Amazon Linux Local Check: ALAS-2014-359");
  script_tag(name:"insight", value:"It was discovered that the asn1_get_bit_der() function of the libtasn1 library incorrectly reported the length of ASN.1-encoded data. Specially crafted ASN.1 input could cause an application using libtasn1 to perform an out-of-bounds access operation, causing the application to crash or, possibly, execute arbitrary code. (CVE-2014-3468 )Multiple incorrect buffer boundary check issues were discovered in libtasn1. Specially crafted ASN.1 input could cause an application using libtasn1 to crash. (CVE-2014-3467 )Multiple NULL pointer dereference flaws were found in libtasn1's asn1_read_value() function. Specially crafted ASN.1 input could cause an application using libtasn1 to crash, if the application used the aforementioned function in a certain way. (CVE-2014-3469 )");
  script_tag(name:"solution", value:"Run yum update libtasn1 to update your system.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://alas.aws.amazon.com/ALAS-2014-359.html");
  script_cve_id("CVE-2014-3467", "CVE-2014-3469", "CVE-2014-3468");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/amazon_linux", "ssh/login/release");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"summary", value:"Amazon Linux Local Security Checks");
  script_copyright("Eero Volotinen");
  script_family("Amazon Linux Local Security Checks");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "AMAZON")
{
if ((res = isrpmvuln(pkg:"libtasn1-devel", rpm:"libtasn1-devel~2.3~6.6.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"libtasn1", rpm:"libtasn1~2.3~6.6.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"libtasn1-tools", rpm:"libtasn1-tools~2.3~6.6.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"libtasn1-debuginfo", rpm:"libtasn1-debuginfo~2.3~6.6.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99);
  exit(0);
}
