###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2014_0856_1.nasl 9587 2018-04-24 12:50:26Z cfischer $
#
# SuSE Update for kernel openSUSE-SU-2014:0856-1 (kernel)
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

include("revisions-lib.inc");

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.850593");
  script_version("$Revision: 9587 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-24 14:50:26 +0200 (Tue, 24 Apr 2018) $");
  script_tag(name:"creation_date", value:"2014-07-01 20:48:43 +0530 (Tue, 01 Jul 2014)");
  script_cve_id("CVE-2013-7339", "CVE-2014-0055", "CVE-2014-0077", "CVE-2014-2678",
                "CVE-2014-2851", "CVE-2014-3122", "CVE-2014-3153");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_name("SuSE Update for kernel openSUSE-SU-2014:0856-1 (kernel)");

  tag_insight = "
  The Linux kernel was updated to fix security issues and bugs:

  Security issues fixed: CVE-2014-3153: The futex_requeue function in
  kernel/futex.c in the Linux kernel did not ensure that calls have two
  different futex addresses, which allowed local users to gain privileges
  via a crafted FUTEX_REQUEUE command that facilitates unsafe waiter
  modification.

  CVE-2014-0077: drivers/vhost/net.c in the Linux kernel, when mergeable
  buffers are disabled, did not properly validate packet lengths, which
  allowed guest OS users to cause a denial of service (memory corruption and
  host OS crash) or possibly gain privileges on the host OS via crafted
  packets, related to the handle_rx and get_rx_bufs functions.

  CVE-2014-0055: The get_rx_bufs function in drivers/vhost/net.c in the
  vhost-net subsystem in the Linux kernel package did not properly handle
  vhost_get_vq_desc errors, which allowed guest OS users to cause a denial
  of service (host OS crash) via unspecified vectors.

  CVE-2014-2678: The rds_iw_laddr_check function in net/rds/iw.c in the
  Linux kernel allowed local users to cause a denial of service (NULL
  pointer dereference and system crash) or possibly have unspecified other
  impact via a bind system call for an RDS socket on a system that lacks RDS
  transports.

  CVE-2013-7339: The rds_ib_laddr_check function in net/rds/ib.c in the
  Linux kernel allowed local users to cause a denial of service (NULL
  pointer dereference and system crash) or possibly have unspecified other
  impact via a bind system call for an RDS socket on a system that lacks RDS
  transports.

  CVE-2014-2851: Integer overflow in the ping_init_sock function in
  net/ipv4/ping.c in the Linux kernel allowed local users to cause a denial
  of service (use-after-free and system crash) or possibly gain privileges
  via a crafted application that leverages an improperly managed reference
  counter.

  CVE-2014-3122: The try_to_unmap_cluster function in mm/rmap.c in the Linux
  kernel did not properly consider which pages must be locked, which allowed
  local users to cause a denial of service (system crash) by triggering a
  memory-usage pattern that requires removal of page-table mappings.

  Bugs fixed:
  - memcg: deprecate memory.force_empty knob (bnc#878274).";

  tag_affected = "kernel on openSUSE 12.3";

  tag_solution = "Please Install the Updated Packages.";

  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "openSUSE-SU", value: "2014:0856_1");
  script_tag(name:"summary", value:"Check for the Version of kernel");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "openSUSE12.3")
{

  if ((res = isrpmvuln(pkg:"kernel-default", rpm:"kernel-default~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-default-base", rpm:"kernel-default-base~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-default-base-debuginfo", rpm:"kernel-default-base-debuginfo~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-default-debuginfo", rpm:"kernel-default-debuginfo~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-default-debugsource", rpm:"kernel-default-debugsource~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-default-devel", rpm:"kernel-default-devel~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-default-devel-debuginfo", rpm:"kernel-default-devel-debuginfo~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-syms", rpm:"kernel-syms~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug", rpm:"kernel-debug~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug-base", rpm:"kernel-debug-base~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug-base-debuginfo", rpm:"kernel-debug-base-debuginfo~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug-debuginfo", rpm:"kernel-debug-debuginfo~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug-debugsource", rpm:"kernel-debug-debugsource~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug-devel", rpm:"kernel-debug-devel~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug-devel-debuginfo", rpm:"kernel-debug-devel-debuginfo~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-desktop", rpm:"kernel-desktop~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-desktop-base", rpm:"kernel-desktop-base~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-desktop-base-debuginfo", rpm:"kernel-desktop-base-debuginfo~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-desktop-debuginfo", rpm:"kernel-desktop-debuginfo~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-desktop-debugsource", rpm:"kernel-desktop-debugsource~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-desktop-devel", rpm:"kernel-desktop-devel~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-desktop-devel-debuginfo", rpm:"kernel-desktop-devel-debuginfo~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-ec2", rpm:"kernel-ec2~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-ec2-base", rpm:"kernel-ec2-base~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-ec2-base-debuginfo", rpm:"kernel-ec2-base-debuginfo~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-ec2-debuginfo", rpm:"kernel-ec2-debuginfo~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-ec2-debugsource", rpm:"kernel-ec2-debugsource~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-ec2-devel", rpm:"kernel-ec2-devel~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-ec2-devel-debuginfo", rpm:"kernel-ec2-devel-debuginfo~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-trace", rpm:"kernel-trace~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-trace-base", rpm:"kernel-trace-base~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-trace-base-debuginfo", rpm:"kernel-trace-base-debuginfo~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-trace-debuginfo", rpm:"kernel-trace-debuginfo~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-trace-debugsource", rpm:"kernel-trace-debugsource~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-trace-devel", rpm:"kernel-trace-devel~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-trace-devel-debuginfo", rpm:"kernel-trace-devel-debuginfo~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-vanilla", rpm:"kernel-vanilla~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-vanilla-debuginfo", rpm:"kernel-vanilla-debuginfo~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-vanilla-debugsource", rpm:"kernel-vanilla-debugsource~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-vanilla-devel", rpm:"kernel-vanilla-devel~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-vanilla-devel-debuginfo", rpm:"kernel-vanilla-devel-debuginfo~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen", rpm:"kernel-xen~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen-base", rpm:"kernel-xen-base~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen-base-debuginfo", rpm:"kernel-xen-base-debuginfo~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen-debuginfo", rpm:"kernel-xen-debuginfo~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen-debugsource", rpm:"kernel-xen-debugsource~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen-devel", rpm:"kernel-xen-devel~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen-devel-debuginfo", rpm:"kernel-xen-devel-debuginfo~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-devel", rpm:"kernel-devel~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-docs", rpm:"kernel-docs~3.7.10~1.36.2", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-source", rpm:"kernel-source~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-source-vanilla", rpm:"kernel-source-vanilla~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-pae", rpm:"kernel-pae~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-pae-base", rpm:"kernel-pae-base~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-pae-base-debuginfo", rpm:"kernel-pae-base-debuginfo~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-pae-debuginfo", rpm:"kernel-pae-debuginfo~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-pae-debugsource", rpm:"kernel-pae-debugsource~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-pae-devel", rpm:"kernel-pae-devel~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-pae-devel-debuginfo", rpm:"kernel-pae-devel-debuginfo~3.7.10~1.36.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
