###############################################################################
# OpenVAS Vulnerability Test
# $Id: alas-2016-634.nasl 6574 2017-07-06 13:41:26Z cfischer$
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
  script_oid("1.3.6.1.4.1.25623.1.0.120624");
  script_version("$Revision: 11703 $");
  script_tag(name:"creation_date", value:"2016-01-20 07:22:43 +0200 (Wed, 20 Jan 2016)");
  script_tag(name:"last_modification", value:"$Date: 2018-10-01 10:05:31 +0200 (Mon, 01 Oct 2018) $");
  script_name("Amazon Linux Local Check: alas-2016-634");
  script_tag(name:"insight", value:"A missing access control flaw was found in Samba. A remote, authenticated attacker could use this flaw to view the current snapshot on a Samba share, despite not having DIRECTORY_LIST access rights.An access flaw was found in the way Samba verified symbolic links when creating new files on a Samba share. A remote attacker could exploit this flaw to gain access to files outside of Samba's share path. A memory-read flaw was found in the way the libldb library processed LDB DN records with a null byte. An authenticated, remote attacker could use this flaw to read heap-memory pages from the server. A man-in-the-middle vulnerability was found in the way 'connection signing' was implemented by Samba. A remote attacker could use this flaw to downgrade an existing Samba client connection and force the use of plain text.");
  script_tag(name:"solution", value:"Run yum update samba to update your system.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://alas.aws.amazon.com/ALAS-2016-634.html");
  script_cve_id("CVE-2015-5299", "CVE-2015-5252", "CVE-2015-5330", "CVE-2015-5296");
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
if ((res = isrpmvuln(pkg:"samba-devel", rpm:"samba-devel~4.2.3~11.28.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"libsmbclient-devel", rpm:"libsmbclient-devel~4.2.3~11.28.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"samba-winbind-modules", rpm:"samba-winbind-modules~4.2.3~11.28.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"ctdb-tests", rpm:"ctdb-tests~4.2.3~11.28.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"samba-client", rpm:"samba-client~4.2.3~11.28.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"samba-debuginfo", rpm:"samba-debuginfo~4.2.3~11.28.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"samba-libs", rpm:"samba-libs~4.2.3~11.28.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"samba-winbind", rpm:"samba-winbind~4.2.3~11.28.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"samba-test", rpm:"samba-test~4.2.3~11.28.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"samba-client-libs", rpm:"samba-client-libs~4.2.3~11.28.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"samba-common-libs", rpm:"samba-common-libs~4.2.3~11.28.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"libwbclient-devel", rpm:"libwbclient-devel~4.2.3~11.28.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"ctdb", rpm:"ctdb~4.2.3~11.28.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"samba-test-libs", rpm:"samba-test-libs~4.2.3~11.28.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"samba-test-devel", rpm:"samba-test-devel~4.2.3~11.28.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"samba-winbind-krb5-locator", rpm:"samba-winbind-krb5-locator~4.2.3~11.28.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"samba", rpm:"samba~4.2.3~11.28.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"samba-common-tools", rpm:"samba-common-tools~4.2.3~11.28.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"samba-winbind-clients", rpm:"samba-winbind-clients~4.2.3~11.28.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"libsmbclient", rpm:"libsmbclient~4.2.3~11.28.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"samba-python", rpm:"samba-python~4.2.3~11.28.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"libwbclient", rpm:"libwbclient~4.2.3~11.28.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"ctdb-devel", rpm:"ctdb-devel~4.2.3~11.28.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"samba-pidl", rpm:"samba-pidl~4.2.3~11.28.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"samba-common", rpm:"samba-common~4.2.3~11.28.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99);
  exit(0);
}
