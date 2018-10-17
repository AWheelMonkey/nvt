###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for kernel CESA-2013:0223 centos6 
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  
  * It was found that a deadlock could occur in the Out of Memory (OOM)
  killer. A process could trigger this deadlock by consuming a large amount
  of memory, and then causing request_module() to be called. A local,
  unprivileged user could use this flaw to cause a denial of service
  (excessive memory consumption). (CVE-2012-4398, Moderate)
  
  * A flaw was found in the way the KVM (Kernel-based Virtual Machine)
  subsystem handled guests attempting to run with the X86_CR4_OSXSAVE CPU
  feature flag set. On hosts without the XSAVE CPU feature, a local,
  unprivileged user could use this flaw to crash the host system. (The
  &quot;grep --color xsave /proc/cpuinfo&quot; command can be used to verify if your
  system has the XSAVE CPU feature.) (CVE-2012-4461, Moderate)
  
  * A memory disclosure flaw was found in the way the load_script() function
  in the binfmt_script binary format handler handled excessive recursions. A
  local, unprivileged user could use this flaw to leak kernel stack memory to
  user-space by executing specially-crafted scripts. (CVE-2012-4530, Low)
  
  Red Hat would like to thank Tetsuo Handa for reporting CVE-2012-4398, and
  Jon Howell for reporting CVE-2012-4461.
  
  This update also fixes several bugs. Documentation for these changes will
  be available shortly from the Technical Notes document linked to in the
  References section.
  
  Users should upgrade to these updated packages, which contain backported
  patches to correct these issues, and fix the bugs noted in the Technical
  Notes. The system must be rebooted for this update to take effect.";


tag_affected = "kernel on CentOS 6";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2013-February/019229.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881593");
  script_version("$Revision: 9353 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-02-08 10:16:10 +0530 (Fri, 08 Feb 2013)");
  script_cve_id("CVE-2012-4398", "CVE-2012-4461", "CVE-2012-4530");
  script_tag(name:"cvss_base", value:"4.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:N/I:N/A:C");
  script_xref(name: "CESA", value: "2013:0223");
  script_name("CentOS Update for kernel CESA-2013:0223 centos6 ");

  script_tag(name: "summary" , value: "Check for the Version of kernel");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
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

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~2.6.32~279.22.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug", rpm:"kernel-debug~2.6.32~279.22.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug-devel", rpm:"kernel-debug-devel~2.6.32~279.22.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-devel", rpm:"kernel-devel~2.6.32~279.22.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-doc", rpm:"kernel-doc~2.6.32~279.22.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-firmware", rpm:"kernel-firmware~2.6.32~279.22.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-headers", rpm:"kernel-headers~2.6.32~279.22.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"perf", rpm:"perf~2.6.32~279.22.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"python-perf", rpm:"python-perf~2.6.32~279.22.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
