###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2014_0733_2.nasl 12381 2018-11-16 11:16:30Z cfischer $
#
# SuSE Update for IBM SUSE-SU-2014:0733-2 (IBM)
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
  script_oid("1.3.6.1.4.1.25623.1.0.850811");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2015-10-13 18:35:01 +0530 (Tue, 13 Oct 2015)");
  script_cve_id("CVE-2013-6629", "CVE-2013-6954", "CVE-2014-0428", "CVE-2014-0429",
                "CVE-2014-0446", "CVE-2014-0448", "CVE-2014-0449", "CVE-2014-0451",
                "CVE-2014-0452", "CVE-2014-0453", "CVE-2014-0454", "CVE-2014-0455",
                "CVE-2014-0457", "CVE-2014-0458", "CVE-2014-0459", "CVE-2014-0460",
                "CVE-2014-0461", "CVE-2014-0878", "CVE-2014-1876", "CVE-2014-2398",
                "CVE-2014-2401", "CVE-2014-2402", "CVE-2014-2409", "CVE-2014-2412",
                "CVE-2014-2414", "CVE-2014-2420", "CVE-2014-2421", "CVE-2014-2423",
                "CVE-2014-2427", "CVE-2014-2428");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for IBM SUSE-SU-2014:0733-2 (IBM)");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'IBM'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"IBM Java 7 was updated to version SR7, which received security and bug
  fixes.");

  script_xref(name:"URL", value:"http://www.ibm.com/developerworks/java/jdk/aix/j764/Java7_64.fixes.html#SR7");

  script_tag(name:"affected", value:"IBM on SUSE Linux Enterprise Server 11 SP3");
  script_tag(name:"solution", value:"Please install the updated packages.");
  script_xref(name:"SUSE-SU", value:"2014:0733_2");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=SLES11\.0SP3");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);
res = "";

if(release == "SLES11.0SP3")
{

  if ((res = isrpmvuln(pkg:"java-1_7_0-ibm", rpm:"java-1_7_0-ibm~1.7.0_sr7.0~0.5.1", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_7_0-ibm-jdbc", rpm:"java-1_7_0-ibm-jdbc~1.7.0_sr7.0~0.5.1", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_7_0-ibm-alsa", rpm:"java-1_7_0-ibm-alsa~1.7.0_sr7.0~0.5.1", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_7_0-ibm-plugin", rpm:"java-1_7_0-ibm-plugin~1.7.0_sr7.0~0.5.1", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
