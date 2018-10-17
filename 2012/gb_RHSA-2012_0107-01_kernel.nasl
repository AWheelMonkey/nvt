###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for kernel RHSA-2012:0107-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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

  * Using the SG_IO ioctl to issue SCSI requests to partitions or LVM volumes
  resulted in the requests being passed to the underlying block device. If a
  privileged user only had access to a single partition or LVM volume, they
  could use this flaw to bypass those restrictions and gain read and write
  access (and be able to issue other SCSI commands) to the entire block
  device. Refer to Red Hat Knowledgebase article DOC-67874, linked to in the
  References, for further details about this issue. (CVE-2011-4127,
  Important)

  * A flaw was found in the way the Linux kernel handled robust list pointers
  of user-space held futexes across exec() calls. A local, unprivileged user
  could use this flaw to cause a denial of service or, eventually, escalate
  their privileges. (CVE-2012-0028, Important)

  * A flaw was found in the Linux kernel in the way splitting two extents in
  ext4_ext_convert_to_initialized() worked. A local, unprivileged user with
  the ability to mount and unmount ext4 file systems could use this flaw to
  cause a denial of service. (CVE-2011-3638, Moderate)

  * A flaw was found in the way the Linux kernel's journal_unmap_buffer()
  function handled buffer head states. On systems that have an ext4 file
  system with a journal mounted, a local, unprivileged user could use this
  flaw to cause a denial of service. (CVE-2011-4086, Moderate)

  * A divide-by-zero flaw was found in the Linux kernel's igmp_heard_query()
  function. An attacker able to send certain IGMP (Internet Group Management
  Protocol) packets to a target system could use this flaw to cause a denial
  of service. (CVE-2012-0207, Moderate)

  Red Hat would like to thank Zheng Liu for reporting CVE-2011-3638, and
  Simon McVittie for reporting CVE-2012-0207.

  This update also fixes the following bugs:

  * When a host was in recovery mode and a SCSI scan operation was initiated,
  the scan operation failed and provided no error output. This bug has been
  fixed and the SCSI layer now waits for recovery of the host to complete
  scan operations for devices. (BZ#772162)

  * SG_IO ioctls were not implemented correctly in the Red Hat Enterprise
  Linux 5 virtio-blk driver. Sending an SG_IO ioctl request to a virtio-blk
  disk caused the sending thread to enter an uninterruptible sleep state (&quot;D&quot;
  state). With this update, SG_IO ioctls are rejected by the virtio-blk
  driver: the ioctl system call will simply  ...

  Description truncated, for more information please check the Reference URL";

tag_affected = "kernel on Red Hat Enterprise Linux (v. 5 server)";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2012-February/msg00024.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870544");
  script_tag(name:"cvss_base", value:"7.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
 script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-02-13 16:29:09 +0530 (Mon, 13 Feb 2012)");
  script_cve_id("CVE-2011-3638", "CVE-2011-4086", "CVE-2011-4127", "CVE-2012-0028",
                "CVE-2012-0207");
  script_xref(name: "RHSA", value: "2012:0107-01");
  script_name("RedHat Update for kernel RHSA-2012:0107-01");

  script_tag(name: "summary" , value: "Check for the Version of kernel");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
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

if(release == "RHENT_5")
{

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~2.6.18~274.18.1.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-PAE", rpm:"kernel-PAE~2.6.18~274.18.1.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-PAE-debuginfo", rpm:"kernel-PAE-debuginfo~2.6.18~274.18.1.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-PAE-devel", rpm:"kernel-PAE-devel~2.6.18~274.18.1.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug", rpm:"kernel-debug~2.6.18~274.18.1.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug-debuginfo", rpm:"kernel-debug-debuginfo~2.6.18~274.18.1.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug-devel", rpm:"kernel-debug-devel~2.6.18~274.18.1.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debuginfo", rpm:"kernel-debuginfo~2.6.18~274.18.1.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debuginfo-common", rpm:"kernel-debuginfo-common~2.6.18~274.18.1.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-devel", rpm:"kernel-devel~2.6.18~274.18.1.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-headers", rpm:"kernel-headers~2.6.18~274.18.1.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen", rpm:"kernel-xen~2.6.18~274.18.1.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen-debuginfo", rpm:"kernel-xen-debuginfo~2.6.18~274.18.1.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen-devel", rpm:"kernel-xen-devel~2.6.18~274.18.1.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-doc", rpm:"kernel-doc~2.6.18~274.18.1.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
