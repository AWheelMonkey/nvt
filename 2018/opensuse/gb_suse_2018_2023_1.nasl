###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2018_2023_1.nasl 11388 2018-09-14 13:45:12Z cfischer $
#
# SuSE Update for mercurial openSUSE-SU-2018:2023-1 (mercurial)
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
  script_oid("1.3.6.1.4.1.25623.1.0.851819");
  script_version("$Revision: 11388 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-14 15:45:12 +0200 (Fri, 14 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-07-20 05:54:46 +0200 (Fri, 20 Jul 2018)");
  script_cve_id("CVE-2018-13346", "CVE-2018-13347", "CVE-2018-13348");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for mercurial openSUSE-SU-2018:2023-1 (mercurial)");
  script_tag(name:"summary", value:"Check the version of mercurial");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"
  This update for mercurial fixes the following issues:

  Security issues fixed:

  - CVE-2018-13348: Fix the mpatch_decode function in mpatch.c that
  mishandles certain situations where there should be at least 12 bytes
  remaining after thecurrent position in the patch data (boo#1100353).
  - CVE-2018-13347: Fix mpatch.c that mishandles integer addition and
  subtraction (boo#1100355).
  - CVE-2018-13346: Fix the mpatch_apply function in mpatch.c that
  incorrectly proceeds in cases where the fragment start is past the end
  of the original data (boo#1100354).


  Patch Instructions:

  To install this openSUSE Security Update use the SUSE recommended 
  installation methods
  like YaST online_update or 'zypper patch'.

  Alternatively you can run the command listed for your product:

  - openSUSE Leap 42.3:

  zypper in -t patch openSUSE-2018-734=1");
  script_tag(name:"affected", value:"mercurial on openSUSE Leap 42.3");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"openSUSE-SU", value:"2018:2023_1");
  script_xref(name:"URL" , value:"http://lists.opensuse.org/opensuse-security-announce/2018-07/msg00030.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
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

if(release == "openSUSELeap42.3")
{

  if ((res = isrpmvuln(pkg:"mercurial", rpm:"mercurial~4.2.3~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mercurial-debuginfo", rpm:"mercurial-debuginfo~4.2.3~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mercurial-debugsource", rpm:"mercurial-debugsource~4.2.3~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mercurial-lang", rpm:"mercurial-lang~4.2.3~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}