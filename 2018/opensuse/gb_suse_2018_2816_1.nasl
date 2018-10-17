###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2018_2816_1.nasl 11667 2018-09-28 07:49:01Z santu $
#
# SuSE Update for nodejs6 openSUSE-SU-2018:2816-1 (nodejs6)
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
  script_oid("1.3.6.1.4.1.25623.1.0.851907");
  script_version("$Revision: 11667 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-28 09:49:01 +0200 (Fri, 28 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-09-25 08:23:28 +0200 (Tue, 25 Sep 2018)");
  script_cve_id("CVE-2018-0732", "CVE-2018-12115");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for nodejs6 openSUSE-SU-2018:2816-1 (nodejs6)");
  script_tag(name:"summary", value:"Check the version of nodejs6");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"
  This update for nodejs6 to version 6.14.4 fixes the following issues:

  Security issues fixed:

  CVE-2018-12115: Fixed an out-of-bounds (OOB) write in Buffer.write() for
  UCS-2 encoding (bsc#1105019) CVE-2018-0732: Upgrade to OpenSSL 1.0.2p,
  fixing a client DoS due to large DH parameter (bsc#1097158)

  Other issues fixed:

  - Recommend same major version npm package (bsc#1097748)

  This update was imported from the SUSE:SLE-12:Update update project.


  Patch Instructions:

  To install this openSUSE Security Update use the SUSE recommended
  installation methods
  like YaST online_update or 'zypper patch'.

  Alternatively you can run the command listed for your product:

  - openSUSE Leap 42.3:

  zypper in -t patch openSUSE-2018-1041=1");
  script_tag(name:"affected", value:"nodejs6 on openSUSE Leap 42.3");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"openSUSE-SU", value:"2018:2816_1");
  script_xref(name:"URL" , value:"http://lists.opensuse.org/opensuse-security-announce/2018-09/msg00064.html");
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

  if ((res = isrpmvuln(pkg:"nodejs6", rpm:"nodejs6~6.14.4~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nodejs6-debuginfo", rpm:"nodejs6-debuginfo~6.14.4~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nodejs6-debugsource", rpm:"nodejs6-debugsource~6.14.4~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nodejs6-devel", rpm:"nodejs6-devel~6.14.4~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"npm6", rpm:"npm6~6.14.4~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nodejs6-docs", rpm:"nodejs6-docs~6.14.4~15.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
