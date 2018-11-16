###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2016_1750_1.nasl 12284 2018-11-09 12:37:21Z cfischer $
#
# SuSE Update for qemu openSUSE-SU-2016:1750-1 (qemu)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.851362");
  script_version("$Revision: 12284 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-09 13:37:21 +0100 (Fri, 09 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-07-07 05:25:59 +0200 (Thu, 07 Jul 2016)");
  script_cve_id("CVE-2015-5745", "CVE-2015-7549", "CVE-2015-8504", "CVE-2015-8558",
                "CVE-2015-8567", "CVE-2015-8568", "CVE-2015-8613", "CVE-2015-8619",
                "CVE-2015-8743", "CVE-2015-8744", "CVE-2015-8745", "CVE-2015-8817",
                "CVE-2015-8818", "CVE-2016-1568", "CVE-2016-1714", "CVE-2016-1922",
                "CVE-2016-1981", "CVE-2016-2197", "CVE-2016-2198", "CVE-2016-2538",
                "CVE-2016-2841", "CVE-2016-2857", "CVE-2016-2858", "CVE-2016-3710",
                "CVE-2016-3712", "CVE-2016-4001", "CVE-2016-4002", "CVE-2016-4020",
                "CVE-2016-4037", "CVE-2016-4439", "CVE-2016-4441", "CVE-2016-4952");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for qemu openSUSE-SU-2016:1750-1 (qemu)");
  script_tag(name:"summary", value:"Check the version of qemu");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"qemu was updated to fix 29 security issues.

  These security issues were fixed:

  - CVE-2016-4439: Avoid OOB access in 53C9X emulation (bsc#980711)

  - CVE-2016-4441: Avoid OOB access in 53C9X emulation (bsc#980723)

  - CVE-2016-4952: Avoid OOB access in Vmware PV SCSI emulation (bsc#981266)

  - CVE-2015-8817: Avoid OOB access in PCI dma I/O (bsc#969121)

  - CVE-2015-8818: Avoid OOB access in PCI dma I/O (bsc#969122)

  - CVE-2016-3710: Fixed VGA emulation based OOB access with potential for
  guest escape (bsc#978158)

  - CVE-2016-3712: Fixed VGa emulation based DOS and OOB read access exploit
  (bsc#978160)

  - CVE-2016-4037: Fixed USB ehci based DOS (bsc#976109)

  - CVE-2016-2538: Fixed potential OOB access in USB net device emulation
  (bsc#967969)

  - CVE-2016-2841: Fixed OOB access / hang in ne2000 emulation (bsc#969350)

  - CVE-2016-2858: Avoid potential DOS when using QEMU pseudo random number
  generator (bsc#970036)

  - CVE-2016-2857: Fixed OOB access when processing IP checksums (bsc#970037)

  - CVE-2016-4001: Fixed OOB access in Stellaris enet emulated nic
  (bsc#975128)

  - CVE-2016-4002: Fixed OOB access in MIPSnet emulated controller
  (bsc#975136)

  - CVE-2016-4020: Fixed possible host data leakage to guest from TPR access
  (bsc#975700)

  - CVE-2016-2197: Prevent AHCI NULL pointer dereference when using FIS CLB
  engine (bsc#964411)

  - CVE-2015-5745: Buffer overflow in virtio-serial (bsc#940929).

  - CVE-2015-7549: PCI null pointer dereferences (bsc#958917).

  - CVE-2015-8504: VNC floating point exception (bsc#958491).

  - CVE-2015-8558: Infinite loop in ehci_advance_state resulting in DoS
  (bsc#959005).

  - CVE-2015-8567: A guest repeatedly activating a vmxnet3 device can leak
  host memory (bsc#959386).

  - CVE-2015-8568: A guest repeatedly activating a vmxnet3 device can leak
  host memory (bsc#959386).

  - CVE-2015-8613: Wrong sized memset in megasas command handler
  (bsc#961358).

  - CVE-2015-8619: Potential DoS for long HMP sendkey command argument
  (bsc#960334).

  - CVE-2015-8743: OOB memory access in ne2000 ioport r/w functions
  (bsc#960725).

  - CVE-2015-8744: Incorrect l2 header validation could have lead to a crash
  via assert(2) call (bsc#960835).

  - CVE-2015-8745: Reading IMR registers could have lead to a crash via
  assert(2) call (bsc#960708).

  - CVE-2016-1568: AHCI use-after-free in aio port commands (bsc#961332).

  - CVE-2016-1714: Potential OOB memory access in processing firmware
  configuration (bsc#961691).

  - CVE-2016-1922: NULL pointer dereference when processing hmp i/o command
  (bsc#962320).

  - CVE-2016-1981: Potential DoS (infinite  ...

  Description truncated, for more information please check the Reference URL");
  script_tag(name:"affected", value:"qemu on openSUSE Leap 42.1");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"openSUSE-SU", value:"2016:1750_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSELeap42\.1");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);
res = "";

if(release == "openSUSELeap42.1")
{

  if ((res = isrpmvuln(pkg:"qemu", rpm:"qemu~2.3.1~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-arm", rpm:"qemu-arm~2.3.1~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-arm-debuginfo", rpm:"qemu-arm-debuginfo~2.3.1~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-block-curl", rpm:"qemu-block-curl~2.3.1~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-block-curl-debuginfo", rpm:"qemu-block-curl-debuginfo~2.3.1~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-debugsource", rpm:"qemu-debugsource~2.3.1~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-extra", rpm:"qemu-extra~2.3.1~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-extra-debuginfo", rpm:"qemu-extra-debuginfo~2.3.1~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-guest-agent", rpm:"qemu-guest-agent~2.3.1~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-guest-agent-debuginfo", rpm:"qemu-guest-agent-debuginfo~2.3.1~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-kvm", rpm:"qemu-kvm~2.3.1~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-lang", rpm:"qemu-lang~2.3.1~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-linux-user", rpm:"qemu-linux-user~2.3.1~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-linux-user-debuginfo", rpm:"qemu-linux-user-debuginfo~2.3.1~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-linux-user-debugsource", rpm:"qemu-linux-user-debugsource~2.3.1~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-ppc", rpm:"qemu-ppc~2.3.1~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-ppc-debuginfo", rpm:"qemu-ppc-debuginfo~2.3.1~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-s390", rpm:"qemu-s390~2.3.1~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-s390-debuginfo", rpm:"qemu-s390-debuginfo~2.3.1~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-tools", rpm:"qemu-tools~2.3.1~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-tools-debuginfo", rpm:"qemu-tools-debuginfo~2.3.1~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-x86", rpm:"qemu-x86~2.3.1~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-x86-debuginfo", rpm:"qemu-x86-debuginfo~2.3.1~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-ipxe", rpm:"qemu-ipxe~1.0.0~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-seabios", rpm:"qemu-seabios~1.8.1~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-sgabios-8", rpm:"qemu-sgabios-8~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-vgabios", rpm:"qemu-vgabios~1.8.1~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-block-rbd", rpm:"qemu-block-rbd~2.3.1~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-block-rbd-debuginfo", rpm:"qemu-block-rbd-debuginfo~2.3.1~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-testsuite", rpm:"qemu-testsuite~2.3.1~15.2", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
