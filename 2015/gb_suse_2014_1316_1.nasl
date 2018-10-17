###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2014_1316_1.nasl 8046 2017-12-08 08:48:56Z santu $
#
# SuSE Update for Linux SUSE-SU-2014:1316-1 (Linux)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.850836");
  script_version("$Revision: 8046 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-08 09:48:56 +0100 (Fri, 08 Dec 2017) $");
  script_tag(name:"creation_date", value:"2015-10-13 18:35:01 +0530 (Tue, 13 Oct 2015)");
  script_cve_id("CVE-2013-1979", "CVE-2014-1739", "CVE-2014-2706", "CVE-2014-4027", "CVE-2014-4171", "CVE-2014-4508", "CVE-2014-4667", "CVE-2014-4943", "CVE-2014-5077", "CVE-2014-5471", "CVE-2014-5472", "CVE-2014-3153", "CVE-2014-6410");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for Linux SUSE-SU-2014:1316-1 (Linux)");
  script_tag(name: "summary", value: "Check the version of Linux");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  The SUSE Linux Enterprise 11 Service Pack 3 kernel has been updated to fix
  various bugs and security issues.

  The following security bugs have been fixed:

  *

  CVE-2014-1739: The media_device_enum_entities function in
  drivers/media/media-device.c in the Linux kernel before 3.14.6 does not
  initialize a certain data structure, which allows local users to
  obtain sensitive information from kernel memory by leveraging
  /dev/media0 read access for a MEDIA_IOC_ENUM_ENTITIES ioctl call
  (bnc#882804).

  *

  CVE-2014-4171: mm/shmem.c in the Linux kernel through 3.15.1 does
  not properly implement the interaction between range notification and hole
  punching, which allows local users to cause a denial of service (i_mutex
  hold) by using the mmap system call to access a hole, as demonstrated by
  interfering with intended shmem activity by blocking completion of (1) an
  MADV_REMOVE madvise call or (2) an FALLOC_FL_PUNCH_HOLE fallocate call
  (bnc#883518).

  *

  CVE-2014-4508: arch/x86/kernel/entry_32.S in the Linux kernel
  through 3.15.1 on 32-bit x86 platforms, when syscall auditing is enabled
  and the sep CPU feature flag is set, allows local users to cause a denial
  of service (OOPS and system crash) via an invalid syscall number, as
  demonstrated by number 1000 (bnc#883724).

  *

  CVE-2014-4667: The sctp_association_free function in
  net/sctp/associola.c in the Linux kernel before 3.15.2 does not properly
  manage a certain backlog value, which allows remote attackers to cause a
  denial of service (socket outage) via a crafted SCTP packet (bnc#885422).

  *

  CVE-2014-4943: The PPPoL2TP feature in net/l2tp/l2tp_ppp.c in the
  Linux kernel through 3.15.6 allows local users to gain privileges by
  leveraging data-structure differences between an l2tp socket and an inet
  socket (bnc#887082).

  *

  CVE-2014-5077: The sctp_assoc_update function in
  net/sctp/associola.c in the Linux kernel through 3.15.8, when SCTP
  authentication is enabled, allows remote attackers to cause a denial of
  service (NULL pointer dereference and OOPS) by starting to establish an
  association between two endpoints immediately after an exchange of INIT
  and INIT ACK chunks to establish an earlier association between these
  endpoints in the opposite direction (bnc#889173).

  *

  CVE-2014-5471: Stack consumption vulnerability in the
  parse_rock_ridge_inode_internal function in fs/isofs/rock.c in the Linux
  kernel through 3.16.1 allows local users to cause a denial of service
  (uncontrolled recursion, and system crash or reboot) via a crafted iso9660
  image with ... 

  Description truncated, for more information please check the Reference URL");
  script_tag(name: "affected", value: "Linux on SUSE Linux Enterprise Server 11 SP3");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "SUSE-SU", value: "2014:1316_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "SLES11.0SP3")
{

  if ((res = isrpmvuln(pkg:"iscsitarget-kmp-bigsmp", rpm:"iscsitarget-kmp-bigsmp~1.4.20_3.0.101_0.40~0.38.83", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-bigsmp", rpm:"kernel-bigsmp~3.0.101~0.40.1", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-bigsmp-base", rpm:"kernel-bigsmp-base~3.0.101~0.40.1", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-bigsmp-devel", rpm:"kernel-bigsmp-devel~3.0.101~0.40.1", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ofed-kmp-bigsmp", rpm:"ofed-kmp-bigsmp~1.5.4.1_3.0.101_0.40~0.13.89", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"oracleasm-kmp-bigsmp", rpm:"oracleasm-kmp-bigsmp~2.0.5_3.0.101_0.40~7.39.89", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}