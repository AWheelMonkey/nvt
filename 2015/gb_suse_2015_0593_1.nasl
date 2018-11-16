###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2015_0593_1.nasl 12294 2018-11-09 15:31:55Z cfischer $
#
# SuSE Update for Mozilla SUSE-SU-2015:0593-1 (Mozilla)
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
  script_oid("1.3.6.1.4.1.25623.1.0.850813");
  script_version("$Revision: 12294 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-09 16:31:55 +0100 (Fri, 09 Nov 2018) $");
  script_tag(name:"creation_date", value:"2015-10-13 16:40:04 +0530 (Tue, 13 Oct 2015)");
  script_cve_id("CVE-2015-0817", "CVE-2015-0818");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for Mozilla SUSE-SU-2015:0593-1 (Mozilla)");
  script_tag(name:"summary", value:"Check the version of Mozilla");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"MozillaFirefox was updated to the 31.5.3ESR release to fix two security
  vulnerabilities:
  MFSA 2015-29 / CVE-2015-0817: Security researcher ilxu1a reported,
  through HP Zero Day Initiative's Pwn2Own contest, a flaw in Mozilla's
  implementation of typed array bounds checking in JavaScript just-in-time
  compilation (JIT) and its management of bounds checking for heap access.
  This flaw can be leveraged into the reading and writing of memory allowing
  for arbitrary code execution on the local system.

  MFSA 2015-28 / CVE-2015-0818: Security researcher Mariusz Mlynski
  reported, through HP Zero Day Initiative's Pwn2Own contest, a method to
  run arbitrary scripts in a privileged context. This bypassed the
  same-origin policy protections by using a flaw in the processing of SVG
  format content navigation.

  Security Issues:

  * CVE-2015-0817

  * CVE-2015-0818");
  script_tag(name:"affected", value:"Mozilla on SUSE Linux Enterprise Server 11 SP3");
  script_tag(name:"solution", value:"Please install the updated packages.");
  script_xref(name:"SUSE-SU", value:"2015:0593_1");
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

  if ((res = isrpmvuln(pkg:"MozillaFirefox", rpm:"MozillaFirefox~31.5.3esr~0.8.1", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"MozillaFirefox-translations", rpm:"MozillaFirefox-translations~31.5.3esr~0.8.1", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
