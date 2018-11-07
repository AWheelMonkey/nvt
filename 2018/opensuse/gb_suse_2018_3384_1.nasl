###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2018_3384_1.nasl 12067 2018-10-25 07:10:45Z santu $
#
# SuSE Update for apache-pdfbox openSUSE-SU-2018:3384-1 (apache-pdfbox)
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
  script_oid("1.3.6.1.4.1.25623.1.0.851946");
  script_version("$Revision: 12067 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-25 09:10:45 +0200 (Thu, 25 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-10-25 06:00:25 +0200 (Thu, 25 Oct 2018)");
  script_cve_id("CVE-2018-11797", "CVE-2018-8036");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for apache-pdfbox openSUSE-SU-2018:3384-1 (apache-pdfbox)");
  script_tag(name:"summary", value:"Check the version of apache-pdfbox");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"
  This update for apache-pdfbox fixes the following security issue:

  - CVE-2018-8036: A crafted file could have triggered an infinite loop
  which lead to DoS (bsc#1099721).
  - CVE-2018-11797: A carefully crafted PDF file can trigger an extremely
  long running computation when parsing the page tree. (bsc#1111009):

  This update was imported from the SUSE:SLE-12-SP3:Update update project.


  Patch Instructions:

  To install this openSUSE Security Update use the SUSE recommended
  installation methods
  like YaST online_update or 'zypper patch'.

  Alternatively you can run the command listed for your product:

  - openSUSE Leap 42.3:

  zypper in -t patch openSUSE-2018-1245=1");
  script_tag(name:"affected", value:"apache-pdfbox on openSUSE Leap 42.3");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"openSUSE-SU", value:"2018:3384_1");
  script_xref(name:"URL" , value:"http://lists.opensuse.org/opensuse-security-announce/2018-10/msg00061.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
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

if(release == "openSUSELeap42.3")
{

  if ((res = isrpmvuln(pkg:"apache-pdfbox", rpm:"apache-pdfbox~1.8.12~4.3.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"apache-pdfbox-javadoc", rpm:"apache-pdfbox-javadoc~1.8.12~4.3.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}