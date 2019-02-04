###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2018_2488_1.nasl 12497 2018-11-23 08:28:21Z cfischer $
#
# SuSE Update for python-Django openSUSE-SU-2018:2488-1 (python-Django)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
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
  script_oid("1.3.6.1.4.1.25623.1.0.852077");
  script_version("$Revision: 12497 $");
  script_cve_id("CVE-2018-14574");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-11-23 09:28:21 +0100 (Fri, 23 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-10-26 06:42:09 +0200 (Fri, 26 Oct 2018)");
  script_name("SuSE Update for python-Django openSUSE-SU-2018:2488-1 (python-Django)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSELeap15\.0");

  script_xref(name:"openSUSE-SU", value:"2018:2488_1");
  script_xref(name:"URL", value:"http://lists.opensuse.org/opensuse-security-announce/2018-08/msg00073.html");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'python-Django'
  package(s) announced via the openSUSE-SU-2018:2488_1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"This update for python-Django to version 2.08 fixes the following issues:

  The following security vulnerability was fixed:

  - CVE-2018-14574: Fixed an redirection vulnerability in CommonMiddleware
  (boo#1102680)

  The following other bugs were fixed:

  - Fixed a regression in Django 2.0.7 that broke the regex lookup on MariaDB

  - Fixed a regression where django.template.Template crashed if the
  template_string argument is lazy

  - Fixed __regex and __iregex lookups with MySQL

  - Fixed admin check crash when using a query expression in
  ModelAdmin.ordering

  - Fixed admin changelist crash when using a query expression without asc()
  or desc() in the page's ordering

  - Fixed a regression that broke custom template filters that use decorators

  - Fixed detection of custom URL converters in included pattern

  - Fixed a regression that added an unnecessary subquery to the GROUP BY
  clause
  on MySQL when using a RawSQL annotation

  - Fixed WKBWriter.write() and write_hex() for empty polygons on GEOS 3.6.1+

  - Fixed a regression in Django 1.10 that could result in large memory
  usage when making edits using ModelAdmin.list_editable

  - Corrected the import paths that inspectdb generates for
  django.contrib.postgres fields

  - Fixed crashes in django.contrib.admindocs when a view is a callable
  object, such as django.contrib.syndication.views.Feed

  - Fixed a regression in Django 1.11.12 where QuerySet.values() or
  values_list() after combining an annotated and unannotated queryset with
  union(), difference(), or intersection() crashed due to mismatching
  columns


  Patch Instructions:

  To install this openSUSE Security Update use the SUSE recommended
  installation methods
  like YaST online_update or 'zypper patch'.

  Alternatively you can run the command listed for your product:

  - openSUSE Leap 15.0:

  zypper in -t patch openSUSE-2018-914=1");

  script_tag(name:"affected", value:"python-Django on openSUSE Leap 15.0.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "openSUSELeap15.0")
{

  if ((res = isrpmvuln(pkg:"python3-Django", rpm:"python3-Django~2.0.8~lp150.2.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
