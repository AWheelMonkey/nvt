###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2016_1690_1.nasl 12284 2018-11-09 12:37:21Z cfischer $
#
# SuSE Update for the SUSE-SU-2016:1690-1 (kernel)
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
  script_oid("1.3.6.1.4.1.25623.1.0.851358");
  script_version("$Revision: 12284 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-09 13:37:21 +0100 (Fri, 09 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-06-28 05:27:13 +0200 (Tue, 28 Jun 2016)");
  script_cve_id("CVE-2014-9717", "CVE-2015-8816", "CVE-2015-8845", "CVE-2016-0758",
                "CVE-2016-2053", "CVE-2016-2143", "CVE-2016-2184", "CVE-2016-2185",
                "CVE-2016-2186", "CVE-2016-2188", "CVE-2016-2782", "CVE-2016-2847",
                "CVE-2016-3134", "CVE-2016-3136", "CVE-2016-3137", "CVE-2016-3138",
                "CVE-2016-3139", "CVE-2016-3140", "CVE-2016-3156", "CVE-2016-3672",
                "CVE-2016-3689", "CVE-2016-3951", "CVE-2016-4482", "CVE-2016-4486",
                "CVE-2016-4565", "CVE-2016-4569", "CVE-2016-4578", "CVE-2016-4805",
                "CVE-2016-5244");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for the SUSE-SU-2016:1690-1 (kernel)");
  script_tag(name:"summary", value:"Check the version of the kernel");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"The SUSE Linux Enterprise 12 kernel was updated to 3.12.60 to receive
  various security and bugfixes.

  The following security bugs were fixed:

  - CVE-2014-9717: fs/namespace.c in the Linux kernel processes MNT_DETACH
  umount2 system called without verifying that the MNT_LOCKED flag is
  unset, which allowed local users to bypass intended access restrictions
  and navigate to filesystem locations beneath a mount by calling umount2
  within a user namespace (bnc#928547).

  - CVE-2015-8816: The hub_activate function in drivers/usb/core/hub.c in
  the Linux kernel did not properly maintain a hub-interface data
  structure, which allowed physically proximate attackers to cause a
  denial of service (invalid memory access and system crash) or possibly
  have unspecified other impact by unplugging a USB hub device
  (bnc#968010).

  - CVE-2015-8845: The tm_reclaim_thread function in
  arch/powerpc/kernel/process.c in the Linux kernel on powerpc platforms
  did not ensure that TM suspend mode exists before proceeding with a
  tm_reclaim call, which allowed local users to cause a denial of service
  (TM Bad Thing exception and panic) via a crafted application
  (bnc#975533).

  - CVE-2016-0758: Fix ASN.1 indefinite length object parsing (bsc#979867).

  - CVE-2016-2053: The asn1_ber_decoder function in lib/asn1_decoder.c in
  the Linux kernel allowed attackers to cause a denial of service (panic)
  via an ASN.1 BER file that lacks a public key, leading to mishandling by
  the public_key_verify_signature function in
  crypto/asymmetric_keys/public_key.c (bnc#963762).

  - CVE-2016-2143: The fork implementation in the Linux kernel on s390
  platforms mishandled the case of four page-table levels, which allowed
  local users to cause a denial of service (system crash) or possibly have
  unspecified other impact via a crafted application, related to
  arch/s390/include/asm/mmu_context.h and arch/s390/include/asm/pgalloc.h.
  (bnc#970504)

  - CVE-2016-2184: The create_fixed_stream_quirk function in
  sound/usb/quirks.c in the snd-usb-audio driver in the Linux kernel
  allowed physically proximate attackers to cause a denial of service
  (NULL pointer dereference or double free, and system crash) via a
  crafted endpoints value in a USB device descriptor (bnc#971125).

  - CVE-2016-2185: The ati_remote2_probe function in
  drivers/input/misc/ati_remote2.c in the Linux kernel allowed physically
  proximate attackers to cause a denial of service (NULL pointer
  dereference and system crash) via a crafted endpoints value in a USB
  device descriptor (bnc#9711 ...

  Description truncated, for more information please check the Reference URL");
  script_tag(name:"affected", value:"kernel on SUSE Linux Enterprise Server 12, SUSE Linux Enterprise Desktop 12");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"SUSE-SU", value:"2016:1690_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=(SLED12\.0SP0|SLES12\.0SP0)");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);
res = "";

if(release == "SLED12.0SP0")
{

  if ((res = isrpmvuln(pkg:"kernel-default", rpm:"kernel-default~3.12.60~52.49.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-default-debuginfo", rpm:"kernel-default-debuginfo~3.12.60~52.49.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-default-debugsource", rpm:"kernel-default-debugsource~3.12.60~52.49.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-default-devel", rpm:"kernel-default-devel~3.12.60~52.49.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-default-extra", rpm:"kernel-default-extra~3.12.60~52.49.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-default-extra-debuginfo", rpm:"kernel-default-extra-debuginfo~3.12.60~52.49.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-syms", rpm:"kernel-syms~3.12.60~52.49.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen", rpm:"kernel-xen~3.12.60~52.49.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen-debuginfo", rpm:"kernel-xen-debuginfo~3.12.60~52.49.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen-debugsource", rpm:"kernel-xen-debugsource~3.12.60~52.49.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen-devel", rpm:"kernel-xen-devel~3.12.60~52.49.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-devel", rpm:"kernel-devel~3.12.60~52.49.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-macros", rpm:"kernel-macros~3.12.60~52.49.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-source", rpm:"kernel-source~3.12.60~52.49.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "SLES12.0SP0")
{

  if ((res = isrpmvuln(pkg:"kernel-default", rpm:"kernel-default~3.12.60~52.49.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-default-base", rpm:"kernel-default-base~3.12.60~52.49.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-default-base-debuginfo", rpm:"kernel-default-base-debuginfo~3.12.60~52.49.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-default-debuginfo", rpm:"kernel-default-debuginfo~3.12.60~52.49.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-default-debugsource", rpm:"kernel-default-debugsource~3.12.60~52.49.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-default-devel", rpm:"kernel-default-devel~3.12.60~52.49.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-syms", rpm:"kernel-syms~3.12.60~52.49.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-devel", rpm:"kernel-devel~3.12.60~52.49.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-macros", rpm:"kernel-macros~3.12.60~52.49.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-source", rpm:"kernel-source~3.12.60~52.49.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen", rpm:"kernel-xen~3.12.60~52.49.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen-base", rpm:"kernel-xen-base~3.12.60~52.49.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen-base-debuginfo", rpm:"kernel-xen-base-debuginfo~3.12.60~52.49.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen-debuginfo", rpm:"kernel-xen-debuginfo~3.12.60~52.49.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen-debugsource", rpm:"kernel-xen-debugsource~3.12.60~52.49.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen-devel", rpm:"kernel-xen-devel~3.12.60~52.49.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-default-man", rpm:"kernel-default-man~3.12.60~52.49.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
