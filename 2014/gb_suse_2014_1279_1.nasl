###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2014_1279_1.nasl 12284 2018-11-09 12:37:21Z cfischer $
#
# SuSE Update for xen openSUSE-SU-2014:1279-1 (xen)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.850619");
  script_version("$Revision: 12284 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-09 13:37:21 +0100 (Fri, 09 Nov 2018) $");
  script_tag(name:"creation_date", value:"2014-10-10 06:07:56 +0200 (Fri, 10 Oct 2014)");
  script_cve_id("CVE-2013-4344", "CVE-2013-4540", "CVE-2014-2599", "CVE-2014-3967", "CVE-2014-3968", "CVE-2014-4021", "CVE-2014-7154", "CVE-2014-7155", "CVE-2014-7156", "CVE-2014-7188");
  script_tag(name:"cvss_base", value:"8.3");
  script_tag(name:"cvss_base_vector", value:"AV:A/AC:L/Au:N/C:C/I:C/A:C");
  script_name("SuSE Update for xen openSUSE-SU-2014:1279-1 (xen)");
  script_tag(name:"summary", value:"Check the version of xen");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"XEN was updated to fix various bugs and security issues.

  Security issues fixed:

  - bnc#897657 - CVE-2014-7188: XSA-108 Improper MSR range used for x2APIC
  emulation

  - bnc#895802 - CVE-2014-7156: XSA-106: Missing privilege level checks in
  x86 emulation of software interrupts

  - bnc#895799 - CVE-2014-7155: XSA-105: Missing privilege level checks in
  x86 HLT, LGDT, LIDT, and LMSW emulation

  - bnc#895798 - CVE-2014-7154: XSA-104: Race condition in
  HVMOP_track_dirty_vram

  - bnc#864801 - CVE-2013-4540: qemu: zaurus: buffer overrun on invalid
  state load

  - bnc#880751 - CVE-2014-4021: XSA-100: Hypervisor heap contents leaked to
  guests

  - bnc#878841 - CVE-2014-3967, CVE-2014-3968: XSA-96: Vulnerabilities in HVM
  MSI injection

  - bnc#867910 - CVE-2014-2599: XSA-89: HVMOP_set_mem_access is not
  preemptible

  - bnc#842006 - CVE-2013-4344: XSA-65: xen: qemu SCSI REPORT LUNS buffer
  overflow

  Other bugs fixed:

  - bnc#896023 - Adjust xentop column layout

  - bnc#891539 - xend: fix netif convertToDeviceNumber for running domains

  - bnc#820873 - The 'long' option doesn't work with 'xl list'

  - bnc#881900 - XEN kernel panic do_device_not_available()

  - bnc#833483 - Boot Failure with xen kernel in UEFI mode with error 'No
  memory for trampoline'

  - bnc#862608 - SLES 11 SP3 vm-install should get RHEL 7 support when
  released

  - bnc#858178 - [HP HPS Bug]: SLES11sp3 XEN kiso version cause softlockup
  on 8 blades npar(480 cpu)

  - bnc#865682 - Local attach support for PHY backends using scripts

  - bnc#798770 - Improve multipath support for npiv devices");
  script_tag(name:"affected", value:"xen on openSUSE 12.3");
  script_tag(name:"solution", value:"Please install the updated packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"openSUSE-SU", value:"2014:1279_1");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSE12\.3");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);
res = "";

if(release == "openSUSE12.3")
{

  if ((res = isrpmvuln(pkg:"xen-debugsource", rpm:"xen-debugsource~4.2.4_04~1.32.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-devel", rpm:"xen-devel~4.2.4_04~1.32.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-kmp-default", rpm:"xen-kmp-default~4.2.4_04_k3.7.10_1.40~1.32.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-kmp-default-debuginfo", rpm:"xen-kmp-default-debuginfo~4.2.4_04_k3.7.10_1.40~1.32.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-kmp-desktop", rpm:"xen-kmp-desktop~4.2.4_04_k3.7.10_1.40~1.32.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-kmp-desktop-debuginfo", rpm:"xen-kmp-desktop-debuginfo~4.2.4_04_k3.7.10_1.40~1.32.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-libs", rpm:"xen-libs~4.2.4_04~1.32.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-libs-debuginfo", rpm:"xen-libs-debuginfo~4.2.4_04~1.32.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-tools-domU", rpm:"xen-tools-domU~4.2.4_04~1.32.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-tools-domU-debuginfo", rpm:"xen-tools-domU-debuginfo~4.2.4_04~1.32.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen", rpm:"xen~4.2.4_04~1.32.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-doc-html", rpm:"xen-doc-html~4.2.4_04~1.32.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-doc-pdf", rpm:"xen-doc-pdf~4.2.4_04~1.32.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-libs-32bit", rpm:"xen-libs-32bit~4.2.4_04~1.32.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-libs-debuginfo-32bit", rpm:"xen-libs-debuginfo-32bit~4.2.4_04~1.32.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-tools", rpm:"xen-tools~4.2.4_04~1.32.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-tools-debuginfo", rpm:"xen-tools-debuginfo~4.2.4_04~1.32.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-kmp-pae", rpm:"xen-kmp-pae~4.2.4_04_k3.7.10_1.40~1.32.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-kmp-pae-debuginfo", rpm:"xen-kmp-pae-debuginfo~4.2.4_04_k3.7.10_1.40~1.32.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}