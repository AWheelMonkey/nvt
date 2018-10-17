###############################################################################
# OpenVAS Vulnerability Test
# $Id: alas-2016-637.nasl 6574 2017-07-06 13:41:26Z cfischer$
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
  script_oid("1.3.6.1.4.1.25623.1.0.120627");
  script_version("$Revision: 11703 $");
  script_tag(name:"creation_date", value:"2016-01-20 07:22:45 +0200 (Wed, 20 Jan 2016)");
  script_tag(name:"last_modification", value:"$Date: 2018-10-01 10:05:31 +0200 (Mon, 01 Oct 2018) $");
  script_name("Amazon Linux Local Check: alas-2016-637");
  script_tag(name:"insight", value:"ISC DHCP 4.x before 4.1-ESV-R12-P1 and 4.2.x and 4.3.x before 4.3.3-P1 allows remote attackers to cause a denial of service (application crash) via an invalid length field in a UDP IPv4 packet.");
  script_tag(name:"solution", value:"Run yum update dhcp to update your system.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://alas.aws.amazon.com/ALAS-2016-637.html");
  script_cve_id("CVE-2015-8605");
  script_tag(name:"cvss_base", value:"5.7");
  script_tag(name:"cvss_base_vector", value:"AV:A/AC:M/Au:N/C:N/I:N/A:C");
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
if ((res = isrpmvuln(pkg:"dhcp-debuginfo", rpm:"dhcp-debuginfo~4.1.1~43.P1.22.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"dhcp-devel", rpm:"dhcp-devel~4.1.1~43.P1.22.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"dhcp-common", rpm:"dhcp-common~4.1.1~43.P1.22.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"dhcp", rpm:"dhcp~4.1.1~43.P1.22.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"dhclient", rpm:"dhclient~4.1.1~43.P1.22.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99);
  exit(0);
}
