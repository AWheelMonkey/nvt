###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for kernel CESA-2015:1042 centos5 
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
  script_oid("1.3.6.1.4.1.25623.1.0.882189");
  script_version("$Revision: 6657 $");
  script_cve_id("CVE-2015-1805");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:50:44 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-06-09 11:03:54 +0200 (Tue, 09 Jun 2015)");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for kernel CESA-2015:1042 centos5 ");
  script_tag(name: "summary", value: "Check the version of kernel");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The kernel packages contain the Linux
  kernel, the core of any Linux operating system.

* It was found that the Linux kernel's implementation of vectored pipe read
and write functionality did not take into account the I/O vectors that were
already processed when retrying after a failed atomic access operation,
potentially resulting in memory corruption due to an I/O vector array
overrun. A local, unprivileged user could use this flaw to crash the system
or, potentially, escalate their privileges on the system. (CVE-2015-1805,
Important)

The security impact of this issue was discovered by Red Hat.

This update fixes the following bugs:

* Due to a bug in the lpfc_device_reset_handler() function, a scsi command
timeout could lead to a system crash. With this update,
lpfc_device_reset_handler recovers storage without crashing. (BZ#1070964)

* Due to the code decrementing the reclaim_in_progress counter without
having incremented it first, severe spinlock contention occurred in the
shrink_zone() function even though the vm.max_reclaims_in_progress feature
was set to 1. This update provides a patch fixing the underlying source
code, and spinlock contention no longer occurs in this scenario.
(BZ#1164105)

* A TCP socket using SACK that had a retransmission but recovered from it,
failed to reset the retransmission timestamp. As a consequence, on certain
connections, if a packet had to be re-transmitted, the retrans_stamp
variable was only cleared when the next acked packet was received.
This could lead to an early abortion of the TCP connection if this next
packet also got lost. With this update, the socket clears retrans_stamp
when the recovery is completed, thus fixing the bug. (BZ#1205521)

* Previously, the signal delivery paths did not clear the TS_USEDFPU flag,
which could cause problems in the switch_to() function and lead to
floating-point unit (FPU) corruption. With this update, TS_USEDFPU is
cleared as expected, and FPU is no longer under threat of corruption.
(BZ#1193505)

* A race condition in the exit_sem() function previously caused the
semaphore undo list corruption. As a consequence, a kernel crash could
occur. The corruption in the semaphore undo list has been fixed, and the
kernel no longer crashes in this situation. (BZ#1124574)

* Previously, when running the 'virsh blockresize [Device] [Newsize]'
command to resize the disk, the new size was not reflected in a Red Hat
Enterprise Linux 5 Virtual Machine (VM). With this update, the new size is
now reflected online immediately in a Red Hat Enterprise Linux 5 VM so it
is no longer necessary to reboot the VM to see the new disk size.
(BZ#1 ...

  Description truncated, for more information please check the Reference URL");
  script_tag(name: "affected", value: "kernel on CentOS 5");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "CESA", value: "2015:1042");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2015-June/021156.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~2.6.18~406.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug", rpm:"kernel-debug~2.6.18~406.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug-devel", rpm:"kernel-debug-devel~2.6.18~406.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-devel", rpm:"kernel-devel~2.6.18~406.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-doc", rpm:"kernel-doc~2.6.18~406.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-headers", rpm:"kernel-headers~2.6.18~406.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-PAE", rpm:"kernel-PAE~2.6.18~406.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-PAE-devel", rpm:"kernel-PAE-devel~2.6.18~406.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen", rpm:"kernel-xen~2.6.18~406.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen-devel", rpm:"kernel-xen-devel~2.6.18~406.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
