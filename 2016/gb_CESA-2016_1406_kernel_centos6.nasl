###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for kernel CESA-2016:1406 centos6 
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
  script_oid("1.3.6.1.4.1.25623.1.0.882518");
  script_version("$Revision: 6658 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:51:48 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-07-13 05:34:03 +0200 (Wed, 13 Jul 2016)");
  script_cve_id("CVE-2016-4565");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for kernel CESA-2016:1406 centos6 ");
  script_tag(name: "summary", value: "Check the version of kernel");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The kernel packages contain the Linux kernel, 
the core of any Linux operating system.

Security Fix:

* A flaw was found in the way certain interfaces of the Linux kernel's
Infiniband subsystem used write() as bi-directional ioctl() replacement,
which could lead to insufficient memory security checks when being invoked
using the the splice() system call. A local unprivileged user on a system
with either Infiniband hardware present or RDMA Userspace Connection
Manager Access module explicitly loaded, could use this flaw to escalate
their privileges on the system. (CVE-2016-4565, Important)

Red Hat would like to thank Jann Horn for reporting this issue.

This update also fixes the following bugs:

* When providing some services and using the Integrated Services Digital
Network (ISDN), the system could terminate unexpectedly due to the call of
the tty_ldisc_flush() function. The provided patch removes this call and
the system no longer hangs in the described scenario. (BZ#1337443)

* An update to the Red Hat Enterprise Linux 6.8 kernel added calls of two
functions provided by the ipv6.ko kernel module, which added a dependency
on that module. On systems where ipv6.ko was prevented from being loaded,
the nfsd.ko and lockd.ko modules were unable to be loaded. Consequently, it
was not possible to run an NFS server or to mount NFS file systems as a
client. The underlying source code has been fixed by adding the
symbol_get() function, which determines if nfsd.ko and lock.ko are loaded
into memory and calls them through function pointers, not directly. As a
result, the aforementioned kernel modules are allowed to be loaded even if
ipv6.ko is not, and the NFS mount works as expected. (BZ#1341496)

* After upgrading the kernel, CPU load average increased compared to the
prior kernel version due to the modification of the scheduler. The provided
patch set reverts the calculation algorithm of this load average to the the
previous version thus resulting in relatively lower values under the same
system load. (BZ#1343015)
");
  script_tag(name: "affected", value: "kernel on CentOS 6");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2016:1406");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2016-July/021977.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
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

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~2.6.32~642.3.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-abi-whitelists", rpm:"kernel-abi-whitelists~2.6.32~642.3.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug", rpm:"kernel-debug~2.6.32~642.3.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug-devel", rpm:"kernel-debug-devel~2.6.32~642.3.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-devel", rpm:"kernel-devel~2.6.32~642.3.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-doc", rpm:"kernel-doc~2.6.32~642.3.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-firmware", rpm:"kernel-firmware~2.6.32~642.3.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-headers", rpm:"kernel-headers~2.6.32~642.3.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"perf", rpm:"perf~2.6.32~642.3.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"python-perf", rpm:"python-perf~2.6.32~642.3.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
