###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for 389-ds-base CESA-2013:1119 centos6 
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
tag_insight = "The 389 Directory Server is an LDAPv3 compliant server. The base packages
include the Lightweight Directory Access Protocol (LDAP) server and
command-line utilities for server administration.

It was discovered that the 389 Directory Server did not honor defined
attribute access controls when evaluating search filter expressions. A
remote attacker (with permission to query the Directory Server) could use
this flaw to determine the values of restricted attributes via a series of
search queries with filter conditions that used restricted attributes.
(CVE-2013-2219)

This issue was discovered by Ludwig Krispenz of Red Hat.

This update also fixes the following bugs:

* Previously, the disk monitoring feature did not function properly. If
logging functionality was set to critical and logging was disabled, rotated
logs would be deleted. If the attribute 'nsslapd-errorlog-level' was
explicitly set to any value, even zero, the disk monitoring feature would
not stop the Directory Server when it was supposed to. This update
corrects the disk monitoring feature settings, and it no longer
malfunctions in the described scenarios. (BZ#972930)

* Previously, setting the 'nsslapd-disk-monitoring-threshold' attribute via
ldapmodify to a large value worked as expected  however, a bug in
ldapsearch caused such values for the option to be displayed as negative
values. This update corrects the bug in ldapsearch and correct values are
now displayed. (BZ#984970)

* If logging functionality was not set to critical, then the mount point
for the logs directory was incorrectly skipped during the disk space check.
(BZ#987850)

All 389-ds-base users are advised to upgrade to these updated packages,
which contain backported patches to correct these issues. After installing
this update, the 389 server service will be restarted automatically.";


if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.881770");
  script_version("$Revision: 9353 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-08-01 18:43:32 +0530 (Thu, 01 Aug 2013)");
  script_cve_id("CVE-2013-2219");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:N/A:N");
  script_name("CentOS Update for 389-ds-base CESA-2013:1119 centos6 ");


  tag_affected = "389-ds-base on CentOS 6";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "CESA", value: "2013:1119");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2013-July/019883.html");
  script_tag(name: "summary" , value: "Check for the Version of 389-ds-base");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
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

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"389-ds-base", rpm:"389-ds-base~1.2.11.15~20.el6_4", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"389-ds-base-devel", rpm:"389-ds-base-devel~1.2.11.15~20.el6_4", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"389-ds-base-libs", rpm:"389-ds-base-libs~1.2.11.15~20.el6_4", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
