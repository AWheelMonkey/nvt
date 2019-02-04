###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2019_0020_1.nasl 13173 2019-01-21 06:39:39Z santu $
#
# SuSE Update for gpg2 openSUSE-SU-2019:0020-1 (gpg2)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2019 Greenbone Networks GmbH, http://www.greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
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
  script_oid("1.3.6.1.4.1.25623.1.0.852232");
  script_version("$Revision: 13173 $");
  script_cve_id("CVE-2018-1000858");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2019-01-21 07:39:39 +0100 (Mon, 21 Jan 2019) $");
  script_tag(name:"creation_date", value:"2019-01-12 04:02:26 +0100 (Sat, 12 Jan 2019)");
  script_name("SuSE Update for gpg2 openSUSE-SU-2019:0020-1 (gpg2)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSELeap15\.0");

  script_xref(name:"openSUSE-SU", value:"2019:0020_1");
  script_xref(name:"URL", value:"http://lists.opensuse.org/opensuse-security-announce/2019-01/msg00009.html");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'gpg2'
  package(s) announced via the openSUSE-SU-2019:0020_1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"This update for gpg2 fixes the following issue:

  Security issue fixed:

  - CVE-2018-1000858: Fixed a Cross Site Request Forgery(CSRF) vulnerability
  in dirmngr that can result in Attacker controlled CSRF (bsc#1120346).

  This update was imported from the SUSE:SLE-15:Update update project.


  Patch Instructions:

  To install this openSUSE Security Update use the SUSE recommended
  installation methods
  like YaST online_update or 'zypper patch'.

  Alternatively you can run the command listed for your product:

  - openSUSE Leap 15.0:

  zypper in -t patch openSUSE-2019-20=1");

  script_tag(name:"affected", value:"gpg2 on openSUSE Leap 15.0.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "openSUSELeap15.0")
{

  if ((res = isrpmvuln(pkg:"gpg2", rpm:"gpg2~2.2.5~lp150.3.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"gpg2-debuginfo", rpm:"gpg2-debuginfo~2.2.5~lp150.3.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"gpg2-debugsource", rpm:"gpg2-debugsource~2.2.5~lp150.3.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"gpg2-lang", rpm:"gpg2-lang~2.2.5~lp150.3.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
