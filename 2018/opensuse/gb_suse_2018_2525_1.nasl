###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2018_2525_1.nasl 12280 2018-11-09 10:01:52Z cfischer $
#
# SuSE Update for phpMyAdmin openSUSE-SU-2018:2525-1 (phpMyAdmin)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.851870");
  script_version("$Revision: 12280 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-09 11:01:52 +0100 (Fri, 09 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-08-27 07:26:04 +0200 (Mon, 27 Aug 2018)");
  script_cve_id("CVE-2018-15605");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for phpMyAdmin openSUSE-SU-2018:2525-1 (phpMyAdmin)");
  script_tag(name:"summary", value:"Check the version of phpMyAdmin");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"This update for phpMyAdmin to version 4.8.3 addresses multiple issues.

  Security issues fixed:

  - CVE-2018-15605: vulnerability in the file import feature allowed
  cross-site scripting via importing a specially-crafted file
  (PMASA-2018-5, boo#1105726)

  This update also contains a number of upstream bug fixes in the UI and
  behavior.


  Patch Instructions:

  To install this openSUSE Security Update use the SUSE recommended
  installation methods
  like YaST online_update or 'zypper patch'.

  Alternatively you can run the command listed for your product:

  - openSUSE Leap 42.3:

  zypper in -t patch openSUSE-2018-939=1

  - openSUSE Leap 15.0:

  zypper in -t patch openSUSE-2018-939=1");
  script_tag(name:"affected", value:"phpMyAdmin on openSUSE Leap 42.3");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"openSUSE-SU", value:"2018:2525_1");
  script_xref(name:"URL" , value:"http://lists.opensuse.org/opensuse-security-announce/2018-08/msg00081.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSELeap42\.3");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);
res = "";

if(release == "openSUSELeap42.3")
{

  if ((res = isrpmvuln(pkg:"phpMyAdmin", rpm:"phpMyAdmin~4.8.3~21.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
