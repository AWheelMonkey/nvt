###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for kernel CESA-2014:1143 centos5
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
  script_oid("1.3.6.1.4.1.25623.1.0.881997");
  script_version("$Revision: 9373 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:57:18 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2014-09-05 05:56:51 +0200 (Fri, 05 Sep 2014)");
  script_cve_id("CVE-2014-3917");
  script_tag(name:"cvss_base", value:"3.3");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:P/I:N/A:P");
  script_name("CentOS Update for kernel CESA-2014:1143 centos5 ");
  script_tag(name: "insight", value: "The kernel packages contain the Linux
kernel, the core of any Linux operating system.

* An out-of-bounds memory access flaw was found in the Linux kernel's
system call auditing implementation. On a system with existing audit rules
defined, a local, unprivileged user could use this flaw to leak kernel
memory to user space or, potentially, crash the system. (CVE-2014-3917,
Moderate)

This update also fixes the following bugs:

* A bug in the journaling code (jbd and jbd2) could, under very heavy
workload of fsync() operations, trigger a BUG_ON and result in a kernel
oops. Also, fdatasync() could fail to immediately write out changes in the
file size only. These problems have been resolved by backporting a series
of patches that fixed these problems in the respective code on Red Hat
Enterprise Linux 6. This update also improves performance of ext3 and ext4
file systems. (BZ#1116027)

* Due to a bug in the ext4 code, the fdatasync() system call did not force
the inode size change to be written to the disk if it was the only metadata
change in the file. This could result in the wrong inode size and possible
data loss if the system terminated unexpectedly. The code handling inode
updates has been fixed and fdatasync() now writes data to the disk as
expected in this situation. (BZ#1117665)

* A workaround to a DMA read problem in the tg3 driver was incorrectly
applied to the whole Broadcom 5719 and 5720 chipset family. This workaround
is valid only to the A0 revision of the 5719 chips and for other revisions
and chips causes occasional Tx timeouts. This update correctly applies the
aforementioned workaround only to the A0 revision of the 5719 chips.
(BZ#1121017)

* Due to a bug in the page writeback code, the system could become
unresponsive when being under memory pressure and heavy NFS load. This
update fixes the code responsible for handling of dirty pages, and dirty
page write outs no longer flood the work queue. (BZ#1125246)

All kernel users are advised to upgrade to these updated packages, which
contain backported patches to correct these issues. The system must be
rebooted for this update to take effect.
");
  script_tag(name: "affected", value: "kernel on CentOS 5");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name: "CESA", value: "2014:1143");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2014-September/020539.html");
  script_tag(name:"summary", value:"Check for the Version of kernel");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
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

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~2.6.18~371.12.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug", rpm:"kernel-debug~2.6.18~371.12.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug-devel", rpm:"kernel-debug-devel~2.6.18~371.12.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-devel", rpm:"kernel-devel~2.6.18~371.12.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-doc", rpm:"kernel-doc~2.6.18~371.12.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-headers", rpm:"kernel-headers~2.6.18~371.12.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-PAE", rpm:"kernel-PAE~2.6.18~371.12.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-PAE-devel", rpm:"kernel-PAE-devel~2.6.18~371.12.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen", rpm:"kernel-xen~2.6.18~371.12.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen-devel", rpm:"kernel-xen-devel~2.6.18~371.12.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
