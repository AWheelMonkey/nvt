###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for kernel RHSA-2014:1023-01
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
  script_oid("1.3.6.1.4.1.25623.1.0.871222");
  script_version("$Revision: 12370 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 08:56:29 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2014-08-07 05:58:40 +0200 (Thu, 07 Aug 2014)");
  script_cve_id("CVE-2014-0181", "CVE-2014-2672", "CVE-2014-2673", "CVE-2014-2706",
                "CVE-2014-3534", "CVE-2014-4667");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_name("RedHat Update for kernel RHSA-2014:1023-01");

  tag_insight = "The kernel packages contain the Linux kernel, the core of any Linux
operating system.

* It was found that Linux kernel's ptrace subsystem did not properly
sanitize the address-space-control bits when the program-status word (PSW)
was being set. On IBM S/390 systems, a local, unprivileged user could use
this flaw to set address-space-control bits to the kernel space, and thus
gain read and write access to kernel memory. (CVE-2014-3534, Important)

* It was found that the permission checks performed by the Linux kernel
when a netlink message was received were not sufficient. A local,
unprivileged user could potentially bypass these restrictions by passing a
netlink socket as stdout or stderr to a more privileged process and
altering the output of this process. (CVE-2014-0181, Moderate)

* It was found that a remote attacker could use a race condition flaw in
the ath_tx_aggr_sleep() function to crash the system by creating large
network traffic on the system's Atheros 9k wireless network adapter.
(CVE-2014-2672, Moderate)

* A flaw was found in the way the Linux kernel performed forking inside of
a transaction. A local, unprivileged user on a PowerPC system that supports
transactional memory could use this flaw to crash the system.
(CVE-2014-2673, Moderate)

* A race condition flaw was found in the way the Linux kernel's mac80211
subsystem implementation handled synchronization between TX and STA wake-up
code paths. A remote attacker could use this flaw to crash the system.
(CVE-2014-2706, Moderate)

* An integer underflow flaw was found in the way the Linux kernel's Stream
Control Transmission Protocol (SCTP) implementation processed certain
COOKIE_ECHO packets. By sending a specially crafted SCTP packet, a remote
attacker could use this flaw to prevent legitimate connections to a
particular SCTP server socket to be made. (CVE-2014-4667, Moderate)

Red Hat would like to thank Martin Schwidefsky of IBM for reporting
CVE-2014-3534, Andy Lutomirski for reporting CVE-2014-0181, and Gopal Reddy
Kodudula of Nokia Siemens Networks for reporting CVE-2014-4667.

This update also fixes the following bugs:

* Due to a NULL pointer dereference bug in the IPIP and SIT tunneling code,
a kernel panic could be triggered when using IPIP or SIT tunnels with
IPsec. This update restructures the related code to avoid a NULL pointer
dereference and the kernel no longer panics when using IPIP or SIT tunnels
with IPsec. (BZ#1114957)

* Previously, an IBM POWER8 system could terminate unexpectedly when the
kernel received an IRQ while handling a transactional memory re-checkpoint
critical sect ...

  Description truncated, for more information please check the Reference URL";

  tag_affected = "kernel on Red Hat Enterprise Linux Server (v. 7)";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "RHSA", value: "2014:1023-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2014-August/msg00011.html");
  script_tag(name:"summary", value:"Check for the Version of kernel");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_7");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_7")
{

  if ((res = isrpmvuln(pkg:"kernel-abi-whitelists", rpm:"kernel-abi-whitelists~3.10.0~123.6.3.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~3.10.0~123.6.3.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug", rpm:"kernel-debug~3.10.0~123.6.3.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug-debuginfo", rpm:"kernel-debug-debuginfo~3.10.0~123.6.3.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug-devel", rpm:"kernel-debug-devel~3.10.0~123.6.3.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debuginfo", rpm:"kernel-debuginfo~3.10.0~123.6.3.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debuginfo-common-x86_64", rpm:"kernel-debuginfo-common-x86_64~3.10.0~123.6.3.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-devel", rpm:"kernel-devel~3.10.0~123.6.3.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-headers", rpm:"kernel-headers~3.10.0~123.6.3.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-tools", rpm:"kernel-tools~3.10.0~123.6.3.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-tools-debuginfo", rpm:"kernel-tools-debuginfo~3.10.0~123.6.3.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-tools-libs", rpm:"kernel-tools-libs~3.10.0~123.6.3.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"perf", rpm:"perf~3.10.0~123.6.3.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"perf-debuginfo", rpm:"perf-debuginfo~3.10.0~123.6.3.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"python-perf-debuginfo", rpm:"python-perf-debuginfo~3.10.0~123.6.3.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
