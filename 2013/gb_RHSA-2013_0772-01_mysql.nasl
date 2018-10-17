###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for mysql RHSA-2013:0772-01
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
tag_insight = "MySQL is a multi-user, multi-threaded SQL database server. It consists of
  the MySQL server daemon (mysqld) and many client programs and libraries.

  This update fixes several vulnerabilities in the MySQL database server.
  Information about these flaws can be found on the Oracle Critical Patch
  Update Advisory page, listed in the References section. (CVE-2012-5614,
  CVE-2013-1506, CVE-2013-1521, CVE-2013-1531, CVE-2013-1532, CVE-2013-1544,
  CVE-2013-1548, CVE-2013-1552, CVE-2013-1555, CVE-2013-2375, CVE-2013-2378,
  CVE-2013-2389, CVE-2013-2391, CVE-2013-2392)

  These updated packages upgrade MySQL to version 5.1.69. Refer to the MySQL
  release notes listed in the References section for a full list of changes.

  All MySQL users should upgrade to these updated packages, which correct
  these issues. After installing this update, the MySQL server daemon
  (mysqld) will be restarted automatically.";


tag_affected = "mysql on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)";
tag_solution = "Please Install the Updated Packages.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.870990");
  script_version("$Revision: 9353 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-05-02 11:03:01 +0530 (Thu, 02 May 2013)");
  script_cve_id("CVE-2012-5614", "CVE-2013-1506", "CVE-2013-1521", "CVE-2013-1531",
                "CVE-2013-1532", "CVE-2013-1544", "CVE-2013-1548", "CVE-2013-1552",
                "CVE-2013-1555", "CVE-2013-2375", "CVE-2013-2378", "CVE-2013-2389",
                "CVE-2013-2391", "CVE-2013-2392");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");
  script_name("RedHat Update for mysql RHSA-2013:0772-01");

  script_xref(name: "RHSA", value: "2013:0772-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2013-April/msg00037.html");
  script_tag(name: "summary" , value: "Check for the Version of mysql");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
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

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"mysql", rpm:"mysql~5.1.69~1.el6_4", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mysql-bench", rpm:"mysql-bench~5.1.69~1.el6_4", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mysql-debuginfo", rpm:"mysql-debuginfo~5.1.69~1.el6_4", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mysql-devel", rpm:"mysql-devel~5.1.69~1.el6_4", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mysql-libs", rpm:"mysql-libs~5.1.69~1.el6_4", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mysql-server", rpm:"mysql-server~5.1.69~1.el6_4", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mysql-test", rpm:"mysql-test~5.1.69~1.el6_4", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
