###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2018_2214_1.nasl 12283 2018-11-09 11:21:17Z cfischer $
#
# SuSE Update for libsndfile openSUSE-SU-2018:2214-1 (libsndfile)
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
  script_oid("1.3.6.1.4.1.25623.1.0.851833");
  script_version("$Revision: 12283 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-09 12:21:17 +0100 (Fri, 09 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-08-07 05:49:22 +0200 (Tue, 07 Aug 2018)");
  script_cve_id("CVE-2017-17456", "CVE-2017-17457", "CVE-2018-13139", "CVE-2017-14246");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for libsndfile openSUSE-SU-2018:2214-1 (libsndfile)");
  script_tag(name:"summary", value:"Check the version of libsndfile");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"This update for libsndfile fixes the following issues:

  Security issues fixed:

  - CVE-2018-13139: Fix a stack-based buffer overflow in psf_memset in
  common.c that allows remote attackers to cause a denial of service
  (bsc#1100167).

  - CVE-2017-17456: Prevent segmentation fault in the function
  d2alaw_array() that may have lead to a remote DoS (bsc#1071777)

  - CVE-2017-17457: Prevent segmentation fault in the function
  d2ulaw_array() that may have lead to a remote DoS, a different
  vulnerability than CVE-2017-14246 (bsc#1071767)

  This update was imported from the SUSE:SLE-12:Update update project.


  Patch Instructions:

  To install this openSUSE Security Update use the SUSE recommended
  installation methods
  like YaST online_update or 'zypper patch'.

  Alternatively you can run the command listed for your product:

  - openSUSE Leap 42.3:

  zypper in -t patch openSUSE-2018-804=1");
  script_tag(name:"affected", value:"libsndfile on openSUSE Leap 42.3");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"openSUSE-SU", value:"2018:2214_1");
  script_xref(name:"URL" , value:"http://lists.opensuse.org/opensuse-security-announce/2018-08/msg00015.html");
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

  if ((res = isrpmvuln(pkg:"libsndfile-debugsource", rpm:"libsndfile-debugsource~1.0.25~34.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libsndfile-devel", rpm:"libsndfile-devel~1.0.25~34.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libsndfile-progs", rpm:"libsndfile-progs~1.0.25~34.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libsndfile-progs-debuginfo", rpm:"libsndfile-progs-debuginfo~1.0.25~34.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libsndfile-progs-debugsource", rpm:"libsndfile-progs-debugsource~1.0.25~34.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libsndfile1", rpm:"libsndfile1~1.0.25~34.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libsndfile1-debuginfo", rpm:"libsndfile1-debuginfo~1.0.25~34.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libsndfile1-32bit", rpm:"libsndfile1-32bit~1.0.25~34.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libsndfile1-debuginfo-32bit", rpm:"libsndfile1-debuginfo-32bit~1.0.25~34.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}