###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2018_2122_1.nasl 12164 2018-10-30 09:02:07Z asteins $
#
# SuSE Update for libgcrypt openSUSE-SU-2018:2122-1 (libgcrypt)
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
  script_oid("1.3.6.1.4.1.25623.1.0.851953");
  script_version("$Revision: 12164 $");
  script_cve_id("CVE-2018-0495");
  script_tag(name:"cvss_base", value:"1.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-30 10:02:07 +0100 (Tue, 30 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-10-26 06:22:26 +0200 (Fri, 26 Oct 2018)");
  script_name("SuSE Update for libgcrypt openSUSE-SU-2018:2122-1 (libgcrypt)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");

  script_xref(name:"openSUSE-SU", value:"2018:2122_1");
  script_xref(name:"URL" , value:"http://lists.opensuse.org/opensuse-security-announce/2018-07/msg00039.html");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'libgcrypt'
  package(s) announced via the openSUSE-SU-2018:2122_1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"
  This update for libgcrypt fixes the following issue:

  The following security issue was fixed:

  - CVE-2018-0495: Fixed a novel side-channel attack, by enabling blinding
  for ECDSA signatures (bsc#1097410)

  This update was imported from the SUSE:SLE-15:Update update project.


  Patch Instructions:

  To install this openSUSE Security Update use the SUSE recommended
  installation methods
  like YaST online_update or 'zypper patch'.

  Alternatively you can run the command listed for your product:

  - openSUSE Leap 15.0:

  zypper in -t patch openSUSE-2018-769=1");

  script_tag(name:"affected", value:"libgcrypt on openSUSE Leap 15.0.");

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

  if ((res = isrpmvuln(pkg:"libgcrypt-cavs", rpm:"libgcrypt-cavs~1.8.2~lp150.5.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgcrypt-cavs-debuginfo", rpm:"libgcrypt-cavs-debuginfo~1.8.2~lp150.5.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgcrypt-debugsource", rpm:"libgcrypt-debugsource~1.8.2~lp150.5.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgcrypt-devel", rpm:"libgcrypt-devel~1.8.2~lp150.5.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgcrypt-devel-debuginfo", rpm:"libgcrypt-devel-debuginfo~1.8.2~lp150.5.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgcrypt20", rpm:"libgcrypt20~1.8.2~lp150.5.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgcrypt20-debuginfo", rpm:"libgcrypt20-debuginfo~1.8.2~lp150.5.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgcrypt20-hmac", rpm:"libgcrypt20-hmac~1.8.2~lp150.5.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgcrypt-devel-32bit", rpm:"libgcrypt-devel-32bit~1.8.2~lp150.5.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgcrypt-devel-32bit-debuginfo", rpm:"libgcrypt-devel-32bit-debuginfo~1.8.2~lp150.5.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgcrypt20-32bit", rpm:"libgcrypt20-32bit~1.8.2~lp150.5.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgcrypt20-32bit-debuginfo", rpm:"libgcrypt20-32bit-debuginfo~1.8.2~lp150.5.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgcrypt20-hmac-32bit", rpm:"libgcrypt20-hmac-32bit~1.8.2~lp150.5.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
