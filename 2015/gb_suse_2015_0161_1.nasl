###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2015_0161_1.nasl 12284 2018-11-09 12:37:21Z cfischer $
#
# SuSE Update for libpng16 openSUSE-SU-2015:0161-1 (libpng16)
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
  script_oid("1.3.6.1.4.1.25623.1.0.850631");
  script_version("$Revision: 12284 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-09 13:37:21 +0100 (Fri, 09 Nov 2018) $");
  script_tag(name:"creation_date", value:"2015-01-29 05:13:05 +0100 (Thu, 29 Jan 2015)");
  script_cve_id("CVE-2014-9495", "CVE-2015-0973");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("SuSE Update for libpng16 openSUSE-SU-2015:0161-1 (libpng16)");
  script_tag(name:"summary", value:"Check the version of libpng16");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"libpng was updated to fix some security issues:

  * CVE-2014-9495 [bnc#912076]: Heap-buffer overflow png_combine_row() with
  very wide interlaced images

  * CVE-2015-0973 [bnc#912929]: overflow in png_read_IDAT_data

  libpng is now also build with -DPNG_SAFE_LIMITS_SUPPORTED.");
  script_tag(name:"affected", value:"libpng16 on openSUSE 13.1");
  script_tag(name:"solution", value:"Please install the updated packages.");
  script_xref(name:"openSUSE-SU", value:"2015:0161_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");
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

  if ((res = isrpmvuln(pkg:"libpng16-16", rpm:"libpng16-16~1.6.6~16.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpng16-16-debuginfo", rpm:"libpng16-16-debuginfo~1.6.6~16.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpng16-compat-devel", rpm:"libpng16-compat-devel~1.6.6~16.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpng16-debugsource", rpm:"libpng16-debugsource~1.6.6~16.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpng16-devel", rpm:"libpng16-devel~1.6.6~16.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpng16-tools", rpm:"libpng16-tools~1.6.6~16.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpng16-tools-debuginfo", rpm:"libpng16-tools-debuginfo~1.6.6~16.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpng16-16-32bit", rpm:"libpng16-16-32bit~1.6.6~16.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpng16-16-debuginfo-32bit", rpm:"libpng16-16-debuginfo-32bit~1.6.6~16.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpng16-compat-devel-32bit", rpm:"libpng16-compat-devel-32bit~1.6.6~16.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpng16-devel-32bit", rpm:"libpng16-devel-32bit~1.6.6~16.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
