###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2016_0715_1.nasl 8047 2017-12-08 08:56:07Z santu $
#
# SuSE Update for flash-player SUSE-SU-2016:0715-1 (flash-player)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.851231");
  script_version("$Revision: 8047 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-08 09:56:07 +0100 (Fri, 08 Dec 2017) $");
  script_tag(name:"creation_date", value:"2016-03-12 06:14:42 +0100 (Sat, 12 Mar 2016)");
  script_cve_id("CVE-2016-0960", "CVE-2016-0961", "CVE-2016-0962", "CVE-2016-0963", 
                "CVE-2016-0986", "CVE-2016-0987", "CVE-2016-0988", "CVE-2016-0989", 
                "CVE-2016-0990", "CVE-2016-0991", "CVE-2016-0992", "CVE-2016-0993", 
                "CVE-2016-0994", "CVE-2016-0995", "CVE-2016-0996", "CVE-2016-0997", 
                "CVE-2016-0998", "CVE-2016-0999", "CVE-2016-1000", "CVE-2016-1001", 
                "CVE-2016-1002", "CVE-2016-1005", "CVE-2016-1010");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for flash-player SUSE-SU-2016:0715-1 (flash-player)");
  script_tag(name: "summary", value: "Check the version of flash-player");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  Adobe flash-player was updated to 11.2.202.577 to fix the following list
  of security issues (bsc#970547):

  These updates resolve integer overflow vulnerabilities that could lead to
  code execution (CVE-2016-0963, CVE-2016-0993, CVE-2016-1010).

  These updates resolve use-after-free vulnerabilities that could lead to
  code execution (CVE-2016-0987, CVE-2016-0988, CVE-2016-0990,
  CVE-2016-0991, CVE-2016-0994, CVE-2016-0995, CVE-2016-0996, CVE-2016-0997,
  CVE-2016-0998, CVE-2016-0999, CVE-2016-1000).

  These updates resolve a heap overflow vulnerability that could lead to
  code execution (CVE-2016-1001).

  These updates resolve memory corruption vulnerabilities that could lead to
  code execution (CVE-2016-0960, CVE-2016-0961, CVE-2016-0962,
  CVE-2016-0986, CVE-2016-0989, CVE-2016-0992, CVE-2016-1002, CVE-2016-1005).

  Adobe advisory with more information:
  https://helpx.adobe.com/security/products/flash-player/apsb16-08.html");
  script_tag(name: "affected", value: "flash-player on SUSE Linux Enterprise Desktop 12");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "SUSE-SU", value: "2016:0715_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "SLED12.0SP0")
{

  if ((res = isrpmvuln(pkg:"flash-player", rpm:"flash-player~11.2.202.577~123.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"flash-player-gnome", rpm:"flash-player-gnome~11.2.202.577~123.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
