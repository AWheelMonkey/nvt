###############################################################################
# OpenVAS Vulnerability Test
# $Id: ELSA-2016-0650.nasl 11856 2018-10-12 07:45:29Z cfischer $
#
# Oracle Linux Local Check
#
# Authors:
# Eero Volotinen <eero.volotinen@solinor.fi>
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://solinor.fi
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
  script_oid("1.3.6.1.4.1.25623.1.0.122937");
  script_version("$Revision: 11856 $");
  script_tag(name:"creation_date", value:"2016-05-09 14:24:53 +0300 (Mon, 09 May 2016)");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 09:45:29 +0200 (Fri, 12 Oct 2018) $");
  script_name("Oracle Linux Local Check: ELSA-2016-0650");
  script_tag(name:"insight", value:"ELSA-2016-0650 - java-1.8.0-openjdk security update. Please see the references for more insight.");
  script_tag(name:"solution", value:"Update the affected packages to the latest available version.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"summary", value:"Oracle Linux Local Security Checks ELSA-2016-0650");
  script_xref(name:"URL", value:"http://linux.oracle.com/errata/ELSA-2016-0650.html");
  script_cve_id("CVE-2016-0686", "CVE-2016-0687", "CVE-2016-0695", "CVE-2016-3425", "CVE-2016-3426", "CVE-2016-3427");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/oracle_linux", "ssh/login/release", re:"ssh/login/release=OracleLinux7");
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

if(release == "OracleLinux7")
{
  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk", rpm:"java-1.8.0-openjdk~1.8.0.91~0.b14.el7_2", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-accessibility", rpm:"java-1.8.0-openjdk-accessibility~1.8.0.91~0.b14.el7_2", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-accessibility-debug", rpm:"java-1.8.0-openjdk-accessibility~debug~1.8.0.91~0.b14.el7_2", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"java", rpm:"java~1.8.0~openjdk~debug~1.8.0.91~0.b14.el7_2", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-demo", rpm:"java-1.8.0-openjdk-demo~1.8.0.91~0.b14.el7_2", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-demo-debug", rpm:"java-1.8.0-openjdk-demo~debug~1.8.0.91~0.b14.el7_2", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-devel", rpm:"java-1.8.0-openjdk-devel~1.8.0.91~0.b14.el7_2", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-devel-debug", rpm:"java-1.8.0-openjdk-devel~debug~1.8.0.91~0.b14.el7_2", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-headless", rpm:"java-1.8.0-openjdk-headless~1.8.0.91~0.b14.el7_2", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-headless-debug", rpm:"java-1.8.0-openjdk-headless~debug~1.8.0.91~0.b14.el7_2", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-javadoc", rpm:"java-1.8.0-openjdk-javadoc~1.8.0.91~0.b14.el7_2", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-javadoc-debug", rpm:"java-1.8.0-openjdk-javadoc~debug~1.8.0.91~0.b14.el7_2", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-src", rpm:"java-1.8.0-openjdk-src~1.8.0.91~0.b14.el7_2", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-src-debug", rpm:"java-1.8.0-openjdk-src~debug~1.8.0.91~0.b14.el7_2", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);
  }

}
if (__pkg_match) exit(99);
  exit(0);

