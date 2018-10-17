###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2014_1650_1.nasl 8046 2017-12-08 08:48:56Z santu $
#
# SuSE Update for flash-player SUSE-SU-2014:1650-1 (flash-player)
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
  script_oid("1.3.6.1.4.1.25623.1.0.850972");
  script_version("$Revision: 8046 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-08 09:48:56 +0100 (Fri, 08 Dec 2017) $");
  script_tag(name:"creation_date", value:"2015-10-16 15:18:24 +0200 (Fri, 16 Oct 2015)");
  script_cve_id("CVE-2014-0580", "CVE-2014-0587", "CVE-2014-8443", "CVE-2014-9162", "CVE-2014-9163", "CVE-2014-9164");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for flash-player SUSE-SU-2014:1650-1 (flash-player)");
  script_tag(name: "summary", value: "Check the version of flash-player");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  This flash-player security update fixes the following issues:

  * Security update to 11.2.202.425 (bnc#909219):
  o APSB14-27, CVE-2014-0580, CVE-2014-0587, CVE-2014-8443,
  CVE-2014-9162, CVE-2014-9163, CVE-2014-9164

  Security Issues:

  * CVE-2014-0580
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-0580 
  * CVE-2014-0587
  http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-0587 
  * CVE-2014-8443
  http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-8443 
  * CVE-2014-9162
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-9162 
  * CVE-2014-9163
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-9163 
  * CVE-2014-9164
  http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-9164");
  script_tag(name: "affected", value: "flash-player on SUSE Linux Enterprise Desktop 11 SP3");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "SUSE-SU", value: "2014:1650_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
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

if(release == "SLED11.0SP3")
{

  if ((res = isrpmvuln(pkg:"flash-player", rpm:"flash-player~11.2.202.425~0.3.1", rls:"SLED11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"flash-player-gnome", rpm:"flash-player-gnome~11.2.202.425~0.3.1", rls:"SLED11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"flash-player-kde4", rpm:"flash-player-kde4~11.2.202.425~0.3.1", rls:"SLED11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
