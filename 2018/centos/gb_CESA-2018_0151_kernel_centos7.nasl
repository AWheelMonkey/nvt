###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_CESA-2018_0151_kernel_centos7.nasl 8624 2018-02-01 12:56:46Z cfischer $
#
# CentOS Update for kernel CESA-2018:0151 centos7 
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.882836");
  script_version("$Revision: 8624 $");
  script_tag(name:"last_modification", value:"$Date: 2018-02-01 13:56:46 +0100 (Thu, 01 Feb 2018) $");
  script_tag(name:"creation_date", value:"2018-01-26 07:45:54 +0100 (Fri, 26 Jan 2018)");
  script_cve_id("CVE-2015-8539", "CVE-2017-7472", "CVE-2017-12192", "CVE-2017-12193", 
                "CVE-2017-15649", "CVE-2017-5715", "CVE-2017-5753", "CVE-2017-5754");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for kernel CESA-2018:0151 centos7 ");
  script_tag(name: "summary", value: "Check the version of kernel");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The kernel packages contain the Linux kernel, 
the core of any Linux operating system.

Security Fix(es):

An industry-wide issue was found in the way many modern microprocessor
designs have implemented speculative execution of instructions (a commonly
used performance optimization). There are three primary variants of the
issue which differ in the way the speculative execution can be exploited.

Note: This issue is present in hardware and cannot be fully fixed via
software update. The updated kernel packages provide software mitigation
for this hardware issue at a cost of potential performance penalty. Please
refer to References section for further information about this issue and
the performance impact.

In this update initial mitigations for IBM Power (PowerPC) and IBM zSeries
(S390) architectures are provided.

* Variant CVE-2017-5715 triggers the speculative execution by utilizing
branch target injection. It relies on the presence of a precisely-defined
instruction sequence in the privileged code as well as the fact that memory
accesses may cause allocation into the microprocessor's data cache even for
speculatively executed instructions that never actually commit (retire). As
a result, an unprivileged attacker could use this flaw to cross the syscall
and guest/host boundaries and read privileged memory by conducting targeted
cache side-channel attacks. This fix specifically addresses S390
processors. (CVE-2017-5715, Important)

* Variant CVE-2017-5753 triggers the speculative execution by performing a
bounds-check bypass. It relies on the presence of a precisely-defined
instruction sequence in the privileged code as well as the fact that memory
accesses may cause allocation into the microprocessor's data cache even for
speculatively executed instructions that never actually commit (retire). As
a result, an unprivileged attacker could use this flaw to cross the syscall
boundary and read privileged memory by conducting targeted cache
side-channel attacks. This fix specifically addresses S390 and PowerPC
processors. (CVE-2017-5753, Important)

* Variant CVE-2017-5754 relies on the fact that, on impacted
microprocessors, during speculative execution of instruction permission
faults, exception generation triggered by a faulting access is suppressed
until the retirement of the whole instruction block. In a combination with
the fact that memory accesses may populate the cache even when the block is
being dropped and never committed (executed), an unprivileged local
attacker could use this flaw to read privileged (kernel space) memory by
conducting targeted cache side-channel attacks. Note: CVE-2017- ... 

  Description truncated, for more information please check the Reference URL");
  script_tag(name: "affected", value: "kernel on CentOS 7");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2018:0151");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2018-January/022730.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
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

if(release == "CentOS7")
{

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~3.10.0~693.17.1.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-abi-whitelists", rpm:"kernel-abi-whitelists~3.10.0~693.17.1.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug", rpm:"kernel-debug~3.10.0~693.17.1.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug-devel", rpm:"kernel-debug-devel~3.10.0~693.17.1.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-devel", rpm:"kernel-devel~3.10.0~693.17.1.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-doc", rpm:"kernel-doc~3.10.0~693.17.1.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-headers", rpm:"kernel-headers~3.10.0~693.17.1.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-tools", rpm:"kernel-tools~3.10.0~693.17.1.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-tools-libs", rpm:"kernel-tools-libs~3.10.0~693.17.1.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-tools-libs-devel", rpm:"kernel-tools-libs-devel~3.10.0~693.17.1.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"perf", rpm:"perf~3.10.0~693.17.1.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"python-perf", rpm:"python-perf~3.10.0~693.17.1.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
