###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for 389-ds-base CESA-2013:0742 centos6
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

  It was found that the 389 Directory Server did not properly restrict access
  to entries when the &quot;nsslapd-allow-anonymous-access&quot; configuration setting
  was set to &quot;rootdse&quot;. An anonymous user could connect to the LDAP database
  and, if the search scope is set to BASE, obtain access to information
  outside of the rootDSE. (CVE-2013-1897)

  This issue was discovered by Martin Kosek of Red Hat.

  This update also fixes the following bugs:

  * Previously, the schema-reload plug-in was not thread-safe. Consequently,
  executing the schema-reload.pl script under heavy load could have caused
  the ns-slapd process to terminate unexpectedly with a segmentation fault.
  Currently, the schema-reload plug-in is re-designed so that it is
  thread-safe, and the schema-reload.pl script can be executed along with
  other LDAP operations. (BZ#929107)

  * An out of scope problem for a local variable, in some cases, caused the
  modrdn operation to terminate unexpectedly with a segmentation fault. This
  update declares the local variable at the proper place of the function so
  it does not go out of scope, and the modrdn operation no longer crashes.
  (BZ#929111)

  * A task manually constructed an exact value to be removed from the
  configuration if the &quot;replica-force-cleaning&quot; option was used.
  Consequently, the task configuration was not cleaned up, and every time the
  server was restarted, the task behaved in the described manner. This update
  searches the configuration for the exact value to delete, instead of
  manually building the value, and the task does not restart when the server
  is restarted. (BZ#929114)

  * Previously, a NULL pointer dereference could have occurred when
  attempting to get effective rights on an entry that did not exist, leading
  to an unexpected termination due to a segmentation fault. This update
  checks for NULL entry pointers and returns the appropriate error. Now,
  attempts to get effective rights on an entry that does not exist no longer
  causes crashes, and the server returns the appropriate error message.
  (BZ#929115)

  * A problem in the lock timing in the DNA plug-in caused a deadlock if the
  DNA operation was executed with other plug-ins. This update moves the
  release timing of the problematic lock, and the DNA plug-in does not cause
  the deadlock. (BZ#929196)

  All 389-ds-base users are advised to upgrade to these updated packages,
  which contain backported patches to correct these issues. After installing
  this update, the 389 server service will be restarted automatically.";


tag_solution = "Please Install the Updated Packages.";
tag_affected = "389-ds-base on CentOS 6";


if(description)
{
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_oid("1.3.6.1.4.1.25623.1.0.881716");
  script_version("$Revision: 9353 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-04-19 10:05:37 +0530 (Fri, 19 Apr 2013)");
  script_cve_id("CVE-2013-1897");
  script_tag(name:"cvss_base", value:"2.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:P/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_name("CentOS Update for 389-ds-base CESA-2013:0742 centos6 ");

  script_xref(name: "CESA", value: "2013:0742");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2013-April/019689.html");
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

  if ((res = isrpmvuln(pkg:"389-ds-base", rpm:"389-ds-base~1.2.11.15~14.el6_4", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"389-ds-base-devel", rpm:"389-ds-base-devel~1.2.11.15~14.el6_4", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"389-ds-base-libs", rpm:"389-ds-base-libs~1.2.11.15~14.el6_4", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
