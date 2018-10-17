###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for roundcubemail FEDORA-2012-9329
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

include("revisions-lib.inc");
tag_affected = "roundcubemail on Fedora 15";
tag_insight = "RoundCube Webmail is a browser-based multilingual IMAP client
  with an application-like user interface. It provides full
  functionality you expect from an e-mail client, including MIME
  support, address book, folder manipulation, message searching
  and spell checking. RoundCube Webmail is written in PHP and
  requires the MySQL database or the PostgreSQL database. The user
  interface is fully skinnable using XHTML and CSS 2.";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.fedoraproject.org/pipermail/package-announce/2012-June/082630.html");
  script_oid("1.3.6.1.4.1.25623.1.0.864491");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-06-25 09:52:14 +0530 (Mon, 25 Jun 2012)");
  script_cve_id("CVE-2011-1491", "CVE-2011-1492", "CVE-2012-1253");
  script_tag(name:"cvss_base", value:"5.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:N");
  script_xref(name: "FEDORA", value: "2012-9329");
  script_name("Fedora Update for roundcubemail FEDORA-2012-9329");

  script_tag(name: "summary" , value: "Check for the Version of roundcubemail");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
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

if(release == "FC15")
{

  if ((res = isrpmvuln(pkg:"roundcubemail", rpm:"roundcubemail~0.7.2~2.fc15", rls:"FC15")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
