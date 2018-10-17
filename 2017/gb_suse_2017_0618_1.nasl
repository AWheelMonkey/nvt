###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2017_0618_1.nasl 8048 2017-12-08 09:05:48Z santu $
#
# SuSE Update for mysql-community-server openSUSE-SU-2017:0618-1 (mysql-community-server)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.851520");
  script_version("$Revision: 8048 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-08 10:05:48 +0100 (Fri, 08 Dec 2017) $");
  script_tag(name:"creation_date", value:"2017-03-07 05:44:29 +0100 (Tue, 07 Mar 2017)");
  script_cve_id("CVE-2016-8318", "CVE-2016-8327", "CVE-2017-3238", "CVE-2017-3244", 
                "CVE-2017-3257", "CVE-2017-3258", "CVE-2017-3265", "CVE-2017-3273", 
                "CVE-2017-3291", "CVE-2017-3312", "CVE-2017-3313", "CVE-2017-3317", 
                "CVE-2017-3318");
  script_tag(name:"cvss_base", value:"4.9");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:P/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for mysql-community-server openSUSE-SU-2017:0618-1 (mysql-community-server)");
  script_tag(name: "summary", value: "Check the version of mysql-community-server");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  mysql-community-server was updated to version 5.6.35 to fix bugs and
  security issues:

  * Changes 'http://dev.mysql.com/doc/relnotes/mysql/5.6/en/news-5-6-35.html'
  * Fixed CVEs: CVE-2016-8318 [boo#1020872], CVE-2017-3312 [boo#1020873],
  CVE-2017-3258 [boo#1020875], CVE-2017-3273 [boo#1020876], CVE-2017-3244
  [boo#1020877], CVE-2017-3257 [boo#1020878], CVE-2017-3238 [boo#1020882],
  CVE-2017-3291 [boo#1020884], CVE-2017-3265 [boo#1020885], CVE-2017-3313
  [boo#1020890], CVE-2016-8327 [boo#1020893], CVE-2017-3317 [boo#1020894],
  CVE-2017-3318 [boo#1020896]");
  script_tag(name: "affected", value: "mysql-community-server on openSUSE Leap 42.2");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "openSUSE-SU", value: "2017:0618_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
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

if(release == "openSUSELeap42.2")
{

  if ((res = isrpmvuln(pkg:"libmysql56client18", rpm:"libmysql56client18~5.6.35~22.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libmysql56client18-debuginfo", rpm:"libmysql56client18-debuginfo~5.6.35~22.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libmysql56client_r18", rpm:"libmysql56client_r18~5.6.35~22.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mysql-community-server", rpm:"mysql-community-server~5.6.35~22.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mysql-community-server-bench", rpm:"mysql-community-server-bench~5.6.35~22.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mysql-community-server-bench-debuginfo", rpm:"mysql-community-server-bench-debuginfo~5.6.35~22.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mysql-community-server-client", rpm:"mysql-community-server-client~5.6.35~22.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mysql-community-server-client-debuginfo", rpm:"mysql-community-server-client-debuginfo~5.6.35~22.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mysql-community-server-debuginfo", rpm:"mysql-community-server-debuginfo~5.6.35~22.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mysql-community-server-debugsource", rpm:"mysql-community-server-debugsource~5.6.35~22.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mysql-community-server-errormessages", rpm:"mysql-community-server-errormessages~5.6.35~22.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mysql-community-server-test", rpm:"mysql-community-server-test~5.6.35~22.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mysql-community-server-test-debuginfo", rpm:"mysql-community-server-test-debuginfo~5.6.35~22.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mysql-community-server-tools", rpm:"mysql-community-server-tools~5.6.35~22.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mysql-community-server-tools-debuginfo", rpm:"mysql-community-server-tools-debuginfo~5.6.35~22.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libmysql56client18-32bit", rpm:"libmysql56client18-32bit~5.6.35~22.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libmysql56client18-debuginfo-32bit", rpm:"libmysql56client18-debuginfo-32bit~5.6.35~22.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libmysql56client_r18-32bit", rpm:"libmysql56client_r18-32bit~5.6.35~22.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
