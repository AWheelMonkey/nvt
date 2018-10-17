###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for perl-DBD-Pg RHSA-2012:1116-01
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
tag_insight = "Perl DBI is a database access Application Programming Interface (API) for
  the Perl language. perl-DBD-Pg allows Perl applications to access
  PostgreSQL database servers.

  Two format string flaws were found in perl-DBD-Pg. A specially-crafted
  database warning or error message from a server could cause an application
  using perl-DBD-Pg to crash or, potentially, execute arbitrary code with the
  privileges of the user running the application. (CVE-2012-1151)

  All users of perl-DBD-Pg are advised to upgrade to this updated package,
  which contains a backported patch to fix these issues. Applications using
  perl-DBD-Pg must be restarted for the update to take effect.";

tag_affected = "perl-DBD-Pg on Red Hat Enterprise Linux (v. 5 server),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2012-July/msg00026.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870796");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-07-26 11:09:25 +0530 (Thu, 26 Jul 2012)");
  script_cve_id("CVE-2012-1151");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_xref(name: "RHSA", value: "2012:1116-01");
  script_name("RedHat Update for perl-DBD-Pg RHSA-2012:1116-01");

  script_tag(name: "summary" , value: "Check for the Version of perl-DBD-Pg");
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

  if ((res = isrpmvuln(pkg:"perl-DBD-Pg", rpm:"perl-DBD-Pg~2.15.1~4.el6_3", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"perl-DBD-Pg-debuginfo", rpm:"perl-DBD-Pg-debuginfo~2.15.1~4.el6_3", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "RHENT_5")
{

  if ((res = isrpmvuln(pkg:"perl-DBD-Pg", rpm:"perl-DBD-Pg~1.49~4.el5_8", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"perl-DBD-Pg-debuginfo", rpm:"perl-DBD-Pg-debuginfo~1.49~4.el5_8", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
