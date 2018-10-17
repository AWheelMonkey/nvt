###############################################################################
# OpenVAS Vulnerability Test
# $Id: alas-2016-668.nasl 6574 2017-07-06 13:41:26Z cfischer$
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
  script_oid("1.3.6.1.4.1.25623.1.0.120658");
  script_version("$Revision: 11856 $");
  script_tag(name:"creation_date", value:"2016-03-17 16:05:02 +0200 (Thu, 17 Mar 2016)");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 09:45:29 +0200 (Fri, 12 Oct 2018) $");
  script_name("Amazon Linux Local Check: alas-2016-668");
  script_tag(name:"insight", value:"It was discovered that the OpenSSH server did not sanitize data received in requests to enable X11 forwarding. An authenticated client with restricted SSH access could possibly use this flaw to bypass intended restrictions.");
  script_tag(name:"solution", value:"Run yum update openssh to update your system.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://alas.aws.amazon.com/ALAS-2016-668.html");
  script_cve_id("CVE-2016-3115");
  script_tag(name:"cvss_base", value:"5.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:N");
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
if ((res = isrpmvuln(pkg:"openssh-server", rpm:"openssh-server~6.6.1p1~23.60.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"openssh-keycat", rpm:"openssh-keycat~6.6.1p1~23.60.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"openssh-debuginfo", rpm:"openssh-debuginfo~6.6.1p1~23.60.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"openssh", rpm:"openssh~6.6.1p1~23.60.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"auth", rpm:"auth~0.9.3~9.23.60.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"openssh-ldap", rpm:"openssh-ldap~6.6.1p1~23.60.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"openssh-clients", rpm:"openssh-clients~6.6.1p1~23.60.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99);
  exit(0);
}
