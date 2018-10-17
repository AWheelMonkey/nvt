###############################################################################
# OpenVAS Vulnerability Test
# $Id: ELSA-2008-0885.nasl 11688 2018-09-28 13:36:28Z cfischer $
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
  script_oid("1.3.6.1.4.1.25623.1.0.122555");
  script_version("$Revision: 11688 $");
  script_tag(name:"creation_date", value:"2015-10-08 14:47:54 +0300 (Thu, 08 Oct 2015)");
  script_tag(name:"last_modification", value:"$Date: 2018-09-28 15:36:28 +0200 (Fri, 28 Sep 2018) $");
  script_name("Oracle Linux Local Check: ELSA-2008-0885");
  script_tag(name:"insight", value:"ELSA-2008-0885 - kernel security and bug fix update. Please see the references for more insight.");
  script_tag(name:"solution", value:"Update the affected packages to the latest available version.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"summary", value:"Oracle Linux Local Security Checks ELSA-2008-0885");
  script_xref(name:"URL", value:"http://linux.oracle.com/errata/ELSA-2008-0885.html");
  script_cve_id("CVE-2007-6417", "CVE-2007-6716", "CVE-2008-2931", "CVE-2008-3272", "CVE-2008-3275");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/oracle_linux", "ssh/login/release", re:"ssh/login/release=OracleLinux5");
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
  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~2.6.18~92.1.13.0.1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-PAE", rpm:"kernel-PAE~2.6.18~92.1.13.0.1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-PAE-devel", rpm:"kernel-PAE-devel~2.6.18~92.1.13.0.1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-debug", rpm:"kernel-debug~2.6.18~92.1.13.0.1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-debug-devel", rpm:"kernel-debug-devel~2.6.18~92.1.13.0.1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-devel", rpm:"kernel-devel~2.6.18~92.1.13.0.1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-doc", rpm:"kernel-doc~2.6.18~92.1.13.0.1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-headers", rpm:"kernel-headers~2.6.18~92.1.13.0.1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-xen", rpm:"kernel-xen~2.6.18~92.1.13.0.1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-xen-devel", rpm:"kernel-xen-devel~2.6.18~92.1.13.0.1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"ocfs2", rpm:"ocfs2~2.6.18~92.1.13.0.1.el5~1.2.9~1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"ocfs2", rpm:"ocfs2~2.6.18~92.1.13.0.1.el5PAE~1.2.9~1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"ocfs2", rpm:"ocfs2~2.6.18~92.1.13.0.1.el5debug~1.2.9~1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"ocfs2", rpm:"ocfs2~2.6.18~92.1.13.0.1.el5xen~1.2.9~1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"oracleasm", rpm:"oracleasm~2.6.18~92.1.13.0.1.el5~2.0.4~1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"oracleasm", rpm:"oracleasm~2.6.18~92.1.13.0.1.el5PAE~2.0.4~1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"oracleasm", rpm:"oracleasm~2.6.18~92.1.13.0.1.el5debug~2.0.4~1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"oracleasm", rpm:"oracleasm~2.6.18~92.1.13.0.1.el5xen~2.0.4~1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }

}
if (__pkg_match) exit(99);
  exit(0);

