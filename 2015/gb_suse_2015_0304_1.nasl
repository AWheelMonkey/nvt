###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2015_0304_1.nasl 12381 2018-11-16 11:16:30Z cfischer $
#
# SuSE Update for java-1_7_1-ibm SUSE-SU-2015:0304-1 (java-1_7_1-ibm)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
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
  script_oid("1.3.6.1.4.1.25623.1.0.851074");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2015-10-16 19:31:15 +0200 (Fri, 16 Oct 2015)");
  script_cve_id("CVE-2014-8891", "CVE-2014-8892");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for java-1_7_1-ibm SUSE-SU-2015:0304-1 (java-1_7_1-ibm)");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'java-1_7_1-ibm'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"java-1_7_1-ibm was updated to fix two security issues.

  These security issues were fixed:

  - CVE-2014-8892: Unspecified vulnerability (bnc#916265).

  - CVE-2014-8891: Unspecified vulnerability (bnc#916266).");
  script_tag(name:"affected", value:"java-1_7_1-ibm on SUSE Linux Enterprise Server 12");
  script_tag(name:"solution", value:"Please install the updated packages.");
  script_xref(name:"SUSE-SU", value:"2015:0304_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=SLES12\.0SP0");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);
res = "";

if(release == "SLES12.0SP0")
{

  if ((res = isrpmvuln(pkg:"java-1_7_1-ibm", rpm:"java-1_7_1-ibm~1.7.1_sr2.10~8.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_7_1-ibm-jdbc", rpm:"java-1_7_1-ibm-jdbc~1.7.1_sr2.10~8.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_7_1-ibm-alsa", rpm:"java-1_7_1-ibm-alsa~1.7.1_sr2.10~8.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_7_1-ibm-plugin", rpm:"java-1_7_1-ibm-plugin~1.7.1_sr2.10~8.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}