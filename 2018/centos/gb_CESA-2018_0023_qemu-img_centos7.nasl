###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_CESA-2018_0023_qemu-img_centos7.nasl 8493 2018-01-23 06:43:13Z ckuersteiner $
#
# CentOS Update for qemu-img CESA-2018:0023 centos7 
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
  script_oid("1.3.6.1.4.1.25623.1.0.882824");
  script_version("$Revision: 8493 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-23 07:43:13 +0100 (Tue, 23 Jan 2018) $");
  script_tag(name:"creation_date", value:"2018-01-05 23:55:16 +0100 (Fri, 05 Jan 2018)");
  script_cve_id("CVE-2017-5715");
  script_tag(name:"cvss_base", value:"4.7");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for qemu-img CESA-2018:0023 centos7 ");
  script_tag(name: "summary", value: "Check the version of qemu-img");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Kernel-based Virtual Machine (KVM) is a 
full virtualization solution for Linux on a variety of architectures. 
The qemu-kvm package provides the user-space component for running virtual 
machines that use KVM.
Security Fix(es):

* An industry-wide issue was found in the way many modern microprocessor
designs have implemented speculative execution of instructions (a commonly
used performance optimization). There are three primary variants of the
issue which differ in the way the speculative execution can be exploited.
Variant CVE-2017-5715 triggers the speculative execution by utilizing
branch target injection. It relies on the presence of a precisely-defined
instruction sequence in the privileged code as well as the fact that memory
accesses may cause allocation into the microprocessor's data cache even for
speculatively executed instructions that never actually commit (retire). As
a result, an unprivileged attacker could use this flaw to cross the syscall
and guest/host boundaries and read privileged memory by conducting targeted
cache side-channel attacks. (CVE-2017-5715)

Note: This is the qemu-kvm side of the CVE-2017-5715 mitigation.

Red Hat would like to thank Google Project Zero for reporting this issue.
");
  script_tag(name: "affected", value: "qemu-img on CentOS 7");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2018:0023");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2018-January/022705.html");
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

  if ((res = isrpmvuln(pkg:"qemu-img", rpm:"qemu-img~1.5.3~141.el7_4.6", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-kvm", rpm:"qemu-kvm~1.5.3~141.el7_4.6", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-kvm-common", rpm:"qemu-kvm-common~1.5.3~141.el7_4.6", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-kvm-tools", rpm:"qemu-kvm-tools~1.5.3~141.el7_4.6", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
