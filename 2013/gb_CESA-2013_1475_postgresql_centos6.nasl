###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for postgresql CESA-2013:1475 centos6 
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.881815");
  script_version("$Revision: 9372 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:56:37 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-11-08 10:43:21 +0530 (Fri, 08 Nov 2013)");
  script_cve_id("CVE-2013-0255", "CVE-2013-1900");
  script_tag(name:"cvss_base", value:"8.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:C/I:C/A:C");
  script_name("CentOS Update for postgresql CESA-2013:1475 centos6 ");

  tag_insight = "PostgreSQL is an advanced object-relational database management system
(DBMS).

An array index error, leading to a heap-based out-of-bounds buffer read
flaw, was found in the way PostgreSQL performed certain error processing
using enumeration types. An unprivileged database user could issue a
specially crafted SQL query that, when processed by the server component of
the PostgreSQL service, would lead to a denial of service (daemon crash) or
disclosure of certain portions of server memory. (CVE-2013-0255)

A flaw was found in the way the pgcrypto contrib module of PostgreSQL
(re)initialized its internal random number generator. This could lead to
random numbers with less bits of entropy being used by certain pgcrypto
functions, possibly allowing an attacker to conduct other attacks.
(CVE-2013-1900)

Red Hat would like to thank the PostgreSQL project for reporting these
issues. Upstream acknowledges Sumit Soni via Secunia SVCRP as the original
reporter of CVE-2013-0255, and Marko Kreen as the original reporter of
CVE-2013-1900.

These updated packages upgrade PostgreSQL to version 8.4.18, which fixes
these issues as well as several non-security issues. Refer to the
PostgreSQL Release Notes for a full list of changes:

After installing this update, it is advisable to rebuild, using the REINDEX
command, Generalized Search Tree (GiST) indexes that meet one or more of
the following conditions:

- - GiST indexes on box, polygon, circle, or point columns

- - GiST indexes for variable-width data types, that is text, bytea, bit, and
numeric

- - GiST multi-column indexes

All PostgreSQL users are advised to upgrade to these updated packages,
which contain backported patches to correct these issues. If the postgresql
service is running, it will be automatically restarted after installing
this update.
";

  tag_affected = "postgresql on CentOS 6";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "CESA", value: "2013:1475");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2013-October/019997.html");
  script_tag(name:"summary", value:"Check for the Version of postgresql");
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

  if ((res = isrpmvuln(pkg:"postgresql", rpm:"postgresql~8.4.18~1.el6_4", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql-contrib", rpm:"postgresql-contrib~8.4.18~1.el6_4", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql-devel", rpm:"postgresql-devel~8.4.18~1.el6_4", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql-docs", rpm:"postgresql-docs~8.4.18~1.el6_4", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql-libs", rpm:"postgresql-libs~8.4.18~1.el6_4", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql-plperl", rpm:"postgresql-plperl~8.4.18~1.el6_4", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql-plpython", rpm:"postgresql-plpython~8.4.18~1.el6_4", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql-pltcl", rpm:"postgresql-pltcl~8.4.18~1.el6_4", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql-server", rpm:"postgresql-server~8.4.18~1.el6_4", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql-test", rpm:"postgresql-test~8.4.18~1.el6_4", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
