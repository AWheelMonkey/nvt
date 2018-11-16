###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for tomcat6 RHSA-2012:0475-01
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

tag_insight = "Apache Tomcat is a servlet container for the Java Servlet and JavaServer
  Pages (JSP) technologies.

  It was found that the Java hashCode() method implementation was susceptible
  to predictable hash collisions. A remote attacker could use this flaw to
  cause Tomcat to use an excessive amount of CPU time by sending an HTTP
  request with a large number of parameters whose names map to the same hash
  value. This update introduces a limit on the number of parameters processed
  per request to mitigate this issue. The default limit is 512 for
  parameters and 128 for headers. These defaults can be changed by setting
  the org.apache.tomcat.util.http.Parameters.MAX_COUNT and
  org.apache.tomcat.util.http.MimeHeaders.MAX_COUNT system properties.
  (CVE-2011-4858)

  It was found that Tomcat did not handle large numbers of parameters and
  large parameter values efficiently. A remote attacker could make Tomcat
  use an excessive amount of CPU time by sending an HTTP request containing a
  large number of parameters or large parameter values. This update
  introduces limits on the number of parameters and headers processed per
  request to address this issue. Refer to the CVE-2011-4858 description for
  information about the org.apache.tomcat.util.http.Parameters.MAX_COUNT and
  org.apache.tomcat.util.http.MimeHeaders.MAX_COUNT system properties.
  (CVE-2012-0022)

  Red Hat would like to thank oCERT for reporting CVE-2011-4858. oCERT
  acknowledges Julian Waelde and Alexander Klink as the original reporters of
  CVE-2011-4858.

  Users of Tomcat should upgrade to these updated packages, which correct
  these issues. Tomcat must be restarted for this update to take effect.";

tag_affected = "tomcat6 on Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2012-April/msg00008.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870714");
  script_version("$Revision: 12373 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 09:22:36 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2012-07-09 10:52:42 +0530 (Mon, 09 Jul 2012)");
  script_cve_id("CVE-2011-4858", "CVE-2012-0022");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_xref(name: "RHSA", value: "2012:0475-01");
  script_name("RedHat Update for tomcat6 RHSA-2012:0475-01");

  script_tag(name: "summary" , value: "Check for the Version of tomcat6");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_6");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"tomcat6", rpm:"tomcat6~6.0.24~36.el6_2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tomcat6-el-2.1-api", rpm:"tomcat6-el-2.1-api~6.0.24~36.el6_2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tomcat6-jsp-2.1-api", rpm:"tomcat6-jsp-2.1-api~6.0.24~36.el6_2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tomcat6-lib", rpm:"tomcat6-lib~6.0.24~36.el6_2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tomcat6-servlet-2.5-api", rpm:"tomcat6-servlet-2.5-api~6.0.24~36.el6_2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
