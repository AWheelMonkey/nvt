###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for kernel CESA-2014:0926 centos5 
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
  script_oid("1.3.6.1.4.1.25623.1.0.881973");
  script_version("$Revision: 9373 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:57:18 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2014-07-28 16:34:55 +0530 (Mon, 28 Jul 2014)");
  script_cve_id("CVE-2014-2678", "CVE-2014-4021");
  script_tag(name:"cvss_base", value:"4.7");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:N/I:N/A:C");
  script_name("CentOS Update for kernel CESA-2014:0926 centos5 ");

  tag_insight = "The kernel packages contain the Linux kernel, the core of any
Linux operating system.

* A NULL pointer dereference flaw was found in the rds_iw_laddr_check()
function in the Linux kernel's implementation of Reliable Datagram Sockets
(RDS). A local, unprivileged user could use this flaw to crash the system.
(CVE-2014-2678, Moderate)

* It was found that the Xen hypervisor implementation did not properly
clean memory pages previously allocated by the hypervisor. A privileged
guest user could potentially use this flaw to read data relating to other
guests or the hypervisor itself. (CVE-2014-4021, Moderate)

Red Hat would like to thank the Xen project for reporting CVE-2014-4021.
Upstream acknowledges Jan Beulich as the original reporter.

This update also fixes the following bugs:

* A bug in the journaling block device (jbd and jbd2) code could, under
certain circumstances, trigger a BUG_ON() assertion and result in a kernel
oops. This happened when an application performed an extensive number of
commits to the journal of the ext3 file system and there was no currently
active transaction while synchronizing the file's in-core state. This
problem has been resolved by correcting respective test conditions in the
jbd and jbd2 code. (BZ#1097528)

* After a statically defined gateway became unreachable and its
corresponding neighbor entry entered a FAILED state, the gateway stayed in
the FAILED state even after it became reachable again. As a consequence,
traffic was not routed through that gateway. This update allows probing
such a gateway automatically so that the traffic can be routed through
this gateway again once it becomes reachable. (BZ#1106354)

* Due to an incorrect condition check in the IPv6 code, the ipv6 driver
was unable to correctly assemble incoming packet fragments, which resulted
in a high IPv6 packet loss rate. This update fixes the said check for a
fragment overlap and ensures that incoming IPv6 packet fragments are now
processed as expected. (BZ#1107932)

* Recent changes in the d_splice_alias() function introduced a bug that
allowed d_splice_alias() to return a dentry from a different directory
than the directory being looked up. As a consequence in cluster
environment, a kernel panic could be triggered when a directory was being
removed while a concurrent cross-directory operation was performed on this
directory on another cluster node. This update avoids the kernel panic in
this situation by correcting the search logic in the d_splice_alias()
function so that the function can no longer return a dentry from an
incorrect directory. (BZ#1109720)

* The NFSv4 server did not handle m ...

  Description truncated, for more information please check the Reference URL";

  tag_affected = "kernel on CentOS 5";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "CESA", value: "2014:0926");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2014-July/020443.html");
  script_tag(name:"summary", value:"Check for the Version of kernel");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
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

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~2.6.18~371.11.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug", rpm:"kernel-debug~2.6.18~371.11.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug-devel", rpm:"kernel-debug-devel~2.6.18~371.11.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-devel", rpm:"kernel-devel~2.6.18~371.11.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-doc", rpm:"kernel-doc~2.6.18~371.11.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-headers", rpm:"kernel-headers~2.6.18~371.11.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-PAE", rpm:"kernel-PAE~2.6.18~371.11.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-PAE-devel", rpm:"kernel-PAE-devel~2.6.18~371.11.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen", rpm:"kernel-xen~2.6.18~371.11.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen-devel", rpm:"kernel-xen-devel~2.6.18~371.11.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
