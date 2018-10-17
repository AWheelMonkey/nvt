###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for quota CESA-2013:0120 centos5 
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
tag_insight = "The quota package provides system administration tools for monitoring
  and limiting user and group disk usage on file systems.

  It was discovered that the rpc.rquotad service did not use tcp_wrappers
  correctly. Certain hosts access rules defined in &quot;/etc/hosts.allow&quot; and
  &quot;/etc/hosts.deny&quot; may not have been honored, possibly allowing remote
  attackers to bypass intended access restrictions. (CVE-2012-3417)
  
  This issue was discovered by the Red Hat Security Response Team.
  
  This update also fixes the following bugs:
  
  * Prior to this update, values were not properly transported via the remote
  procedure call (RPC) and interpreted by the client when querying the quota
  usage or limits for network-mounted file systems if the quota values were
  2^32 kilobytes or greater. As a consequence, the client reported mangled
  values. This update modifies the underlying code so that such values are
  correctly interpreted by the client. (BZ#667360)
  
  * Prior to this update, warnquota sent messages about exceeded quota limits
  from a valid domain name if the warnquota tool was enabled to send warning
  e-mails and the superuser did not change the default warnquota
  configuration. As a consequence, the recipient could reply to invalid
  addresses. This update modifies the default warnquota configuration to use
  the reserved example.com. domain. Now, warnings about exceeded quota limits
  are sent from the reserved domain that inform the superuser to change to
  the correct value. (BZ#680429)
  
  * Previously, quota utilities could not recognize the file system as having
  quotas enabled and refused to operate on it due to incorrect updating of
  /etc/mtab. This update prefers /proc/mounts to get a list of file systems
  with enabled quotas. Now, quota utilities recognize file systems with
  enabled quotas as expected. (BZ#689822)
  
  * Prior to this update, the setquota(8) tool on XFS file systems failed
  to set disk limits to values greater than 2^31 kilobytes. This update
  modifies the integer conversion in the setquota(8) tool to use a 64-bit
  variable big enough to store such values. (BZ#831520)
  
  All users of quota are advised to upgrade to this updated package, which
  contains backported patches to resolve these issues.";


tag_affected = "quota on CentOS 5";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2013-January/019098.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881556");
  script_version("$Revision: 9353 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-01-21 09:37:53 +0530 (Mon, 21 Jan 2013)");
  script_cve_id("CVE-2012-3417");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:P/I:P/A:N");
  script_xref(name: "CESA", value: "2013:0120");
  script_name("CentOS Update for quota CESA-2013:0120 centos5 ");

  script_tag(name: "summary" , value: "Check for the Version of quota");
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

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"quota", rpm:"quota~3.13~8.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
