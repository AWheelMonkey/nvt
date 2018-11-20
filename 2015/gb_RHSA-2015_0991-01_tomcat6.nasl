###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for tomcat6 RHSA-2015:0991-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.871367");
  script_version("$Revision: 12380 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:03:48 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2015-06-09 11:01:11 +0200 (Tue, 09 Jun 2015)");
  script_cve_id("CVE-2014-0227");
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("RedHat Update for tomcat6 RHSA-2015:0991-01");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'tomcat6'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Apache Tomcat is a servlet container for the Java Servlet and JavaServer
Pages (JSP) technologies.

It was discovered that the ChunkedInputFilter in Tomcat did not fail
subsequent attempts to read input after malformed chunked encoding was
detected. A remote attacker could possibly use this flaw to make Tomcat
process part of the request body as new request, or cause a denial of
service. (CVE-2014-0227)

This update also fixes the following bug:

  * Before this update, the tomcat6 init script did not try to kill the
tomcat process if an attempt to stop it was unsuccessful, which would
prevent tomcat from restarting properly. The init script was modified to
correct this issue. (BZ#1207048)

All Tomcat 6 users are advised to upgrade to these updated packages, which
correct these issues. Tomcat must be restarted for this update to take
effect.");
  script_tag(name:"affected", value:"tomcat6 on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_xref(name:"RHSA", value:"2015:0991-01");
  script_xref(name:"URL" , value:"https://www.redhat.com/archives/rhsa-announce/2015-May/msg00007.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_6");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"tomcat6", rpm:"tomcat6~6.0.24~83.el6_6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tomcat6-admin-webapps", rpm:"tomcat6-admin-webapps~6.0.24~83.el6_6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tomcat6-debuginfo", rpm:"tomcat6-debuginfo~6.0.24~83.el6_6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tomcat6-docs-webapp", rpm:"tomcat6-docs-webapp~6.0.24~83.el6_6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tomcat6-el", rpm:"tomcat6-el~2.1~api~6.0.24~83.el6_6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tomcat6-javadoc", rpm:"tomcat6-javadoc~6.0.24~83.el6_6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tomcat6-jsp", rpm:"tomcat6-jsp~2.1~api~6.0.24~83.el6_6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tomcat6-lib", rpm:"tomcat6-lib~6.0.24~83.el6_6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tomcat6-servlet", rpm:"tomcat6-servlet~2.5~api~6.0.24~83.el6_6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tomcat6-webapps", rpm:"tomcat6-webapps~6.0.24~83.el6_6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}