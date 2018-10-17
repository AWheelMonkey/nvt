###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for httpd RHSA-2012:0323-01
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
tag_insight = "The Apache HTTP Server is a popular web server.

  It was discovered that the fix for CVE-2011-3368 (released via
  RHSA-2011:1392) did not completely address the problem. An attacker could
  bypass the fix and make a reverse proxy connect to an arbitrary server not
  directly accessible to the attacker by sending an HTTP version 0.9 request.
  (CVE-2011-3639)

  The httpd server included the full HTTP header line in the default error
  page generated when receiving an excessively long or malformed header.
  Malicious JavaScript running in the server's domain context could use this
  flaw to gain access to httpOnly cookies. (CVE-2012-0053)

  An integer overflow flaw, leading to a heap-based buffer overflow, was
  found in the way httpd performed substitutions in regular expressions. An
  attacker able to set certain httpd settings, such as a user permitted to
  override the httpd configuration for a specific directory using a
  &quot;.htaccess&quot; file, could use this flaw to crash the httpd child process or,
  possibly, execute arbitrary code with the privileges of the &quot;apache&quot; user.
  (CVE-2011-3607)

  A flaw was found in the way httpd handled child process status information.
  A malicious program running with httpd child process privileges (such as a
  PHP or CGI script) could use this flaw to cause the parent httpd process to
  crash during httpd service shutdown. (CVE-2012-0031)

  All httpd users should upgrade to these updated packages, which contain
  backported patches to correct these issues. After installing the updated
  packages, the httpd daemon will be restarted automatically.";

tag_affected = "httpd on Red Hat Enterprise Linux (v. 5 server)";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2012-February/msg00063.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870571");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-02-27 11:17:07 +0530 (Mon, 27 Feb 2012)");
  script_cve_id("CVE-2011-3607", "CVE-2011-3639", "CVE-2012-0031",
                "CVE-2012-0053", "CVE-2011-3368");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_xref(name: "RHSA", value: "2012:0323-01");
  script_name("RedHat Update for httpd RHSA-2012:0323-01");

  script_tag(name: "summary" , value: "Check for the Version of httpd");
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

  if ((res = isrpmvuln(pkg:"httpd", rpm:"httpd~2.2.3~63.el5_8.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"httpd-debuginfo", rpm:"httpd-debuginfo~2.2.3~63.el5_8.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"httpd-devel", rpm:"httpd-devel~2.2.3~63.el5_8.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"httpd-manual", rpm:"httpd-manual~2.2.3~63.el5_8.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mod_ssl", rpm:"mod_ssl~2.2.3~63.el5_8.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
