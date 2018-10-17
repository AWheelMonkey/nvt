###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2015_0807_1.nasl 8046 2017-12-08 08:48:56Z santu $
#
# SuSE Update for DirectFB openSUSE-SU-2015:0807-1 (DirectFB)
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
  script_oid("1.3.6.1.4.1.25623.1.0.850651");
  script_version("$Revision: 8046 $");
  script_cve_id("CVE-2014-2977", "CVE-2014-2978");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-12-08 09:48:56 +0100 (Fri, 08 Dec 2017) $");
  script_tag(name:"creation_date", value:"2015-05-01 05:48:51 +0200 (Fri, 01 May 2015)");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for DirectFB openSUSE-SU-2015:0807-1 (DirectFB)");
  script_tag(name: "summary", value: "Check the version of DirectFB");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  DirectFB was updated to fix two security issues.

  The following vulnerabilities were fixed:

  * CVE-2014-2977: Multiple integer signedness errors could allow remote
  attackers to cause a denial of service (crash) and possibly execute
  arbitrary code via the Voodoo interface, which triggers a stack-based
  buffer overflow.
  * CVE-2014-2978: Remote attackers could cause a denial of service (crash)
  and possibly execute arbitrary code via the Voodoo interface, which
  triggers an out-of-bounds write.");
  script_tag(name: "affected", value: "DirectFB on openSUSE 13.1");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "openSUSE-SU", value: "2015:0807_1");
  script_tag(name:"solution_type", value:"VendorFix");
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

if(release == "openSUSE13.1")
{

  if ((res = isrpmvuln(pkg:"DirectFB", rpm:"DirectFB~1.6.3~4.3.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"DirectFB-Mesa", rpm:"DirectFB-Mesa~1.6.3~4.3.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"DirectFB-Mesa-debuginfo", rpm:"DirectFB-Mesa-debuginfo~1.6.3~4.3.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"DirectFB-debuginfo", rpm:"DirectFB-debuginfo~1.6.3~4.3.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"DirectFB-debugsource", rpm:"DirectFB-debugsource~1.6.3~4.3.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"DirectFB-devel", rpm:"DirectFB-devel~1.6.3~4.3.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"DirectFB-doc", rpm:"DirectFB-doc~1.6.3~4.3.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"DirectFB-libSDL", rpm:"DirectFB-libSDL~1.6.3~4.3.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"DirectFB-libSDL-debuginfo", rpm:"DirectFB-libSDL-debuginfo~1.6.3~4.3.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"DirectFB-libvncclient", rpm:"DirectFB-libvncclient~1.6.3~4.3.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"DirectFB-libvncclient-debuginfo", rpm:"DirectFB-libvncclient-debuginfo~1.6.3~4.3.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libdirectfb-1_6-0", rpm:"libdirectfb-1_6-0~1.6.3~4.3.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libdirectfb-1_6-0-debuginfo", rpm:"libdirectfb-1_6-0-debuginfo~1.6.3~4.3.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"DirectFB-devel-32bit", rpm:"DirectFB-devel-32bit~1.6.3~4.3.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libdirectfb-1_6-0-32bit", rpm:"libdirectfb-1_6-0-32bit~1.6.3~4.3.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libdirectfb-1_6-0-debuginfo-32bit", rpm:"libdirectfb-1_6-0-debuginfo-32bit~1.6.3~4.3.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
