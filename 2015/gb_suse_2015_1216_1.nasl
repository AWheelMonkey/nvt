###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2015_1216_1.nasl 12381 2018-11-16 11:16:30Z cfischer $
#
# SuSE Update for MariaDB openSUSE-SU-2015:1216-1 (MariaDB)
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
  script_oid("1.3.6.1.4.1.25623.1.0.850663");
  script_version("$Revision: 12381 $");
  script_cve_id("CVE-2014-6464", "CVE-2014-6469", "CVE-2014-6491", "CVE-2014-6494",
                "CVE-2014-6496", "CVE-2014-6500", "CVE-2014-6507", "CVE-2014-6555",
                "CVE-2014-6559", "CVE-2014-6568", "CVE-2014-8964", "CVE-2015-0374",
                "CVE-2015-0381", "CVE-2015-0382", "CVE-2015-0411", "CVE-2015-0432",
                "CVE-2015-0433", "CVE-2015-0441", "CVE-2015-0499", "CVE-2015-0501",
                "CVE-2015-0505", "CVE-2015-2325", "CVE-2015-2326", "CVE-2015-2568",
                "CVE-2015-2571", "CVE-2015-2573", "CVE-2015-3152", "CVE-2015-4000");
  script_tag(name:"cvss_base", value:"8.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2015-07-10 06:06:08 +0200 (Fri, 10 Jul 2015)");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for MariaDB openSUSE-SU-2015:1216-1 (MariaDB)");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'MariaDB'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"MariaDB was updated to its current minor version,
  fixing bugs and security issues.

  These updates include a fix for Logjam (CVE-2015-4000), making MariaDB
  work with client software that no longer allows short DH groups over SSL,
  as e.g.
  our current openssl packages.

  On openSUSE 13.1, MariaDB was updated to 5.5.44.

  On openSUSE 13.2, MariaDB was updated from 10.0.13 to 10.0.20.

  Please read the release notes of MariaDB
  <a  rel='nofollow' href='https://mariadb.com/kb/en/mariadb/mariadb-10020-release-notes/'>https://mariadb.com/kb/en/mariadb/mariadb-10020-release-notes/
  <a  rel='nofollow' href='https://mariadb.com/kb/en/mariadb/mariadb-10019-release-notes/'>https://mariadb.com/kb/en/mariadb/mariadb-10019-release-notes/
  <a  rel='nofollow' href='https://mariadb.com/kb/en/mariadb/mariadb-10018-release-notes/'>https://mariadb.com/kb/en/mariadb/mariadb-10018-release-notes/
  <a  rel='nofollow' href='https://mariadb.com/kb/en/mariadb/mariadb-10017-release-notes/'>https://mariadb.com/kb/en/mariadb/mariadb-10017-release-notes/
  <a  rel='nofollow' href='https://mariadb.com/kb/en/mariadb/mariadb-10016-release-notes/'>https://mariadb.com/kb/en/mariadb/mariadb-10016-release-notes/
  <a  rel='nofollow' href='https://mariadb.com/kb/en/mariadb/mariadb-10015-release-notes/'>https://mariadb.com/kb/en/mariadb/mariadb-10015-release-notes/
  <a  rel='nofollow' href='https://mariadb.com/kb/en/mariadb/mariadb-10014-release-notes/'>https://mariadb.com/kb/en/mariadb/mariadb-10014-release-notes/ for more
  information.");
  script_tag(name:"affected", value:"MariaDB on openSUSE 13.1");
  script_tag(name:"solution", value:"Please install the updated packages.");
  script_xref(name:"openSUSE-SU", value:"2015:1216_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSE13\.1");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);
res = "";

if(release == "openSUSE13.1")
{

  if ((res = isrpmvuln(pkg:"libmysqlclient-devel", rpm:"libmysqlclient-devel~5.5.44~4.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libmysqlclient18", rpm:"libmysqlclient18~5.5.44~4.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libmysqlclient18-debuginfo", rpm:"libmysqlclient18-debuginfo~5.5.44~4.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libmysqlclient_r18", rpm:"libmysqlclient_r18~5.5.44~4.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libmysqld-devel", rpm:"libmysqld-devel~5.5.44~4.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libmysqld18", rpm:"libmysqld18~5.5.44~4.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libmysqld18-debuginfo", rpm:"libmysqld18-debuginfo~5.5.44~4.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mariadb", rpm:"mariadb~5.5.44~4.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mariadb-bench", rpm:"mariadb-bench~5.5.44~4.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mariadb-bench-debuginfo", rpm:"mariadb-bench-debuginfo~5.5.44~4.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mariadb-client", rpm:"mariadb-client~5.5.44~4.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mariadb-client-debuginfo", rpm:"mariadb-client-debuginfo~5.5.44~4.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mariadb-debuginfo", rpm:"mariadb-debuginfo~5.5.44~4.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mariadb-debugsource", rpm:"mariadb-debugsource~5.5.44~4.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mariadb-errormessages", rpm:"mariadb-errormessages~5.5.44~4.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mariadb-test", rpm:"mariadb-test~5.5.44~4.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mariadb-test-debuginfo", rpm:"mariadb-test-debuginfo~5.5.44~4.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mariadb-tools", rpm:"mariadb-tools~5.5.44~4.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mariadb-tools-debuginfo", rpm:"mariadb-tools-debuginfo~5.5.44~4.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libmysqlclient18-32bit", rpm:"libmysqlclient18-32bit~5.5.44~4.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libmysqlclient18-debuginfo-32bit", rpm:"libmysqlclient18-debuginfo-32bit~5.5.44~4.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libmysqlclient_r18-32bit", rpm:"libmysqlclient_r18-32bit~5.5.44~4.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
