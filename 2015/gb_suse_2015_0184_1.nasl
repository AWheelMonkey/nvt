###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2015_0184_1.nasl 8046 2017-12-08 08:48:56Z santu $
#
# SuSE Update for glibc openSUSE-SU-2015:0184-1 (glibc)
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
  script_oid("1.3.6.1.4.1.25623.1.0.850633");
  script_version("$Revision: 8046 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-08 09:48:56 +0100 (Fri, 08 Dec 2017) $");
  script_tag(name:"creation_date", value:"2015-02-03 05:45:11 +0100 (Tue, 03 Feb 2015)");
  script_cve_id("CVE-2015-0235");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("SuSE Update for glibc openSUSE-SU-2015:0184-1 (glibc)");
  script_tag(name: "summary", value: "Check the version of glibc");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  This update for glibc fixes the following security issue:

  CVE-2015-0235: A vulnerability was found and fixed in the GNU C Library,
  specifically in the function gethostbyname(), that could lead to a local
  or remote buffer overflow. (bsc#913646)");
  script_tag(name: "affected", value: "glibc on openSUSE 12.3");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "openSUSE-SU", value: "2015:0184_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
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

if(release == "openSUSE12.3")
{

  if ((res = isrpmvuln(pkg:"glibc", rpm:"glibc~2.17~4.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-debuginfo", rpm:"glibc-debuginfo~2.17~4.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-debugsource", rpm:"glibc-debugsource~2.17~4.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-devel", rpm:"glibc-devel~2.17~4.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-devel-debuginfo", rpm:"glibc-devel-debuginfo~2.17~4.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-devel-static", rpm:"glibc-devel-static~2.17~4.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-extra", rpm:"glibc-extra~2.17~4.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-extra-debuginfo", rpm:"glibc-extra-debuginfo~2.17~4.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-locale", rpm:"glibc-locale~2.17~4.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-locale-debuginfo", rpm:"glibc-locale-debuginfo~2.17~4.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-profile", rpm:"glibc-profile~2.17~4.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-utils", rpm:"glibc-utils~2.17~4.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-utils-debuginfo", rpm:"glibc-utils-debuginfo~2.17~4.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-utils-debugsource", rpm:"glibc-utils-debugsource~2.17~4.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nscd", rpm:"nscd~2.17~4.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nscd-debuginfo", rpm:"nscd-debuginfo~2.17~4.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-utils-32bit", rpm:"glibc-utils-32bit~2.17~4.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-utils-debuginfo-32bit", rpm:"glibc-utils-debuginfo-32bit~2.17~4.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-html", rpm:"glibc-html~2.17~4.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-i18ndata", rpm:"glibc-i18ndata~2.17~4.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-info", rpm:"glibc-info~2.17~4.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-obsolete", rpm:"glibc-obsolete~2.17~4.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-obsolete-debuginfo", rpm:"glibc-obsolete-debuginfo~2.17~4.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}