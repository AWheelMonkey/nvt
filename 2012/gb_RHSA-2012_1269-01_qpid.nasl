###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for qpid RHSA-2012:1269-01
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
tag_insight = "Apache Qpid is a reliable, cross-platform, asynchronous messaging system
  that supports the Advanced Message Queuing Protocol (AMQP) in several
  common programming languages.

  It was discovered that the Qpid daemon (qpidd) did not allow the number of
  connections from clients to be restricted. A malicious client could use
  this flaw to open an excessive amount of connections, preventing other
  legitimate clients from establishing a connection to qpidd. (CVE-2012-2145)

  To address CVE-2012-2145, new qpidd configuration options were introduced:
  max-negotiate-time defines the time during which initial protocol
  negotiation must succeed, connection-limit-per-user and
  connection-limit-per-ip can be used to limit the number of connections per
  user and client host IP. Refer to the qpidd manual page for additional
  details.

  In addition, the qpid-cpp, qpid-qmf, qpid-tools, and python-qpid packages
  have been upgraded to upstream version 0.14, which provides support for Red
  Hat Enterprise MRG 2.2, as well as a number of bug fixes and enhancements
  over the previous version. (BZ#840053, BZ#840055, BZ#840056, BZ#840058)

  All users of qpid are advised to upgrade to these updated packages, which
  fix these issues and add these enhancements.";

tag_affected = "qpid on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2012-September/msg00028.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870836");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-09-22 11:57:24 +0530 (Sat, 22 Sep 2012)");
  script_cve_id("CVE-2012-2145");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_xref(name: "RHSA", value: "2012:1269-01");
  script_name("RedHat Update for qpid RHSA-2012:1269-01");

  script_tag(name: "summary" , value: "Check for the Version of qpid");
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

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"python-qpid-qmf", rpm:"python-qpid-qmf~0.14~14.el6_3", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qpid-cpp-client", rpm:"qpid-cpp-client~0.14~22.el6_3", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qpid-cpp-client-ssl", rpm:"qpid-cpp-client-ssl~0.14~22.el6_3", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qpid-cpp-debuginfo", rpm:"qpid-cpp-debuginfo~0.14~22.el6_3", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qpid-cpp-server", rpm:"qpid-cpp-server~0.14~22.el6_3", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qpid-cpp-server-ssl", rpm:"qpid-cpp-server-ssl~0.14~22.el6_3", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qpid-qmf", rpm:"qpid-qmf~0.14~14.el6_3", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qpid-qmf-debuginfo", rpm:"qpid-qmf-debuginfo~0.14~14.el6_3", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ruby-qpid-qmf", rpm:"ruby-qpid-qmf~0.14~14.el6_3", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"python-qpid", rpm:"python-qpid~0.14~11.el6_3", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qpid-tools", rpm:"qpid-tools~0.14~6.el6_3", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
