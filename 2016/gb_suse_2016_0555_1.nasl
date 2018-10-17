###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2016_0555_1.nasl 8047 2017-12-08 08:56:07Z santu $
#
# SuSE Update for postgresql94 SUSE-SU-2016:0555-1 (postgresql94)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.851217");
  script_version("$Revision: 8047 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-08 09:56:07 +0100 (Fri, 08 Dec 2017) $");
  script_tag(name:"creation_date", value:"2016-02-25 06:25:12 +0100 (Thu, 25 Feb 2016)");
  script_cve_id("CVE-2007-4772", "CVE-2016-0766", "CVE-2016-0773");
  script_tag(name:"cvss_base", value:"9.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for postgresql94 SUSE-SU-2016:0555-1 (postgresql94)");
  script_tag(name: "summary", value: "Check the version of postgresql94");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  This update for postgresql94 fixes the following issues:

  - Security and bugfix release 9.4.6:
  * *** IMPORTANT *** Users of version 9.4 will need to reindex any
  jsonb_path_ops indexes they have created, in order to fix a persistent
  issue with missing index entries.
  * Fix infinite loops and buffer-overrun problems in regular expressions
  (CVE-2016-0773, bsc#966436).
  * Fix regular-expression compiler to handle loops of constraint arcs
  (CVE-2007-4772).
  * Prevent certain PL/Java parameters from being set by non-superusers
  (CVE-2016-0766, bsc#966435).
  * Fix many issues in pg_dump with specific object types
  * Prevent over-eager pushdown of HAVING clauses for GROUPING SETS
  * Fix deparsing error with ON CONFLICT ... WHERE clauses
  * Fix tableoid errors for postgres_fdw
  * Prevent floating-point exceptions in pgbench
  * Make \det search Foreign Table names consistently
  * Fix quoting of domain constraint names in pg_dump
  * Prevent putting expanded objects into Const nodes
  * Allow compile of PL/Java on Windows
  * Fix 'unresolved symbol' errors in PL/Python execution
  * Allow Python2 and Python3 to be used in the same database
  * Add support for Python 3.5 in PL/Python
  * Fix issue with subdirectory creation during initdb
  * Make pg_ctl report status correctly on Windows
  * Suppress confusing error when using pg_receivexlog with older servers
  * Multiple documentation corrections and additions
  * Fix erroneous hash calculations in gin_extract_jsonb_path()
  - For the full release notse, see:
    http://www.postgresql.org/docs/9.4/static/release-9-4-6.html

  - PL/Perl still needs to be linked with rpath, so that it can find
  libperl.so at runtime. bsc#578053, postgresql-plperl-keep-rpath.patch");
  script_tag(name: "affected", value: "postgresql94 on SUSE Linux Enterprise Server 12, SUSE Linux Enterprise Desktop 12");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "SUSE-SU", value: "2016:0555_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "SLED12.0SP0")
{

  if ((res = isrpmvuln(pkg:"libecpg6", rpm:"libecpg6~9.4.6~7.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libecpg6-debuginfo", rpm:"libecpg6-debuginfo~9.4.6~7.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpq5-32bit", rpm:"libpq5-32bit~9.4.6~7.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpq5", rpm:"libpq5~9.4.6~7.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpq5-debuginfo-32bit", rpm:"libpq5-debuginfo-32bit~9.4.6~7.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpq5-debuginfo", rpm:"libpq5-debuginfo~9.4.6~7.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql94", rpm:"postgresql94~9.4.6~7.2", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql94-debuginfo", rpm:"postgresql94-debuginfo~9.4.6~7.2", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql94-debugsource", rpm:"postgresql94-debugsource~9.4.6~7.2", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql94-libs-debugsource", rpm:"postgresql94-libs-debugsource~9.4.6~7.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "SLES12.0SP0")
{

  if ((res = isrpmvuln(pkg:"libecpg6", rpm:"libecpg6~9.4.6~7.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libecpg6-debuginfo", rpm:"libecpg6-debuginfo~9.4.6~7.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpq5", rpm:"libpq5~9.4.6~7.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpq5-debuginfo", rpm:"libpq5-debuginfo~9.4.6~7.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql94", rpm:"postgresql94~9.4.6~7.2", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql94-contrib", rpm:"postgresql94-contrib~9.4.6~7.2", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql94-contrib-debuginfo", rpm:"postgresql94-contrib-debuginfo~9.4.6~7.2", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql94-debuginfo", rpm:"postgresql94-debuginfo~9.4.6~7.2", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql94-debugsource", rpm:"postgresql94-debugsource~9.4.6~7.2", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql94-libs-debugsource", rpm:"postgresql94-libs-debugsource~9.4.6~7.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql94-server", rpm:"postgresql94-server~9.4.6~7.2", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql94-server-debuginfo", rpm:"postgresql94-server-debuginfo~9.4.6~7.2", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpq5-32bit", rpm:"libpq5-32bit~9.4.6~7.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpq5-debuginfo-32bit", rpm:"libpq5-debuginfo-32bit~9.4.6~7.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"postgresql94-docs", rpm:"postgresql94-docs~9.4.6~7.2", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
