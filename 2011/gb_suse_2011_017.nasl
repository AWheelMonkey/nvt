###############################################################################
# OpenVAS Vulnerability Test
#
# SuSE Update for kernel SUSE-SA:2011:017
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.850163");
  script_version("$Revision: 12291 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-09 15:55:44 +0100 (Fri, 09 Nov 2018) $");
  script_tag(name:"creation_date", value:"2011-04-22 16:44:44 +0200 (Fri, 22 Apr 2011)");
  script_tag(name:"cvss_base", value:"8.3");
  script_tag(name:"cvss_base_vector", value:"AV:A/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name:"SUSE-SA", value:"2011-017");
  script_cve_id("CVE-2010-1173", "CVE-2010-3699", "CVE-2010-3705", "CVE-2010-3848", "CVE-2010-3849", "CVE-2010-3850", "CVE-2010-3858", "CVE-2010-3875", "CVE-2010-3876", "CVE-2010-3877", "CVE-2010-3880", "CVE-2010-4072", "CVE-2010-4073", "CVE-2010-4075", "CVE-2010-4076", "CVE-2010-4077", "CVE-2010-4083", "CVE-2010-4163", "CVE-2010-4243", "CVE-2010-4248", "CVE-2010-4342", "CVE-2010-4346", "CVE-2010-4527", "CVE-2010-4529", "CVE-2010-4648", "CVE-2010-4649", "CVE-2010-4650", "CVE-2010-4668", "CVE-2011-0521", "CVE-2011-0711", "CVE-2011-0712", "CVE-2011-1010", "CVE-2011-1012", "CVE-2011-1082", "CVE-2011-1090", "CVE-2011-1163", "CVE-2011-1182", "CVE-2011-1476", "CVE-2011-1477", "CVE-2011-1493");
  script_name("SuSE Update for kernel SUSE-SA:2011:017");

  script_tag(name:"summary", value:"Check for the Version of kernel");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSE11\.2");
  script_tag(name:"impact", value:"local privilege escalation, remote denial of service");
  script_tag(name:"affected", value:"kernel on openSUSE 11.2");
  script_tag(name:"insight", value:"The openSUSE 11.2 kernel was updated to fix lots of security issues.

  This will probably be the last 11.2 kernel update released by the
  SUSE Security Team, as our support for 11.2 ends in 1 month.

  Following security issues were fixed:
  CVE-2011-1493: In the rose networking stack, when parsing the
  FAC_NATIONAL_DIGIS facilities field, it was possible for a remote
  host to provide more digipeaters than expected, resulting in heap
  corruption.  Check against ROSE_MAX_DIGIS to prevent overflows,
  and abort facilities parsing on failure.

  CVE-2011-1182: Local attackers could send signals to their programs
  that looked like coming from the kernel, potentially gaining privileges
  in the context of setuid programs.

  CVE-2011-1082: The epoll subsystem in Linux did not prevent users
  from creating circular epoll file structures, potentially leading to
  a denial of service (kernel deadlock).

  CVE-2011-1163: The code for evaluating OSF partitions (in
  fs/partitions/osf.c) contained a bug that leaks data from kernel heap
  memory to userspace for certain corrupted OSF partitions.

  CVE-2011-1012: The code for evaluating LDM partitions (in
  fs/partitions/ldm.c) contained a bug that could crash the kernel for
  certain corrupted LDM partitions.

  CVE-2011-1010: The code for evaluating Mac partitions (in
  fs/partitions/mac.c) contained a bug that could crash the kernel for
  certain corrupted Mac partitions.

  CVE-2011-1476: Specially crafted requests may be written to
  /dev/sequencer resulting in an underflow when calculating a size for a
  copy_from_user() operation in the driver for MIDI interfaces. On x86,
  this just returns an error, but it could have caused memory corruption
  on other architectures. Other malformed requests could have resulted
  in the use of uninitialized variables.

  CVE-2011-1477: Due to a failure to validate user-supplied indexes in
  the driver for Yamaha YM3812 and OPL-3 chips, a specially crafted
  ioctl request could have been sent to /dev/sequencer, resulting in
  reading and writing beyond the bounds of heap buffers, and potentially
  allowing privilege escalation.

  CVE-2011-1090: A page allocator issue in NFS v4 ACL handling that
  could lead to a denial of service (crash) was fixed.

  CVE-2010-3880: net/ipv4/inet_diag.c in the Linux kernel did not
  properly audit INET_DIAG bytecode, which allowed local users
  to cause a denial of service (kernel infinite loop) via crafted
  INET_DIAG_REQ_BYTECODE instructions in a netlink message that contains
  multiple attribute elements, as demonst ...

  Description truncated, for more information please check the Reference URL");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);
res = "";

if(release == "openSUSE11.2")
{

  if ((res = isrpmvuln(pkg:"kernel-debug", rpm:"kernel-debug~2.6.31.14~0.8.1", rls:"openSUSE11.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug-base", rpm:"kernel-debug-base~2.6.31.14~0.8.1", rls:"openSUSE11.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug-devel", rpm:"kernel-debug-devel~2.6.31.14~0.8.1", rls:"openSUSE11.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-default", rpm:"kernel-default~2.6.31.14~0.8.1", rls:"openSUSE11.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-default-base", rpm:"kernel-default-base~2.6.31.14~0.8.1", rls:"openSUSE11.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-default-devel", rpm:"kernel-default-devel~2.6.31.14~0.8.1", rls:"openSUSE11.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-desktop", rpm:"kernel-desktop~2.6.31.14~0.8.1", rls:"openSUSE11.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-desktop-base", rpm:"kernel-desktop-base~2.6.31.14~0.8.1", rls:"openSUSE11.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-desktop-devel", rpm:"kernel-desktop-devel~2.6.31.14~0.8.1", rls:"openSUSE11.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-pae", rpm:"kernel-pae~2.6.31.14~0.8.1", rls:"openSUSE11.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-pae-base", rpm:"kernel-pae-base~2.6.31.14~0.8.1", rls:"openSUSE11.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-pae-devel", rpm:"kernel-pae-devel~2.6.31.14~0.8.1", rls:"openSUSE11.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-syms", rpm:"kernel-syms~2.6.31.14~0.8.1", rls:"openSUSE11.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-trace", rpm:"kernel-trace~2.6.31.14~0.8.1", rls:"openSUSE11.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-trace-base", rpm:"kernel-trace-base~2.6.31.14~0.8.1", rls:"openSUSE11.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-trace-devel", rpm:"kernel-trace-devel~2.6.31.14~0.8.1", rls:"openSUSE11.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-vanilla", rpm:"kernel-vanilla~2.6.31.14~0.8.1", rls:"openSUSE11.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-vanilla-base", rpm:"kernel-vanilla-base~2.6.31.14~0.8.1", rls:"openSUSE11.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-vanilla-devel", rpm:"kernel-vanilla-devel~2.6.31.14~0.8.1", rls:"openSUSE11.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen", rpm:"kernel-xen~2.6.31.14~0.8.1", rls:"openSUSE11.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen-base", rpm:"kernel-xen-base~2.6.31.14~0.8.1", rls:"openSUSE11.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen-devel", rpm:"kernel-xen-devel~2.6.31.14~0.8.1", rls:"openSUSE11.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"preload-kmp-default", rpm:"preload-kmp-default~1.1_2.6.31.14_0.8~6.9.49", rls:"openSUSE11.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"preload-kmp-desktop", rpm:"preload-kmp-desktop~1.1_2.6.31.14_0.8~6.9.49", rls:"openSUSE11.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
