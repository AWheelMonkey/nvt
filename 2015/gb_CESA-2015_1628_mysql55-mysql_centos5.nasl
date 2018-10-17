###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for mysql55-mysql CESA-2015:1628 centos5 
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
  script_oid("1.3.6.1.4.1.25623.1.0.882250");
  script_version("$Revision: 6657 $");
  script_cve_id("CVE-2014-6568", "CVE-2015-0374", "CVE-2015-0381", "CVE-2015-0382",
                "CVE-2015-0391", "CVE-2015-0411", "CVE-2015-0432", "CVE-2015-0433",
                "CVE-2015-0441", "CVE-2015-0499", "CVE-2015-0501", "CVE-2015-0505",
                "CVE-2015-2568", "CVE-2015-2571", "CVE-2015-2573", "CVE-2015-2582",
                "CVE-2015-2620", "CVE-2015-2643", "CVE-2015-2648", "CVE-2015-4737",
                "CVE-2015-4752", "CVE-2015-4757");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:50:44 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-08-18 06:49:53 +0200 (Tue, 18 Aug 2015)");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for mysql55-mysql CESA-2015:1628 centos5 ");
  script_tag(name: "summary", value: "Check the version of mysql55-mysql");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "MySQL is a multi-user, multi-threaded SQL database server. It consists of
the MySQL server daemon (mysqld) and many client programs and libraries.

This update fixes several vulnerabilities in the MySQL database server.
Information about these flaws can be found on the Oracle Critical Patch
Update Advisory pages, listed in the References section. (CVE-2014-6568,
CVE-2015-0374, CVE-2015-0381, CVE-2015-0382, CVE-2015-0391, CVE-2015-0411,
CVE-2015-0432, CVE-2015-0433, CVE-2015-0441, CVE-2015-0499, CVE-2015-0501,
CVE-2015-0505, CVE-2015-2568, CVE-2015-2571, CVE-2015-2573, CVE-2015-2582,
CVE-2015-2620, CVE-2015-2643, CVE-2015-2648, CVE-2015-4737, CVE-2015-4752,
CVE-2015-4757)

These updated packages upgrade MySQL to version 5.5.45. Refer to the MySQL
Release Notes listed in the References section for a complete list of
changes.

All MySQL users should upgrade to these updated packages, which correct
these issues. After installing this update, the MySQL server daemon
(mysqld) will be restarted automatically.
");
  script_tag(name: "affected", value: "mysql55-mysql on CentOS 5");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "CESA", value: "2015:1628");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2015-August/021331.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"mysql55-mysql", rpm:"mysql55-mysql~5.5.45~1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mysql55-mysql-bench", rpm:"mysql55-mysql-bench~5.5.45~1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mysql55-mysql-devel", rpm:"mysql55-mysql-devel~5.5.45~1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mysql55-mysql-libs", rpm:"mysql55-mysql-libs~5.5.45~1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mysql55-mysql-server", rpm:"mysql55-mysql-server~5.5.45~1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mysql55-mysql-test", rpm:"mysql55-mysql-test~5.5.45~1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
