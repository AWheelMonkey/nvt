###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for kernel RHSA-2017:0386-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.871768");
  script_version("$Revision: 12380 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:03:48 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2017-03-03 05:49:38 +0100 (Fri, 03 Mar 2017)");
  script_cve_id("CVE-2016-8630", "CVE-2016-8655", "CVE-2016-9083", "CVE-2016-9084");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("RedHat Update for kernel RHSA-2017:0386-01");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'kernel'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"The kernel packages contain the Linux
kernel, the core of any Linux operating system.

Security Fix(es):

  * Linux kernel built with the Kernel-based Virtual Machine (CONFIG_KVM)
support is vulnerable to a null pointer dereference flaw. It could occur on
x86 platform, when emulating an undefined instruction. An attacker could
use this flaw to crash the host kernel resulting in DoS. (CVE-2016-8630,
Important)

  * A race condition issue leading to a use-after-free flaw was found in the
way the raw packet sockets implementation in the Linux kernel networking
subsystem handled synchronization while creating the TPACKET_V3 ring
buffer. A local user able to open a raw packet socket (requires the
CAP_NET_RAW capability) could use this flaw to elevate their privileges on
the system. (CVE-2016-8655, Important)

  * A flaw was discovered in the Linux kernel's implementation of VFIO. An
attacker issuing an ioctl can create a situation where memory is corrupted
and modify memory outside of the expected area. This may overwrite kernel
memory and subvert kernel execution. (CVE-2016-9083, Important)

  * The use of a kzalloc with an integer multiplication allowed an integer
overflow condition to be reached in vfio_pci_intrs.c. This combined with
CVE-2016-9083 may allow an attacker to craft an attack and use unallocated
memory, potentially crashing the machine. (CVE-2016-9084, Moderate)

Red Hat would like to thank Philip Pettersson for reporting CVE-2016-8655.

Additional Changes:

Space precludes documenting all of the bug fixes and enhancements included
in this advisory. To see the complete list of bug fixes and enhancements,
refer to the linked KnowledgeBase article.");

  script_xref(name:"URL", value:"https://access.redhat.com/articles/2940041");

  script_tag(name:"affected", value:"kernel on
  Red Hat Enterprise Linux Server (v. 7)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"RHSA", value:"2017:0386-01");
  script_xref(name:"URL", value:"https://www.redhat.com/archives/rhsa-announce/2017-March/msg00008.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
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

  if ((res = isrpmvuln(pkg:"kernel-abi-whitelists", rpm:"kernel-abi-whitelists~3.10.0~514.10.2.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-doc", rpm:"kernel-doc~3.10.0~514.10.2.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~3.10.0~514.10.2.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug", rpm:"kernel-debug~3.10.0~514.10.2.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug-debuginfo", rpm:"kernel-debug-debuginfo~3.10.0~514.10.2.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug-devel", rpm:"kernel-debug-devel~3.10.0~514.10.2.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debuginfo", rpm:"kernel-debuginfo~3.10.0~514.10.2.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debuginfo-common-x86_64", rpm:"kernel-debuginfo-common-x86_64~3.10.0~514.10.2.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-devel", rpm:"kernel-devel~3.10.0~514.10.2.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-headers", rpm:"kernel-headers~3.10.0~514.10.2.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-tools", rpm:"kernel-tools~3.10.0~514.10.2.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-tools-debuginfo", rpm:"kernel-tools-debuginfo~3.10.0~514.10.2.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-tools-libs", rpm:"kernel-tools-libs~3.10.0~514.10.2.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"perf", rpm:"perf~3.10.0~514.10.2.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"perf-debuginfo", rpm:"perf-debuginfo~3.10.0~514.10.2.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"python-perf", rpm:"python-perf~3.10.0~514.10.2.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"python-perf-debuginfo", rpm:"python-perf-debuginfo~3.10.0~514.10.2.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
