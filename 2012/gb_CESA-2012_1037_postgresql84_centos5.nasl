###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for postgresql84 CESA-2012:1037 centos5 
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
tag_insight = "PostgreSQL is an advanced object-relational database management system
  (DBMS).

  A flaw was found in the way the crypt() password hashing function from the
  optional PostgreSQL pgcrypto contrib module performed password
  transformation when used with the DES algorithm. If the password string to
  be hashed contained the 0x80 byte value, the remainder of the string was
  ignored when calculating the hash, significantly reducing the password
  strength. This made brute-force guessing more efficient as the whole
  password was not required to gain access to protected resources.
  (CVE-2012-2143)
  
  Note: With this update, the rest of the string is properly included in the
  DES hash; therefore, any previously stored password values that are
  affected by this issue will no longer match. In such cases, it will be
  necessary for those stored password hashes to be updated.
  
  A denial of service flaw was found in the way the PostgreSQL server
  performed a user privileges check when applying SECURITY DEFINER or SET
  attributes to a procedural language's (such as PL/Perl or PL/Python) call
  handler function. A non-superuser database owner could use this flaw to
  cause the PostgreSQL server to crash due to infinite recursion.
  (CVE-2012-2655)
  
  Upstream acknowledges Rubin Xu and Joseph Bonneau as the original reporters
  of the CVE-2012-2143 issue.
  
  These updated packages upgrade PostgreSQL to version 8.4.12, which fixes
  these issues as well as several non-security issues. Refer to the
  PostgreSQL Release Notes for a full list of changes:
  
  <a  rel= &qt nofollow &qt  href= &qt http://www.postgresql.org/docs/8.4/static/release.html &qt >http://www.postgresql.org/docs/8.4/static/release.html</a>
  
  All PostgreSQL users are advised to upgrade to these updated packages,
  which correct these issues. If the postgresql service is running, it will
  be automatically restarted after installing this update.";

tag_affected = "postgresql84 on CentOS 5";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2012-June/018699.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881080");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-07-30 16:01:54 +0530 (Mon, 30 Jul 2012)");
  script_cve_id("CVE-2012-2143", "CVE-2012-2655");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_xref(name: "CESA", value: "2012:1037");
  script_name("CentOS Update for postgresql84 CESA-2012:1037 centos5 ");

  script_tag(name: "summary" , value: "Check for the Version of postgresql84");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
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

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"postgresql84", rpm:"postgresql84~8.4.12~1.el5_8", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql84-contrib", rpm:"postgresql84-contrib~8.4.12~1.el5_8", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql84-devel", rpm:"postgresql84-devel~8.4.12~1.el5_8", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql84-docs", rpm:"postgresql84-docs~8.4.12~1.el5_8", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql84-libs", rpm:"postgresql84-libs~8.4.12~1.el5_8", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql84-plperl", rpm:"postgresql84-plperl~8.4.12~1.el5_8", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql84-plpython", rpm:"postgresql84-plpython~8.4.12~1.el5_8", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql84-pltcl", rpm:"postgresql84-pltcl~8.4.12~1.el5_8", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql84-python", rpm:"postgresql84-python~8.4.12~1.el5_8", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql84-server", rpm:"postgresql84-server~8.4.12~1.el5_8", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql84-tcl", rpm:"postgresql84-tcl~8.4.12~1.el5_8", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql84-test", rpm:"postgresql84-test~8.4.12~1.el5_8", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
