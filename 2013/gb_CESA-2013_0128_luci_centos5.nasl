###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for luci CESA-2013:0128 centos5 
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
tag_insight = "The Conga project is a management system for remote workstations. It
  consists of luci, which is a secure web-based front end, and ricci, which
  is a secure daemon that dispatches incoming messages to underlying
  management modules.

  It was discovered that luci stored usernames and passwords in session
  cookies. This issue prevented the session inactivity timeout feature from
  working correctly, and allowed attackers able to get access to a session
  cookie to obtain the victim's authentication credentials. (CVE-2012-3359)
  
  Red Hat would like to thank George Hedfors of Cybercom Sweden East AB for
  reporting this issue.
  
  This update also fixes the following bugs:
  
  * Prior to this update, luci did not allow the fence_apc_snmp agent to be
  configured. As a consequence, users could not configure or view an existing
  configuration for fence_apc_snmp. This update adds a new screen that allows
  fence_apc_snmp to be configured. (BZ#832181)
  
  * Prior to this update, luci did not allow the SSL operation of the
  fence_ilo fence agent to be enabled or disabled. As a consequence, users
  could not configure or view an existing configuration for the 'ssl'
  attribute for fence_ilo. This update adds a checkbox to show whether the
  SSL operation is enabled and allows users to edit that attribute.
  (BZ#832183)
  
  * Prior to this update, luci did not allow the &quot;identity_file&quot; attribute of
  the fence_ilo_mp fence agent to be viewed or edited. As a consequence,
  users could not configure or view an existing configuration for the
  &quot;identity_file&quot; attribute of the fence_ilo_mp fence agent. This update adds
  a text input box to show the current state of the &quot;identity_file&quot; attribute
  of fence_ilo_mp and allows users to edit that attribute. (BZ#832185)
  
  * Prior to this update, redundant files and directories remained on the
  file system at /var/lib/luci/var/pts and /usr/lib{,64}/luci/zope/var/pts
  when the luci package was uninstalled. This update removes these files
  and directories when the luci package is uninstalled. (BZ#835649)
  
  * Prior to this update, the &quot;restart-disable&quot; recovery policy was not
  displayed in the recovery policy list from which users could select when
  they configure a recovery policy for a failover domain. As a consequence,
  the &quot;restart-disable&quot; recovery policy could not be set with the luci GUI.
  This update adds the &quot;restart-disable&quot; recovery option to the recovery
  policy pulldown list. (BZ#839732)
  
  * Prior to this update, line breaks that were not anticipated in the &quot;yum ... 

  Description truncated, for more information please check the Reference URL";


tag_affected = "luci on CentOS 5";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2013-January/019202.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881568");
  script_version("$Revision: 9353 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-01-21 09:41:29 +0530 (Mon, 21 Jan 2013)");
  script_cve_id("CVE-2012-3359");
  script_tag(name:"cvss_base", value:"3.7");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:N/C:P/I:P/A:P");
  script_xref(name: "CESA", value: "2013:0128");
  script_name("CentOS Update for luci CESA-2013:0128 centos5 ");

  script_tag(name: "summary" , value: "Check for the Version of luci");
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

  if ((res = isrpmvuln(pkg:"luci", rpm:"luci~0.12.2~64.el5.centos", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ricci", rpm:"ricci~0.12.2~64.el5.centos", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"conga", rpm:"conga~0.12.2~64.el5.centos", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
