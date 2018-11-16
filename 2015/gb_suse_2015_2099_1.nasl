###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2015_2099_1.nasl 12284 2018-11-09 12:37:21Z cfischer $
#
# SuSE Update for libpng12 openSUSE-SU-2015:2099-1 (libpng12)
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
  script_oid("1.3.6.1.4.1.25623.1.0.851136");
  script_version("$Revision: 12284 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-09 13:37:21 +0100 (Fri, 09 Nov 2018) $");
  script_tag(name:"creation_date", value:"2015-12-29 17:30:29 +0530 (Tue, 29 Dec 2015)");
  script_cve_id("CVE-2015-7981", "CVE-2015-8126");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for libpng12 openSUSE-SU-2015:2099-1 (libpng12)");
  script_tag(name:"summary", value:"Check the version of libpng12");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"The libpng12 package was updated to fix the following security issues:

  - CVE-2015-8126: Fixed a buffer overflow vulnerabilities in
  png_get_PLTE/png_set_PLTE functions (bsc#954980).

  - CVE-2015-7981: Fixed an out-of-bound read (bsc#952051).");
  script_tag(name:"affected", value:"libpng12 on openSUSE 13.2, openSUSE 13.1");
  script_tag(name:"solution", value:"Please install the updated packages.");
  script_xref(name:"openSUSE-SU", value:"2015:2099_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=(openSUSE13\.2|openSUSE13\.1)");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);
res = "";

if(release == "openSUSE13.2")
{

  if ((res = isrpmvuln(pkg:"libpng12-0", rpm:"libpng12-0~1.2.51~3.3.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpng12-0-debuginfo", rpm:"libpng12-0-debuginfo~1.2.51~3.3.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpng12-compat-devel", rpm:"libpng12-compat-devel~1.2.51~3.3.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpng12-debugsource", rpm:"libpng12-debugsource~1.2.51~3.3.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpng12-devel", rpm:"libpng12-devel~1.2.51~3.3.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpng12-0-32bit", rpm:"libpng12-0-32bit~1.2.51~3.3.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpng12-0-debuginfo-32bit", rpm:"libpng12-0-debuginfo-32bit~1.2.51~3.3.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpng12-compat-devel-32bit", rpm:"libpng12-compat-devel-32bit~1.2.51~3.3.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpng12-devel-32bit", rpm:"libpng12-devel-32bit~1.2.51~3.3.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "openSUSE13.1")
{

  if ((res = isrpmvuln(pkg:"libpng12-0", rpm:"libpng12-0~1.2.50~6.7.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpng12-0-debuginfo", rpm:"libpng12-0-debuginfo~1.2.50~6.7.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpng12-compat-devel", rpm:"libpng12-compat-devel~1.2.50~6.7.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpng12-debugsource", rpm:"libpng12-debugsource~1.2.50~6.7.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpng12-devel", rpm:"libpng12-devel~1.2.50~6.7.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpng12-0-32bit", rpm:"libpng12-0-32bit~1.2.50~6.7.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpng12-0-debuginfo-32bit", rpm:"libpng12-0-debuginfo-32bit~1.2.50~6.7.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpng12-compat-devel-32bit", rpm:"libpng12-compat-devel-32bit~1.2.50~6.7.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpng12-devel-32bit", rpm:"libpng12-devel-32bit~1.2.50~6.7.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
