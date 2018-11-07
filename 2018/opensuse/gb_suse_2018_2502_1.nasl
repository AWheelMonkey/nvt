###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2018_2502_1.nasl 12164 2018-10-30 09:02:07Z asteins $
#
# SuSE Update for libgit2 openSUSE-SU-2018:2502-1 (libgit2)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.852094");
  script_version("$Revision: 12164 $");
  script_cve_id("CVE-2018-10887", "CVE-2018-10888", "CVE-2018-11235", "CVE-2018-15501");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-30 10:02:07 +0100 (Tue, 30 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-10-26 06:47:24 +0200 (Fri, 26 Oct 2018)");
  script_name("SuSE Update for libgit2 openSUSE-SU-2018:2502-1 (libgit2)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");

  script_xref(name:"openSUSE-SU", value:"2018:2502_1");
  script_xref(name:"URL" , value:"http://lists.opensuse.org/opensuse-security-announce/2018-08/msg00074.html");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'libgit2'
  package(s) announced via the openSUSE-SU-2018:2502_1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"
  This update for libgit2 to version 0.26.5 fixes the following issues:

  The following security vulnerabilities were addressed:

  - CVE-2018-10887: Fixed an integer overflow which in turn leads to an out
  of bound read, allowing to read the base object, which could be
  exploited by an attacker to cause denial of service (DoS) (bsc#1100613).
  - CVE-2018-10888: Fixed an out-of-bound read while reading a binary delta
  file, which could be exploited by an attacker t ocause a denial of
  service (DoS) (bsc#1100612).
  - CVE-2018-11235: Fixed a remote code execution, which could occur with a
  crafted .gitmodules file (bsc#1095219)
  - CVE-2018-15501: Prevent out-of-bounds reads when processing
  smart-protocol 'ng' packets (bsc#1104641)

  This update was imported from the SUSE:SLE-15:Update update project.


  Patch Instructions:

  To install this openSUSE Security Update use the SUSE recommended
  installation methods
  like YaST online_update or 'zypper patch'.

  Alternatively you can run the command listed for your product:

  - openSUSE Leap 15.0:

  zypper in -t patch openSUSE-2018-922=1");

  script_tag(name:"affected", value:"libgit2 on openSUSE Leap 15.0.");

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

  if ((res = isrpmvuln(pkg:"libgit2-26", rpm:"libgit2-26~0.26.6~lp150.2.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgit2-26-debuginfo", rpm:"libgit2-26-debuginfo~0.26.6~lp150.2.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgit2-debugsource", rpm:"libgit2-debugsource~0.26.6~lp150.2.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgit2-devel", rpm:"libgit2-devel~0.26.6~lp150.2.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgit2-26-32bit", rpm:"libgit2-26-32bit~0.26.6~lp150.2.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgit2-26-32bit-debuginfo", rpm:"libgit2-26-32bit-debuginfo~0.26.6~lp150.2.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
