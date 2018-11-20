###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for freetype RHSA-2012:0467-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_xref(name:"URL" , value:"https://www.redhat.com/archives/rhsa-announce/2012-April/msg00004.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870583");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_version("$Revision: 12382 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:51:56 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2012-04-11 10:59:26 +0530 (Wed, 11 Apr 2012)");
  script_cve_id("CVE-2012-1126", "CVE-2012-1127", "CVE-2012-1130", "CVE-2012-1131",
                "CVE-2012-1132", "CVE-2012-1134", "CVE-2012-1136", "CVE-2012-1137",
                "CVE-2012-1139", "CVE-2012-1140", "CVE-2012-1141", "CVE-2012-1142",
                "CVE-2012-1143", "CVE-2012-1144");
  script_xref(name:"RHSA", value:"2012:0467-01");
  script_name("RedHat Update for freetype RHSA-2012:0467-01");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'freetype'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_5");
  script_tag(name:"affected", value:"freetype on Red Hat Enterprise Linux (v. 5 server)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"FreeType is a free, high-quality, portable font engine that can open and
  manage font files. It also loads, hints, and renders individual glyphs
  efficiently.

  Multiple flaws were found in the way FreeType handled TrueType Font (TTF),
  Glyph Bitmap Distribution Format (BDF), Windows .fnt and .fon, and
  PostScript Type 1 fonts. If a specially-crafted font file was loaded by an
  application linked against FreeType, it could cause the application to
  crash or, potentially, execute arbitrary code with the privileges of the
  user running the application. (CVE-2012-1134, CVE-2012-1136, CVE-2012-1142,
  CVE-2012-1144)

  Multiple flaws were found in the way FreeType handled fonts in various
  formats. If a specially-crafted font file was loaded by an application
  linked against FreeType, it could cause the application to crash.
  (CVE-2012-1126, CVE-2012-1127, CVE-2012-1130, CVE-2012-1131, CVE-2012-1132,
  CVE-2012-1137, CVE-2012-1139, CVE-2012-1140, CVE-2012-1141, CVE-2012-1143)

  Red Hat would like to thank Mateusz Jurczyk of the Google Security Team for
  reporting these issues.

  Users are advised to upgrade to these updated packages, which contain a
  backported patch to correct these issues. The X server must be restarted
  (log out, then log back in) for this update to take effect.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_5")
{

  if ((res = isrpmvuln(pkg:"freetype", rpm:"freetype~2.2.1~31.el5_8.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"freetype-debuginfo", rpm:"freetype-debuginfo~2.2.1~31.el5_8.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"freetype-demos", rpm:"freetype-demos~2.2.1~31.el5_8.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"freetype-devel", rpm:"freetype-devel~2.2.1~31.el5_8.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
