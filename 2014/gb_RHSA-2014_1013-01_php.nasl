###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for php RHSA-2014:1013-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.871219");
  script_version("$Revision: 12382 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:51:56 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2014-08-06 12:05:27 +0200 (Wed, 06 Aug 2014)");
  script_cve_id("CVE-2013-7345", "CVE-2014-0207", "CVE-2014-0237", "CVE-2014-0238",
                "CVE-2014-3479", "CVE-2014-3480", "CVE-2014-3487", "CVE-2014-3515",
                "CVE-2014-4049", "CVE-2014-4721");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("RedHat Update for php RHSA-2014:1013-01");


  script_tag(name:"affected", value:"php on Red Hat Enterprise Linux Server (v. 7)");
  script_tag(name:"insight", value:"PHP is an HTML-embedded scripting language commonly used with the Apache
HTTP Server. PHP's fileinfo module provides functions used to identify a
particular file according to the type of data contained by the file.

A denial of service flaw was found in the File Information (fileinfo)
extension rules for detecting AWK files. A remote attacker could use this
flaw to cause a PHP application using fileinfo to consume an excessive
amount of CPU. (CVE-2013-7345)

Multiple denial of service flaws were found in the way the File Information
(fileinfo) extension parsed certain Composite Document Format (CDF) files.
A remote attacker could use either of these flaws to crash a PHP
application using fileinfo via a specially crafted CDF file.
(CVE-2014-0207, CVE-2014-0237, CVE-2014-0238, CVE-2014-3479, CVE-2014-3480,
CVE-2014-3487)

A heap-based buffer overflow flaw was found in the way PHP parsed DNS TXT
records. A malicious DNS server or a man-in-the-middle attacker could
possibly use this flaw to execute arbitrary code as the PHP interpreter if
a PHP application used the dns_get_record() function to perform a DNS
query. (CVE-2014-4049)

A type confusion issue was found in PHP's phpinfo() function. A malicious
script author could possibly use this flaw to disclose certain portions of
server memory. (CVE-2014-4721)

A type confusion issue was found in the SPL ArrayObject and
SPLObjectStorage classes' unserialize() method. A remote attacker able to
submit specially crafted input to a PHP application, which would then
unserialize this input using one of the aforementioned methods, could use
this flaw to execute arbitrary code with the privileges of the user running
that PHP application. (CVE-2014-3515)

The CVE-2014-0207, CVE-2014-0237, CVE-2014-0238, CVE-2014-3479,
CVE-2014-3480, and CVE-2014-3487 issues were discovered by Francisco Alonso
of Red Hat Product Security.

All php users are advised to upgrade to these updated packages, which
contain backported patches to correct these issues. After installing the
updated packages, the httpd daemon must be restarted for the update to
take effect.");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"RHSA", value:"2014:1013-01");
  script_xref(name:"URL" , value:"https://www.redhat.com/archives/rhsa-announce/2014-August/msg00007.html");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'php'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_7");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_7")
{

  if ((res = isrpmvuln(pkg:"php", rpm:"php~5.4.16~23.el7_0", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"php-cli", rpm:"php-cli~5.4.16~23.el7_0", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"php-common", rpm:"php-common~5.4.16~23.el7_0", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"php-debuginfo", rpm:"php-debuginfo~5.4.16~23.el7_0", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"php-gd", rpm:"php-gd~5.4.16~23.el7_0", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"php-ldap", rpm:"php-ldap~5.4.16~23.el7_0", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"php-mysql", rpm:"php-mysql~5.4.16~23.el7_0", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"php-odbc", rpm:"php-odbc~5.4.16~23.el7_0", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"php-pdo", rpm:"php-pdo~5.4.16~23.el7_0", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"php-pgsql", rpm:"php-pgsql~5.4.16~23.el7_0", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"php-process", rpm:"php-process~5.4.16~23.el7_0", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"php-recode", rpm:"php-recode~5.4.16~23.el7_0", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"php-soap", rpm:"php-soap~5.4.16~23.el7_0", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"php-xml", rpm:"php-xml~5.4.16~23.el7_0", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"php-xmlrpc", rpm:"php-xmlrpc~5.4.16~23.el7_0", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
