###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for kernel CESA-2017:0307 centos6 
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
  script_oid("1.3.6.1.4.1.25623.1.0.882667");
  script_version("$Revision: 6659 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:52:22 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2017-03-02 12:09:26 +0530 (Thu, 02 Mar 2017)");
  script_cve_id("CVE-2016-6136", "CVE-2016-9555");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for kernel CESA-2017:0307 centos6 ");
  script_tag(name: "summary", value: "Check the version of kernel");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The kernel packages contain the Linux kernel, 
the core of any Linux operating system.

Security Fix(es):

* When creating audit records for parameters to executed children
processes, an attacker can convince the Linux kernel audit subsystem can
create corrupt records which may allow an attacker to misrepresent or evade
logging of executing commands. (CVE-2016-6136, Moderate)

* A flaw was found in the Linux kernel's implementation of the SCTP
protocol. A remote attacker could trigger an out-of-bounds read with an
offset of up to 64kB potentially causing the system to crash.
(CVE-2016-9555, Moderate)

Bug Fix(es):

* The qlnic driver previously attempted to fetch pending transmission
descriptors before all writes were complete, which lead to firmware hangs.
With this update, the qlcnic driver has been fixed to complete all writes
before the hardware fetches any pending transmission descriptors. As a
result, the firmware no longer hangs with the qlcnic driver. (BZ#1403143)

* Previously, when a NFS share was mounted, the file-system (FS) cache was
incorrectly enabled even when the '-o fsc' option was not used in the mount
command. Consequently, the cachefilesd service stored files in the NFS
share even when not instructed to by the user. With this update, NFS does
not use the FS cache if not instructed by the '-o fsc' option. As a result,
NFS no longer enables caching if the '-o fsc' option is not used.
(BZ#1399172)

* Previously, an NFS client and NFS server got into a NFS4 protocol loop
involving a WRITE action and a NFS4ERR_EXPIRED response when the
current_fileid counter got to the wraparound point by overflowing the value
of 32 bits. This update fixes the NFS server to handle the current_fileid
wraparound. As a result, the described NFS4 protocol loop no longer occurs.
(BZ#1399174)

* Previously, certain configurations of the Hewlett Packard Smart Array
(HPSA) devices caused hardware to be set offline incorrectly when the HPSA
driver was expected to wait for existing I/O operations to complete.
Consequently, a kernel panic occurred. This update prevents the described
problem. As a result, the kernel panic no longer occurs. (BZ#1399175)

* Previously, memory corruption by copying data into the wrong memory
locations sometimes occurred, because the __copy_tofrom_user() function was
returning incorrect values. This update fixes the __copy_tofrom_user()
function so that it no longer returns larger values than the number of
bytes it was asked to copy. As a result, memory corruption no longer occurs
in he described scenario. (BZ#1398185)

* Previously, guest virtual machines (VMs) on a Hyper-V server ... 

  Description truncated, for more information please check the Reference URL");
  script_tag(name: "affected", value: "kernel on CentOS 6");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2017:0307");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2017-February/022281.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
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

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~2.6.32~642.15.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-abi-whitelists", rpm:"kernel-abi-whitelists~2.6.32~642.15.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug", rpm:"kernel-debug~2.6.32~642.15.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug-devel", rpm:"kernel-debug-devel~2.6.32~642.15.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-devel", rpm:"kernel-devel~2.6.32~642.15.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-doc", rpm:"kernel-doc~2.6.32~642.15.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-firmware", rpm:"kernel-firmware~2.6.32~642.15.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-headers", rpm:"kernel-headers~2.6.32~642.15.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"perf", rpm:"perf~2.6.32~642.15.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"python-perf", rpm:"python-perf~2.6.32~642.15.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
