###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2018_3107_1.nasl 12381 2018-11-16 11:16:30Z cfischer $
#
# SuSE Update for libxml2 openSUSE-SU-2018:3107-1 (libxml2)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.851931");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-10-13 06:53:40 +0200 (Sat, 13 Oct 2018)");
  script_cve_id("CVE-2017-18258", "CVE-2018-14404", "CVE-2018-14567", "CVE-2018-9251");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for libxml2 openSUSE-SU-2018:3107-1 (libxml2)");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'libxml2'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"This update for libxml2 fixes the following security issues:

  - CVE-2018-9251: The xz_decomp function allowed remote attackers to cause
  a denial of service (infinite loop) via a crafted XML file that triggers
  LZMA_MEMLIMIT_ERROR, as demonstrated by xmllint (bsc#1088279).

  - CVE-2018-14567: Prevent denial of service (infinite loop) via a crafted
  XML file that triggers LZMA_MEMLIMIT_ERROR, as demonstrated by xmllint
  (bsc#1105166).

  - CVE-2018-14404: Prevent NULL pointer dereference in the
  xmlXPathCompOpEval() function when parsing an invalid XPath expression
  in the XPATH_OP_AND or XPATH_OP_OR case leading to a denial of service
  attack (bsc#1102046).

  - CVE-2017-18258: The xz_head function allowed remote attackers to cause a
  denial of service (memory consumption) via a crafted LZMA file, because
  the decoder functionality did not restrict memory usage to what is
  required for a legitimate file (bsc#1088601).

  This update was imported from the SUSE:SLE-12-SP2:Update update project.


  Patch Instructions:

  To install this openSUSE Security Update use the SUSE recommended
  installation methods
  like YaST online_update or 'zypper patch'.

  Alternatively you can run the command listed for your product:

  - openSUSE Leap 42.3:

  zypper in -t patch openSUSE-2018-1149=1");
  script_tag(name:"affected", value:"libxml2 on openSUSE Leap 42.3");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"openSUSE-SU", value:"2018:3107_1");
  script_xref(name:"URL" , value:"http://lists.opensuse.org/opensuse-security-announce/2018-10/msg00026.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSELeap42\.3");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);
res = "";

if(release == "openSUSELeap42.3")
{

  if ((res = isrpmvuln(pkg:"libxml2-2", rpm:"libxml2-2~2.9.4~18.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxml2-2-debuginfo", rpm:"libxml2-2-debuginfo~2.9.4~18.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxml2-debugsource", rpm:"libxml2-debugsource~2.9.4~18.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxml2-devel", rpm:"libxml2-devel~2.9.4~18.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxml2-tools", rpm:"libxml2-tools~2.9.4~18.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxml2-tools-debuginfo", rpm:"libxml2-tools-debuginfo~2.9.4~18.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"python-libxml2", rpm:"python-libxml2~2.9.4~18.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"python-libxml2-debuginfo", rpm:"python-libxml2-debuginfo~2.9.4~18.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"python-libxml2-debugsource", rpm:"python-libxml2-debugsource~2.9.4~18.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxml2-2-32bit", rpm:"libxml2-2-32bit~2.9.4~18.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxml2-2-debuginfo-32bit", rpm:"libxml2-2-debuginfo-32bit~2.9.4~18.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxml2-devel-32bit", rpm:"libxml2-devel-32bit~2.9.4~18.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxml2-doc", rpm:"libxml2-doc~2.9.4~18.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
