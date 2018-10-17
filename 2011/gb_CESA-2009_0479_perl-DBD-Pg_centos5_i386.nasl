###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for perl-DBD-Pg CESA-2009:0479 centos5 i386
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

  A heap-based buffer overflow flaw was discovered in the pg_getline function
  implementation. If the pg_getline or getline functions read large,
  untrusted records from a database, it could cause an application using
  these functions to crash or, possibly, execute arbitrary code.
  (CVE-2009-0663)
  
  Note: After installing this update, pg_getline may return more data than
  specified by its second argument, as this argument will be ignored. This is
  consistent with current upstream behavior. Previously, the length limit
  (the second argument) was not enforced, allowing a buffer overflow.
  
  A memory leak flaw was found in the function performing the de-quoting of
  BYTEA type values acquired from a database. An attacker able to cause an
  application using perl-DBD-Pg to perform a large number of SQL queries
  returning BYTEA records, could cause the application to use excessive
  amounts of memory or, possibly, crash. (CVE-2009-1341)
  
  All users of perl-DBD-Pg are advised to upgrade to this updated package,
  which contains backported patches to fix these issues. Applications using
  perl-DBD-Pg must be restarted for the update to take effect.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "perl-DBD-Pg on CentOS 5";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2009-May/015877.html");
  script_oid("1.3.6.1.4.1.25623.1.0.880763");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-08-09 08:20:34 +0200 (Tue, 09 Aug 2011)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_xref(name: "CESA", value: "2009:0479");
  script_cve_id("CVE-2009-0663", "CVE-2009-1341");
  script_name("CentOS Update for perl-DBD-Pg CESA-2009:0479 centos5 i386");

  script_tag(name:"summary", value:"Check for the Version of perl-DBD-Pg");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
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

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"perl-DBD-Pg", rpm:"perl-DBD-Pg~1.49~2.el5_3.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
