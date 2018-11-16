###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2018_3315_1.nasl 12283 2018-11-09 11:21:17Z cfischer $
#
# SuSE Update for clamav openSUSE-SU-2018:3315-1 (clamav)
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
  script_oid("1.3.6.1.4.1.25623.1.0.852069");
  script_version("$Revision: 12283 $");
  script_cve_id("CVE-2018-14680", "CVE-2018-14681", "CVE-2018-14682", "CVE-2018-15378");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-11-09 12:21:17 +0100 (Fri, 09 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-10-26 06:41:11 +0200 (Fri, 26 Oct 2018)");
  script_name("SuSE Update for clamav openSUSE-SU-2018:3315-1 (clamav)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSELeap15\.0");

  script_xref(name:"openSUSE-SU", value:"2018:3315_1");
  script_xref(name:"URL" , value:"http://lists.opensuse.org/opensuse-security-announce/2018-10/msg00047.html");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'clamav'
  package(s) announced via the openSUSE-SU-2018:3315_1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"This update for clamav fixes the following issues:

  clamav was updated to version 0.100.2.

  Following security issues were fixed:

  - CVE-2018-15378: Vulnerability in ClamAV's MEW unpacking feature that
  could allow an unauthenticated, remote attacker to cause a denial of
  service (DoS) condition on an affected device. (bsc#1110723)

  - CVE-2018-14680, CVE-2018-14681, CVE-2018-14682: more fixes for embedded
  libmspack. (bsc#1103040)

  Following non-security issues were addressed:

  - Make freshclam more robust against lagging signature mirrors.

  - On-Access 'Extra Scanning', an opt-in minor feature of OnAccess scanning
  on Linux systems, has been disabled due to a known issue with resource
  cleanup OnAccessExtraScanning will be re-enabled in a future release
  when the issue is resolved. In the mean-time, users who enabled the
  feature in clamd.conf will see a warning informing them that the feature
  is not active.

  - Restore exit code compatibility of freshclam with versions before
  0.100.0 when the virus database is already up to date (bsc#1104457)

  This update was imported from the SUSE:SLE-15:Update update project.


  Patch Instructions:

  To install this openSUSE Security Update use the SUSE recommended
  installation methods
  like YaST online_update or 'zypper patch'.

  Alternatively you can run the command listed for your product:

  - openSUSE Leap 15.0:

  zypper in -t patch openSUSE-2018-1227=1");

  script_tag(name:"affected", value:"clamav on openSUSE Leap 15.0.");

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

  if ((res = isrpmvuln(pkg:"clamav", rpm:"clamav~0.100.2~lp150.2.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"clamav-debuginfo", rpm:"clamav-debuginfo~0.100.2~lp150.2.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"clamav-debugsource", rpm:"clamav-debugsource~0.100.2~lp150.2.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"clamav-devel", rpm:"clamav-devel~0.100.2~lp150.2.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libclamav7", rpm:"libclamav7~0.100.2~lp150.2.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libclamav7-debuginfo", rpm:"libclamav7-debuginfo~0.100.2~lp150.2.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libclammspack0", rpm:"libclammspack0~0.100.2~lp150.2.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libclammspack0-debuginfo", rpm:"libclammspack0-debuginfo~0.100.2~lp150.2.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
