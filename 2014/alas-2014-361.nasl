###############################################################################
# OpenVAS Vulnerability Test
# $Id: alas-2014-361.nasl 6769 2017-07-20 09:56:33Z teissa$
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
  script_oid("1.3.6.1.4.1.25623.1.0.120144");
  script_version("$Revision: 11703 $");
  script_tag(name:"creation_date", value:"2015-09-08 13:18:32 +0200 (Tue, 08 Sep 2015)");
  script_tag(name:"last_modification", value:"$Date: 2018-10-01 10:05:31 +0200 (Mon, 01 Oct 2018) $");
  script_name("Amazon Linux Local Check: ALAS-2014-361");
  script_tag(name:"insight", value:"The cdf_unpack_summary_info function in cdf.c in the Fileinfo component in PHP before 5.4.29 and 5.5.x before 5.5.13 allows remote attackers to cause a denial of service (performance degradation) by triggering many file_printf calls.The cdf_read_property_info function in cdf.c in the Fileinfo component in PHP before 5.4.29 and 5.5.x before 5.5.13 allows remote attackers to cause a denial of service (infinite loop or out-of-bounds memory access) via a vector that (1) has zero length or (2) is too long.");
  script_tag(name:"solution", value:"Run yum update php54 to update your system.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://alas.aws.amazon.com/ALAS-2014-361.html");
  script_cve_id("CVE-2014-0237", "CVE-2014-0238");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
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
if ((res = isrpmvuln(pkg:"php54-tidy", rpm:"php54-tidy~5.4.29~1.55.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-mssql", rpm:"php54-mssql~5.4.29~1.55.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-soap", rpm:"php54-soap~5.4.29~1.55.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-mysqlnd", rpm:"php54-mysqlnd~5.4.29~1.55.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-embedded", rpm:"php54-embedded~5.4.29~1.55.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-process", rpm:"php54-process~5.4.29~1.55.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-recode", rpm:"php54-recode~5.4.29~1.55.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-ldap", rpm:"php54-ldap~5.4.29~1.55.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-cli", rpm:"php54-cli~5.4.29~1.55.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-common", rpm:"php54-common~5.4.29~1.55.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-pspell", rpm:"php54-pspell~5.4.29~1.55.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-xml", rpm:"php54-xml~5.4.29~1.55.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-imap", rpm:"php54-imap~5.4.29~1.55.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-snmp", rpm:"php54-snmp~5.4.29~1.55.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-pgsql", rpm:"php54-pgsql~5.4.29~1.55.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-mcrypt", rpm:"php54-mcrypt~5.4.29~1.55.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-intl", rpm:"php54-intl~5.4.29~1.55.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-gd", rpm:"php54-gd~5.4.29~1.55.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-debuginfo", rpm:"php54-debuginfo~5.4.29~1.55.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-fpm", rpm:"php54-fpm~5.4.29~1.55.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-xmlrpc", rpm:"php54-xmlrpc~5.4.29~1.55.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-pdo", rpm:"php54-pdo~5.4.29~1.55.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54", rpm:"php54~5.4.29~1.55.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-dba", rpm:"php54-dba~5.4.29~1.55.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-bcmath", rpm:"php54-bcmath~5.4.29~1.55.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-mbstring", rpm:"php54-mbstring~5.4.29~1.55.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-enchant", rpm:"php54-enchant~5.4.29~1.55.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-mysql", rpm:"php54-mysql~5.4.29~1.55.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-devel", rpm:"php54-devel~5.4.29~1.55.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-odbc", rpm:"php54-odbc~5.4.29~1.55.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99);
  exit(0);
}
