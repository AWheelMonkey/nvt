###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2018_2133_1.nasl 12497 2018-11-23 08:28:21Z cfischer $
#
# SuSE Update for e2fsprogs openSUSE-SU-2018:2133-1 (e2fsprogs)
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
  script_oid("1.3.6.1.4.1.25623.1.0.852025");
  script_version("$Revision: 12497 $");
  script_cve_id("CVE-2015-0247", "CVE-2015-1572");
  script_tag(name:"cvss_base", value:"4.6");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-11-23 09:28:21 +0100 (Fri, 23 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-10-26 06:35:16 +0200 (Fri, 26 Oct 2018)");
  script_name("SuSE Update for e2fsprogs openSUSE-SU-2018:2133-1 (e2fsprogs)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSELeap15\.0");

  script_xref(name:"openSUSE-SU", value:"2018:2133_1");
  script_xref(name:"URL", value:"http://lists.opensuse.org/opensuse-security-announce/2018-07/msg00050.html");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'e2fsprogs'
  package(s) announced via the openSUSE-SU-2018:2133_1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"This update for e2fsprogs fixes the following issues:

  Security issues fixed:

  - CVE-2015-0247: Fixed couple of heap overflows in e2fsprogs (fsck,
  dumpe2fs, e2image...) (bsc#915402).

  - CVE-2015-1572: Fixed potential buffer overflow in closefs() (bsc#918346).

  Bug fixes:

  - bsc#1038194: generic/405 test fails with /dev/mapper/thin-vol is
  inconsistent on ext4 file system.

  - bsc#1009532: resize2fs hangs when trying to resize a large ext4 file
  system.

  - bsc#960273: xfsprogs does not call %{?regenerate_initrd_post}.

  This update was imported from the SUSE:SLE-15:Update update project.


  Patch Instructions:

  To install this openSUSE Security Update use the SUSE recommended
  installation methods
  like YaST online_update or 'zypper patch'.

  Alternatively you can run the command listed for your product:

  - openSUSE Leap 15.0:

  zypper in -t patch openSUSE-2018-771=1");

  script_tag(name:"affected", value:"e2fsprogs on openSUSE Leap 15.0.");

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

  if ((res = isrpmvuln(pkg:"e2fsprogs", rpm:"e2fsprogs~1.43.8~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"e2fsprogs-debuginfo", rpm:"e2fsprogs-debuginfo~1.43.8~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"e2fsprogs-debugsource", rpm:"e2fsprogs-debugsource~1.43.8~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"e2fsprogs-devel", rpm:"e2fsprogs-devel~1.43.8~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libcom_err-devel", rpm:"libcom_err-devel~1.43.8~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libcom_err-devel-static", rpm:"libcom_err-devel-static~1.43.8~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libcom_err2", rpm:"libcom_err2~1.43.8~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libcom_err2-debuginfo", rpm:"libcom_err2-debuginfo~1.43.8~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libext2fs-devel", rpm:"libext2fs-devel~1.43.8~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libext2fs-devel-static", rpm:"libext2fs-devel-static~1.43.8~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libext2fs2", rpm:"libext2fs2~1.43.8~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libext2fs2-debuginfo", rpm:"libext2fs2-debuginfo~1.43.8~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"e2fsprogs-32bit-debuginfo", rpm:"e2fsprogs-32bit-debuginfo~1.43.8~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libcom_err-devel-32bit", rpm:"libcom_err-devel-32bit~1.43.8~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libcom_err2-32bit", rpm:"libcom_err2-32bit~1.43.8~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libcom_err2-32bit-debuginfo", rpm:"libcom_err2-32bit-debuginfo~1.43.8~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libext2fs-devel-32bit", rpm:"libext2fs-devel-32bit~1.43.8~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libext2fs2-32bit", rpm:"libext2fs2-32bit~1.43.8~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libext2fs2-32bit-debuginfo", rpm:"libext2fs2-32bit-debuginfo~1.43.8~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
