###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for kernel RHSA-2014:1724-01
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
  script_oid("1.3.6.1.4.1.25623.1.0.871280");
  script_version("$Revision: 12370 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 08:56:29 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2014-10-29 05:53:10 +0100 (Wed, 29 Oct 2014)");
  script_cve_id("CVE-2014-3611", "CVE-2014-3645", "CVE-2014-3646", "CVE-2014-4653", "CVE-2014-5077");
  script_tag(name:"cvss_base", value:"6.6");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:N/A:C");
  script_name("RedHat Update for kernel RHSA-2014:1724-01");
  script_tag(name: "summary", value: "Check the version of kernel");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The kernel packages contain the Linux kernel, the core of any Linux
operating system.

Security fixes:

* A race condition flaw was found in the way the Linux kernel's KVM
subsystem handled PIT (Programmable Interval Timer) emulation. A guest user
who has access to the PIT I/O ports could use this flaw to crash the host.
(CVE-2014-3611, Important)

* A NULL pointer dereference flaw was found in the way the Linux kernel's
Stream Control Transmission Protocol (SCTP) implementation handled
simultaneous connections between the same hosts. A remote attacker could
use this flaw to crash the system. (CVE-2014-5077, Important)

* It was found that the Linux kernel's KVM subsystem did not handle the VM
exits gracefully for the invept (Invalidate Translations Derived from EPT)
and invvpid (Invalidate Translations Based on VPID) instructions. On hosts
with an Intel processor and invept/invppid VM exit support, an unprivileged
guest user could use these instructions to crash the guest. (CVE-2014-3645,
CVE-2014-3646, Moderate)

* A use-after-free flaw was found in the way the Linux kernel's Advanced
Linux Sound Architecture (ALSA) implementation handled user controls. A
local, privileged user could use this flaw to crash the system.
(CVE-2014-4653, Moderate)

Red Hat would like to thank Lars Bull of Google for reporting
CVE-2014-3611, and the Advanced Threat Research team at Intel Security for
reporting CVE-2014-3645 and CVE-2014-3646.

Bug fixes:

* A known issue that could prevent Chelsio adapters using the cxgb4 driver
from being initialized on IBM POWER8 systems has been fixed. These
adapters can now be used on IBM POWER8 systems as expected. (BZ#1130548)

* When bringing a hot-added CPU online, the kernel did not initialize a
CPU mask properly, which could result in a kernel panic. This update
corrects the bug by ensuring that the CPU mask is properly initialized and
the correct NUMA node selected. (BZ#1134715)

* The kernel could fail to bring a CPU online if the hardware supported
both, the acpi-cpufreq and intel_pstate modules. This update ensures that
the acpi-cpufreq module is not loaded in the intel_pstate module is
loaded. (BZ#1134716)

* Due to a bug in the time accounting of the kernel scheduler, a divide
error could occur when hot adding a CPU. To fix this problem, the kernel
scheduler time accounting has been reworked. (BZ#1134717)

* The kernel did not handle exceptions caused by an invalid floating point
control (FPC) register, resulting in a kernel oops. This problem has been
fixed by placing the label to handle these exceptions to the correct place
in the code. ... 

  Description truncated, for more information please check the Reference URL");
  script_tag(name: "affected", value: "kernel on Red Hat Enterprise Linux Server (v. 7)");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "RHSA", value: "2014:1724-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2014-October/msg00050.html");
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

  if ((res = isrpmvuln(pkg:"kernel-abi-whitelists", rpm:"kernel-abi-whitelists~3.10.0~123.9.2.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~3.10.0~123.9.2.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug", rpm:"kernel-debug~3.10.0~123.9.2.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug-debuginfo", rpm:"kernel-debug-debuginfo~3.10.0~123.9.2.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug-devel", rpm:"kernel-debug-devel~3.10.0~123.9.2.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debuginfo", rpm:"kernel-debuginfo~3.10.0~123.9.2.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debuginfo-common-x86_64", rpm:"kernel-debuginfo-common-x86_64~3.10.0~123.9.2.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-devel", rpm:"kernel-devel~3.10.0~123.9.2.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-headers", rpm:"kernel-headers~3.10.0~123.9.2.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-tools", rpm:"kernel-tools~3.10.0~123.9.2.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-tools-debuginfo", rpm:"kernel-tools-debuginfo~3.10.0~123.9.2.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-tools-libs", rpm:"kernel-tools-libs~3.10.0~123.9.2.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"perf", rpm:"perf~3.10.0~123.9.2.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"perf-debuginfo", rpm:"perf-debuginfo~3.10.0~123.9.2.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"python-perf-debuginfo", rpm:"python-perf-debuginfo~3.10.0~123.9.2.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}