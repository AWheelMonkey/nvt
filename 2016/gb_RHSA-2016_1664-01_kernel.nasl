###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for kernel RHSA-2016:1664-01
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
  script_oid("1.3.6.1.4.1.25623.1.0.871655");
  script_version("$Revision: 12370 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 08:56:29 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-08-24 05:40:30 +0200 (Wed, 24 Aug 2016)");
  script_cve_id("CVE-2016-5696");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("RedHat Update for kernel RHSA-2016:1664-01");
  script_tag(name: "summary", value: "Check the version of kernel");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The kernel packages contain the Linux
  kernel, the core of any Linux operating system.

Security Fix(es):

It was found that the RFC 5961 challenge ACK rate limiting as implemented
in the Linux kernel's networking subsystem allowed an off-path attacker to
leak certain information about a given connection by creating congestion on
the global challenge ACK rate limit counter and then measuring the changes
by probing packets. An off-path attacker could use this flaw to either
terminate TCP connection and/or inject payload into non-secured TCP
connection between two endpoints on the network. (CVE-2016-5696, Important)

Red Hat would like to thank Yue Cao (Cyber Security Group of the CS
department of University of California in Riverside) for reporting this
issue.

Bug Fix(es):

* When loading the Direct Rendering Manager (DRM) kernel module, the kernel
panicked if DRM was previously unloaded. The kernel panic was caused by a
memory leak of the ID Resolver (IDR2). With this update, IDR2 is loaded
during kernel boot, and the kernel panic no longer occurs in the described
scenario. (BZ#1353827)

* When more than one process attempted to use the 'configfs' directory
entry at the same time, a kernel panic in some cases occurred. With this
update, a race condition between a directory entry and a lookup operation
has been fixed. As a result, the kernel no longer panics in the described
scenario. (BZ#1353828)

* When shutting down the system by running the halt -p command, a kernel
panic occurred due to a conflict between the kernel offlining CPUs and the
sched command, which used the sched group and the sched domain data without
first checking the data. The underlying source code has been fixed by
adding a check to avoid the conflict. As a result, the described scenario
no longer results in a kernel panic. (BZ#1343894)

* In some cases, running the ipmitool command caused a kernel panic due to
a race condition in the ipmi message handler. This update fixes the race
condition, and the kernel panic no longer occurs in the described scenario.
(BZ#1355980)

* Previously, multiple Very Secure FTP daemon (vsftpd) processes on a
directory with a large number of files led to a high contention rate on
each inode's spinlock, which caused excessive CPU usage. With this update,
a spinlock to protect a single memory-to-memory copy has been removed from
the ext4_getattr() function. As a result, system CPU usage has been reduced
and is no longer excessive in the described situation. (BZ#1355981)

* When th ... 

  Description truncated, for more information please check the Reference URL");
  script_tag(name: "affected", value: "kernel on Red Hat Enterprise Linux
  Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "RHSA", value: "2016:1664-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2016-August/msg00059.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_6");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~2.6.32~642.4.2.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug", rpm:"kernel-debug~2.6.32~642.4.2.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug-debuginfo", rpm:"kernel-debug-debuginfo~2.6.32~642.4.2.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug-devel", rpm:"kernel-debug-devel~2.6.32~642.4.2.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debuginfo", rpm:"kernel-debuginfo~2.6.32~642.4.2.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debuginfo-common-i686", rpm:"kernel-debuginfo-common-i686~2.6.32~642.4.2.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-devel", rpm:"kernel-devel~2.6.32~642.4.2.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-headers", rpm:"kernel-headers~2.6.32~642.4.2.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"perf", rpm:"perf~2.6.32~642.4.2.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"perf-debuginfo", rpm:"perf-debuginfo~2.6.32~642.4.2.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"python-perf-debuginfo", rpm:"python-perf-debuginfo~2.6.32~642.4.2.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-abi-whitelists", rpm:"kernel-abi-whitelists~2.6.32~642.4.2.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-doc", rpm:"kernel-doc~2.6.32~642.4.2.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-firmware", rpm:"kernel-firmware~2.6.32~642.4.2.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debuginfo-common-x86_64", rpm:"kernel-debuginfo-common-x86_64~2.6.32~642.4.2.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
