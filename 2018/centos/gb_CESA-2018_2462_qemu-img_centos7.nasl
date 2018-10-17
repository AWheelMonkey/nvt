###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_CESA-2018_2462_qemu-img_centos7.nasl 11099 2018-08-24 03:13:46Z ckuersteiner $
#
# CentOS Update for qemu-img CESA-2018:2462 centos7 
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
  script_oid("1.3.6.1.4.1.25623.1.0.882939");
  script_version("$Revision: 11099 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-24 05:13:46 +0200 (Fri, 24 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-08-21 06:42:12 +0200 (Tue, 21 Aug 2018)");
  script_cve_id("CVE-2018-7550", "CVE-2018-11806");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for qemu-img CESA-2018:2462 centos7 ");
  script_tag(name:"summary", value:"Check the version of qemu-img");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Kernel-based Virtual Machine (KVM) is a full virtualization solution for
Linux on a variety of architectures. The qemu-kvm packages provide the
user-space component for running virtual machines that use KVM.

Security Fix(es):

* QEMU: slirp: heap buffer overflow while reassembling fragmented datagrams
(CVE-2018-11806)

* QEMU: i386: multiboot OOB access while loading kernel image
(CVE-2018-7550)

For more details about the security issue(s), including the impact, a CVSS
score, and other related information, refer to the CVE page(s) listed in
the References section.

Red Hat would like to thank Jskz - Zero Day Initiative (trendmicro.com) for
reporting CVE-2018-11806 and Cyrille Chatras (Orange.com) and CERT-CC
(Orange.com) for reporting CVE-2018-7550.

Bug Fix(es):

* Previously, live migrating a Windows guest in some cases caused the guest
to become unresponsive. This update ensures that Real-time Clock (RTC)
interrupts are not missed, which prevents the problem from occurring.
(BZ#1596302)
");
  script_tag(name:"affected", value:"qemu-img on CentOS 7");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"CESA", value:"2018:2462");
  script_xref(name:"URL" , value:"http://lists.centos.org/pipermail/centos-announce/2018-August/022999.html");
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

  if ((res = isrpmvuln(pkg:"qemu-img", rpm:"qemu-img~1.5.3~156.el7_5.5", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-kvm", rpm:"qemu-kvm~1.5.3~156.el7_5.5", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-kvm-common", rpm:"qemu-kvm-common~1.5.3~156.el7_5.5", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qemu-kvm-tools", rpm:"qemu-kvm-tools~1.5.3~156.el7_5.5", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}