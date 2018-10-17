###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for kernel CESA-2011:0004 centos5 i386
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

include("revisions-lib.inc");
tag_insight = "The kernel packages contain the Linux kernel, the core of any Linux
  operating system.

  This update fixes the following security issues:
  
  * A flaw was found in sctp_packet_config() in the Linux kernel's Stream
  Control Transmission Protocol (SCTP) implementation. A remote attacker
  could use this flaw to cause a denial of service. (CVE-2010-3432,
  Important)
  
  * A missing integer overflow check was found in snd_ctl_new() in the Linux
  kernel's sound subsystem. A local, unprivileged user on a 32-bit system
  could use this flaw to cause a denial of service or escalate their
  privileges. (CVE-2010-3442, Important)
  
  * A heap overflow flaw in the Linux kernel's Transparent Inter-Process
  Communication protocol (TIPC) implementation could allow a local,
  unprivileged user to escalate their privileges. (CVE-2010-3859, Important)
  
  * An integer overflow flaw was found in the Linux kernel's Reliable
  Datagram Sockets (RDS) protocol implementation. A local, unprivileged user
  could use this flaw to cause a denial of service or escalate their
  privileges. (CVE-2010-3865, Important)
  
  * A flaw was found in the Xenbus code for the unified block-device I/O
  interface back end. A privileged guest user could use this flaw to cause a
  denial of service on the host system running the Xen hypervisor.
  (CVE-2010-3699, Moderate)
  
  * Missing sanity checks were found in setup_arg_pages() in the Linux
  kernel. When making the size of the argument and environment area on the
  stack very large, it could trigger a BUG_ON(), resulting in a local denial
  of service. (CVE-2010-3858, Moderate)
  
  * A flaw was found in inet_csk_diag_dump() in the Linux kernel's module for
  monitoring the sockets of INET transport protocols. By sending a netlink
  message with certain bytecode, a local, unprivileged user could cause a
  denial of service. (CVE-2010-3880, Moderate)
  
  * Missing sanity checks were found in gdth_ioctl_alloc() in the gdth driver
  in the Linux kernel. A local user with access to &quot;/dev/gdth&quot; on a 64-bit
  system could use this flaw to cause a denial of service or escalate their
  privileges. (CVE-2010-4157, Moderate)
  
  * The fix for Red Hat Bugzilla bug 484590 as provided in RHSA-2009:1243
  introduced a regression. A local, unprivileged user could use this flaw to
  cause a denial of service. (CVE-2010-4161, Moderate)
  
  * A NULL pointer dereference flaw was found in the Bluetooth HCI UART
  driver in the Linux kernel. A local, unprivileged user could use this flaw
  to cause a denial of service. (CVE-2010-4242, Moderate)
  
  * It was found that a malic ... 

  Description truncated, for more information please check the Reference URL";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "kernel on CentOS 5";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2011-January/017221.html");
  script_oid("1.3.6.1.4.1.25623.1.0.880516");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-08-09 08:20:34 +0200 (Tue, 09 Aug 2011)");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_xref(name: "CESA", value: "2011:0004");
  script_cve_id("CVE-2010-3432", "CVE-2010-3442", "CVE-2010-3699", "CVE-2010-3858", "CVE-2010-3859", "CVE-2010-3865", "CVE-2010-3876", "CVE-2010-3880", "CVE-2010-4083", "CVE-2010-4157", "CVE-2010-4161", "CVE-2010-4242", "CVE-2010-4247", "CVE-2010-4248");
  script_name("CentOS Update for kernel CESA-2011:0004 centos5 i386");

  script_tag(name:"summary", value:"Check for the Version of kernel");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");


res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~2.6.18~194.32.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug", rpm:"kernel-debug~2.6.18~194.32.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug-devel", rpm:"kernel-debug-devel~2.6.18~194.32.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-devel", rpm:"kernel-devel~2.6.18~194.32.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-doc", rpm:"kernel-doc~2.6.18~194.32.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-headers", rpm:"kernel-headers~2.6.18~194.32.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-PAE", rpm:"kernel-PAE~2.6.18~194.32.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-PAE-devel", rpm:"kernel-PAE-devel~2.6.18~194.32.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen", rpm:"kernel-xen~2.6.18~194.32.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen-devel", rpm:"kernel-xen-devel~2.6.18~194.32.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
