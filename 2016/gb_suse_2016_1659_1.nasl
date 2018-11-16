###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2016_1659_1.nasl 12291 2018-11-09 14:55:44Z cfischer $
#
# SuSE Update for obs-service-source_validator openSUSE-SU-2016:1659-1 (obs-service-source_validator)
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
  script_oid("1.3.6.1.4.1.25623.1.0.851352");
  script_version("$Revision: 12291 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-09 15:55:44 +0100 (Fri, 09 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-06-23 05:24:32 +0200 (Thu, 23 Jun 2016)");
  script_cve_id("CVE-2016-4007");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for obs-service-source_validator openSUSE-SU-2016:1659-1 (obs-service-source_validator)");
  script_tag(name:"summary", value:"Check the version of obs-service-source_validator");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"obs-service-source_validator was updated to fix one security issue.

  This security issue was fixed:

  - CVE-2016-4007: Several maintained source services are vulnerable to
  code/parameter injection (bsc#967265).

  This non-security issue was fixed:

  - bsc#967610: Several occurrences of uninitialized value.");
  script_tag(name:"affected", value:"obs-service-source_validator on openSUSE 13.2");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"openSUSE-SU", value:"2016:1659_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSE13\.2");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);
res = "";

if(release == "openSUSE13.2")
{

  if ((res = isrpmvuln(pkg:"obs-service-source_validator", rpm:"obs-service-source_validator~0.6+git20160531.fbfe336~9.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
