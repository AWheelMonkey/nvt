###############################################################################
# OpenVAS Vulnerability Test
# $Id: alas-2014-460.nasl 6995 2017-08-23 11:52:03Z teissa$
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
  script_oid("1.3.6.1.4.1.25623.1.0.120101");
  script_version("$Revision: 11703 $");
  script_tag(name:"creation_date", value:"2015-09-08 13:17:26 +0200 (Tue, 08 Sep 2015)");
  script_tag(name:"last_modification", value:"$Date: 2018-10-01 10:05:31 +0200 (Mon, 01 Oct 2018) $");
  script_name("Amazon Linux Local Check: ALAS-2014-460");
  script_tag(name:"insight", value:"The (1) Zend_Ldap class in Zend before 1.12.9 and (2) Zend\Ldap component in Zend 2.x before 2.2.8 and 2.3.x before 2.3.3 allows remote attackers to bypass authentication via a password starting with a null byte, which triggers an unauthenticated bind. (CVE-2014-8088 )The 1.12.9, 2.2.8, and 2.3.3 releases of the Zend Framework fix an SQL injection issue when using the sqlsrv PHP extension. Full details are available in the upstream advisory.  (CVE-2014-8089 )");
  script_tag(name:"solution", value:"Run yum update php-ZendFramework to update your system.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://alas.aws.amazon.com/ALAS-2014-460.html");
  script_cve_id("CVE-2014-8088", "CVE-2014-8089");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
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
if ((res = isrpmvuln(pkg:"php-ZendFramework-full", rpm:"php-ZendFramework-full~1.12.9~1.10.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php-ZendFramework-Serializer-Adapter-Igbinary", rpm:"php-ZendFramework-Serializer-Adapter-Igbinary~1.12.9~1.10.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php-ZendFramework-Db-Adapter-Pdo-Pgsql", rpm:"php-ZendFramework-Db-Adapter-Pdo-Pgsql~1.12.9~1.10.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php-ZendFramework-Db-Adapter-Pdo-Mssql", rpm:"php-ZendFramework-Db-Adapter-Pdo-Mssql~1.12.9~1.10.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php-ZendFramework-extras", rpm:"php-ZendFramework-extras~1.12.9~1.10.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php-ZendFramework-Db-Adapter-Pdo", rpm:"php-ZendFramework-Db-Adapter-Pdo~1.12.9~1.10.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php-ZendFramework-Cache-Backend-Memcached", rpm:"php-ZendFramework-Cache-Backend-Memcached~1.12.9~1.10.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php-ZendFramework-Search-Lucene", rpm:"php-ZendFramework-Search-Lucene~1.12.9~1.10.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php-ZendFramework", rpm:"php-ZendFramework~1.12.9~1.10.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php-ZendFramework-Cache-Backend-Libmemcached", rpm:"php-ZendFramework-Cache-Backend-Libmemcached~1.12.9~1.10.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php-ZendFramework-Auth-Adapter-Ldap", rpm:"php-ZendFramework-Auth-Adapter-Ldap~1.12.9~1.10.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php-ZendFramework-Db-Adapter-Pdo-Mysql", rpm:"php-ZendFramework-Db-Adapter-Pdo-Mysql~1.12.9~1.10.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php-ZendFramework-Cache-Backend-Apc", rpm:"php-ZendFramework-Cache-Backend-Apc~1.12.9~1.10.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php-ZendFramework-Feed", rpm:"php-ZendFramework-Feed~1.12.9~1.10.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php-ZendFramework-Db-Adapter-Mysqli", rpm:"php-ZendFramework-Db-Adapter-Mysqli~1.12.9~1.10.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php-ZendFramework-Soap", rpm:"php-ZendFramework-Soap~1.12.9~1.10.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php-ZendFramework-Services", rpm:"php-ZendFramework-Services~1.12.9~1.10.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php-ZendFramework-Ldap", rpm:"php-ZendFramework-Ldap~1.12.9~1.10.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php-ZendFramework-Dojo", rpm:"php-ZendFramework-Dojo~1.12.9~1.10.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php-ZendFramework-demos", rpm:"php-ZendFramework-demos~1.12.9~1.10.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php-ZendFramework-Captcha", rpm:"php-ZendFramework-Captcha~1.12.9~1.10.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php-ZendFramework-Pdf", rpm:"php-ZendFramework-Pdf~1.12.9~1.10.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php-ZendFramework", rpm:"php-ZendFramework~1.12.9~1.10.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99);
  exit(0);
}
