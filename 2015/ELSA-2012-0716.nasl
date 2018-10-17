###############################################################################
# OpenVAS Vulnerability Test
# $Id: ELSA-2012-0716.nasl 11688 2018-09-28 13:36:28Z cfischer $
#
# Oracle Linux Local Check
#
# Authors:
# Eero Volotinen <eero.volotinen@solinor.com>
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://solinor.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.123908");
  script_version("$Revision: 11688 $");
  script_tag(name:"creation_date", value:"2015-10-06 14:10:09 +0300 (Tue, 06 Oct 2015)");
  script_tag(name:"last_modification", value:"$Date: 2018-09-28 15:36:28 +0200 (Fri, 28 Sep 2018) $");
  script_name("Oracle Linux Local Check: ELSA-2012-0716");
  script_tag(name:"insight", value:"ELSA-2012-0716 - bind security update. Please see the references for more insight.");
  script_tag(name:"solution", value:"Update the affected packages to the latest available version.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"summary", value:"Oracle Linux Local Security Checks ELSA-2012-0716");
  script_xref(name:"URL", value:"http://linux.oracle.com/errata/ELSA-2012-0716.html");
  script_cve_id("CVE-2012-1033", "CVE-2012-1667");
  script_tag(name:"cvss_base", value:"8.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:C");
  script_tag(name:"qod_type", value:"package");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/oracle_linux", "ssh/login/release", re:"ssh/login/release=OracleLinux(5|6)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Eero Volotinen");
  script_family("Oracle Linux Local Security Checks");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "OracleLinux5")
{
  if ((res = isrpmvuln(pkg:"bind", rpm:"bind~9.3.6~20.P1.el5_8.1", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"bind-chroot", rpm:"bind-chroot~9.3.6~20.P1.el5_8.1", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"bind-devel", rpm:"bind-devel~9.3.6~20.P1.el5_8.1", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"bind-libbind-devel", rpm:"bind-libbind-devel~9.3.6~20.P1.el5_8.1", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"bind-libs", rpm:"bind-libs~9.3.6~20.P1.el5_8.1", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"bind-sdb", rpm:"bind-sdb~9.3.6~20.P1.el5_8.1", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"bind-utils", rpm:"bind-utils~9.3.6~20.P1.el5_8.1", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"caching-nameserver", rpm:"caching-nameserver~9.3.6~20.P1.el5_8.1", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }

}
if(release == "OracleLinux6")
{
  if ((res = isrpmvuln(pkg:"bind", rpm:"bind~9.7.3~8.P3.el6_2.3", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"bind-chroot", rpm:"bind-chroot~9.7.3~8.P3.el6_2.3", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"bind-devel", rpm:"bind-devel~9.7.3~8.P3.el6_2.3", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"bind-libs", rpm:"bind-libs~9.7.3~8.P3.el6_2.3", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"bind-sdb", rpm:"bind-sdb~9.7.3~8.P3.el6_2.3", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"bind-utils", rpm:"bind-utils~9.7.3~8.P3.el6_2.3", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);
  }

}
if (__pkg_match) exit(99);
  exit(0);

