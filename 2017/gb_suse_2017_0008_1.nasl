###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2017_0008_1.nasl 12284 2018-11-09 12:37:21Z cfischer $
#
# SuSE Update for xen openSUSE-SU-2017:0008-1 (xen)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.851463");
  script_version("$Revision: 12284 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-09 13:37:21 +0100 (Fri, 09 Nov 2018) $");
  script_tag(name:"creation_date", value:"2017-01-04 09:00:24 +0100 (Wed, 04 Jan 2017)");
  script_cve_id("CVE-2016-10013", "CVE-2016-10024", "CVE-2016-7777", "CVE-2016-7908",
                "CVE-2016-7909", "CVE-2016-8576", "CVE-2016-8667", "CVE-2016-8669",
                "CVE-2016-8909", "CVE-2016-8910", "CVE-2016-9379", "CVE-2016-9380",
                "CVE-2016-9381", "CVE-2016-9382", "CVE-2016-9383", "CVE-2016-9385",
                "CVE-2016-9386", "CVE-2016-9637", "CVE-2016-9932");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for xen openSUSE-SU-2017:0008-1 (xen)");
  script_tag(name:"summary", value:"Check the version of xen");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"This updates xen to version 4.4.4_06 to fix the following issues:

  - An unprivileged user in a guest could gain guest could escalate
  privilege to that of the guest kernel, if it had could invoke the
  instruction emulator. Only 64-bit x86 HVM guest were affected. Linux
  guest have not been vulnerable. (boo#1016340, CVE-2016-10013)

  - An unprivileged user in a 64 bit x86 guest could gain information from
  the host, crash the host or gain privilege of the host (boo#1009107,
  CVE-2016-9383)

  - An unprivileged guest process could (unintentionally or maliciously)
  obtain
  or ocorrupt sensitive information of other programs in the same guest.
  Only x86 HVM guests have been affected. The attacker needs to be able
  to trigger the Xen instruction emulator. (boo#1000106, CVE-2016-7777)

  - A guest on x86 systems could read small parts of hypervisor stack data
  (boo#1012651, CVE-2016-9932)

  - A malicious guest kernel could hang or crash the host system
  (boo#1014298, CVE-2016-10024)

  - A malicious guest administrator could escalate their privilege to that
  of the host. Only affects x86 HVM guests using qemu older version 1.6.0
  or using the qemu-xen-traditional. (boo#1011652, CVE-2016-9637)

  - An unprivileged guest user could escalate privilege to that of the guest
  administrator on x86 HVM guests, especially on Intel CPUs (boo#1009100,
  CVE-2016-9386)

  - An unprivileged guest user could escalate privilege to that of the guest
  administrator (on AMD CPUs) or crash the system (on Intel CPUs) on
  32-bit x86 HVM guests. Only guest operating systems that allowed a new
  task to start in VM86 mode were affected. (boo#1009103, CVE-2016-9382)

  - A malicious guest administrator could crash the host on x86 PV guests
  only (boo#1009104, CVE-2016-9385)

  - A malicious guest administrator could get privilege of the host emulator
  process on x86 HVM guests. (boo#1009109, CVE-2016-9381)

  - A vulnerability in pygrub allowed a malicious guest administrator to
  obtain the contents of sensitive host files, or even delete those files
  (boo#1009111, CVE-2016-9379, CVE-2016-9380)

  - A privileged guest user could cause an infinite loop in the RTL8139
  ethernet emulation to consume CPU cycles on the host, causing a DoS
  situation (boo#1007157, CVE-2016-8910)

  - A privileged guest user could cause an infinite loop in the intel-hda
  sound emulation to consume CPU cycles on the host, causing a DoS
  situation (boo#1007160, CVE-2016-8909)

  - A privileged guest user could cause a crash of the emulator process on
  the host by exploiting a divide by zero vulnerability of the JAZZ RC4030
  chipse ...

  Description truncated, for more information please check the Reference URL");
  script_tag(name:"affected", value:"xen on openSUSE 13.2");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"openSUSE-SU", value:"2017:0008_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSE13\.2");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);
res = "";

if(release == "openSUSE13.2")
{

  if ((res = isrpmvuln(pkg:"xen-debugsource", rpm:"xen-debugsource~4.4.4_06~58.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-devel", rpm:"xen-devel~4.4.4_06~58.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-libs", rpm:"xen-libs~4.4.4_06~58.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-libs-debuginfo", rpm:"xen-libs-debuginfo~4.4.4_06~58.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-tools-domU", rpm:"xen-tools-domU~4.4.4_06~58.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-tools-domU-debuginfo", rpm:"xen-tools-domU-debuginfo~4.4.4_06~58.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen", rpm:"xen~4.4.4_06~58.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-doc-html", rpm:"xen-doc-html~4.4.4_06~58.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-kmp-default", rpm:"xen-kmp-default~4.4.4_06_k3.16.7_53~58.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-kmp-default-debuginfo", rpm:"xen-kmp-default-debuginfo~4.4.4_06_k3.16.7_53~58.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-kmp-desktop", rpm:"xen-kmp-desktop~4.4.4_06_k3.16.7_53~58.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-kmp-desktop-debuginfo", rpm:"xen-kmp-desktop-debuginfo~4.4.4_06_k3.16.7_53~58.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-libs-32bit", rpm:"xen-libs-32bit~4.4.4_06~58.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-libs-debuginfo-32bit", rpm:"xen-libs-debuginfo-32bit~4.4.4_06~58.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-tools", rpm:"xen-tools~4.4.4_06~58.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-tools-debuginfo", rpm:"xen-tools-debuginfo~4.4.4_06~58.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
