###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2015_0135_1.nasl 12288 2018-11-09 14:02:45Z cfischer $
#
# SuSE Update for flash-player SUSE-SU-2015:0135-1 (flash-player)
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
  script_oid("1.3.6.1.4.1.25623.1.0.850952");
  script_version("$Revision: 12288 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-09 15:02:45 +0100 (Fri, 09 Nov 2018) $");
  script_tag(name:"creation_date", value:"2015-10-16 14:56:47 +0200 (Fri, 16 Oct 2015)");
  script_cve_id("CVE-2015-0310");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for flash-player SUSE-SU-2015:0135-1 (flash-player)");
  script_tag(name:"summary", value:"Check the version of flash-player");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Adobe Flash Player was updated to version 11.2.202.438 to fix one security
  issue. (APSB15-02, CVE-2015-0310)");

  script_xref(name:"URL", value:"http://helpx.adobe.com/security/products/flash-player/apsb15-02.html");

  script_tag(name:"affected", value:"flash-player on SUSE Linux Enterprise Desktop 11 SP3");
  script_tag(name:"solution", value:"Please install the updated packages.");
  script_xref(name:"SUSE-SU", value:"2015:0135_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=SLED11\.0SP3");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);
res = "";

if(release == "SLED11.0SP3")
{

  if ((res = isrpmvuln(pkg:"flash-player", rpm:"flash-player~11.2.202.438~0.3.1", rls:"SLED11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"flash-player-gnome", rpm:"flash-player-gnome~11.2.202.438~0.3.1", rls:"SLED11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"flash-player-kde4", rpm:"flash-player-kde4~11.2.202.438~0.3.1", rls:"SLED11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
