###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for pango CESA-2010:0140 centos5 i386
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

include("revisions-lib.inc");
tag_insight = "Pango is a library used for the layout and rendering of internationalized
  text.

  An input sanitization flaw, leading to an array index error, was found in
  the way the Pango font rendering library synthesized the Glyph Definition
  (GDEF) table from a font's character map and the Unicode property database.
  If an attacker created a specially-crafted font file and tricked a local,
  unsuspecting user into loading the font file in an application that uses
  the Pango font rendering library, it could cause that application to crash.
  (CVE-2010-0421)
  
  Users of pango and evolution28-pango are advised to upgrade to these
  updated packages, which contain a backported patch to resolve this issue.
  After installing this update, you must restart your system or restart your
  X session for this update to take effect.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "pango on CentOS 5";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2010-March/016560.html");
  script_oid("1.3.6.1.4.1.25623.1.0.880607");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-08-09 08:20:34 +0200 (Tue, 09 Aug 2011)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_xref(name: "CESA", value: "2010:0140");
  script_cve_id("CVE-2010-0421");
  script_name("CentOS Update for pango CESA-2010:0140 centos5 i386");

  script_tag(name:"summary", value:"Check for the Version of pango");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");


res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"pango", rpm:"pango~1.14.9~8.el5.centos", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pango-devel", rpm:"pango-devel~1.14.9~8.el5.centos", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
