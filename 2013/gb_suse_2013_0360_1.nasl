###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2013_0360_1.nasl 12294 2018-11-09 15:31:55Z cfischer $
#
# SuSE Update for flash-player openSUSE-SU-2013:0360-1 (flash-player)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_xref(name:"URL" , value:"http://lists.opensuse.org/opensuse-security-announce/2013-02/msg00026.html");
  script_oid("1.3.6.1.4.1.25623.1.0.850411");
  script_version("$Revision: 12294 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-09 16:31:55 +0100 (Fri, 09 Nov 2018) $");
  script_tag(name:"creation_date", value:"2013-03-11 18:29:51 +0530 (Mon, 11 Mar 2013)");
  script_cve_id("CVE-2013-0504", "CVE-2013-0643", "CVE-2013-0648");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name:"openSUSE-SU", value:"2013:0360_1");
  script_name("SuSE Update for flash-player openSUSE-SU-2013:0360-1 (flash-player)");

  script_tag(name:"summary", value:"Check for the Version of flash-player");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSE11\.4");
  script_tag(name:"affected", value:"flash-player on openSUSE 11.4");
  script_tag(name:"solution", value:"Please install the updated packages.");
  script_tag(name:"insight", value:"Flash Player was updated to 11.2.202.273 to fix critical
  security issues: (bnc#806415)

  * APSB13-08, CVE-2013-0504, CVE-2013-0643, CVE-2013-0648

  More information can be found on:
  https://www.adobe.com/support/security/bulletins/apsb13-08.html");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);
res = "";

if(release == "openSUSE11.4")
{

  if ((res = isrpmvuln(pkg:"flash-player", rpm:"flash-player~11.2.202.273~51.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"flash-player-gnome", rpm:"flash-player-gnome~11.2.202.273~51.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"flash-player-kde4", rpm:"flash-player-kde4~11.2.202.273~51.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
