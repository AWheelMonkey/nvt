###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2018_2238_1.nasl 12381 2018-11-16 11:16:30Z cfischer $
#
# SuSE Update for ovmf openSUSE-SU-2018:2238-1 (ovmf)
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
  script_oid("1.3.6.1.4.1.25623.1.0.851840");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-08-08 05:51:16 +0200 (Wed, 08 Aug 2018)");
  script_cve_id("CVE-2018-0739");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for ovmf openSUSE-SU-2018:2238-1 (ovmf)");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'ovmf'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"This update for ovmf provide the following fix:

  Security issues fixed:

  - CVE-2018-0739: Update openssl to 1.0.2o to limit ASN.1 constructed types
  recursive definition depth (bsc#1094290, bsc#1094291).

  Bug fixes:

  - Only use SLES-UEFI-CA-Certificate-2048.crt for the SUSE flavor to
  provide the better compatibility. (bsc#1077330)

  This update was imported from the SUSE:SLE-12-SP3:Update update project.


  Patch Instructions:

  To install this openSUSE Security Update use the SUSE recommended
  installation methods
  like YaST online_update or 'zypper patch'.

  Alternatively you can run the command listed for your product:

  - openSUSE Leap 42.3:

  zypper in -t patch openSUSE-2018-823=1");
  script_tag(name:"affected", value:"ovmf on openSUSE Leap 42.3");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"openSUSE-SU", value:"2018:2238_1");
  script_xref(name:"URL" , value:"http://lists.opensuse.org/opensuse-security-announce/2018-08/msg00021.html");
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

  if ((res = isrpmvuln(pkg:"ovmf-2017+git1492060560.b6d11d7c46", rpm:"ovmf-2017+git1492060560.b6d11d7c46~10.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ovmf-tools-2017+git1492060560.b6d11d7c46", rpm:"ovmf-tools-2017+git1492060560.b6d11d7c46~10.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-ovmf-x86_64-debug-2017+git1492060560.b6d11d7c46", rpm:"qemu-ovmf-x86_64-debug-2017+git1492060560.b6d11d7c46~10.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-ovmf-ia32-2017+git1492060560.b6d11d7c46", rpm:"qemu-ovmf-ia32-2017+git1492060560.b6d11d7c46~10.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-ovmf-x86_64-2017+git1492060560.b6d11d7c46", rpm:"qemu-ovmf-x86_64-2017+git1492060560.b6d11d7c46~10.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
