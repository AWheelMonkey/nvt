###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for postgresql FEDORA-2012-8915
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
tag_insight = "PostgreSQL is an advanced Object-Relational database management system
  (DBMS) that supports almost all SQL constructs (including
  transactions, sub-selects and user-defined types and functions). The
  postgresql package includes the client programs and libraries that
  you'll need to access a PostgreSQL DBMS server.  These PostgreSQL
  client programs are programs that directly manipulate the internal
  structure of PostgreSQL databases on a PostgreSQL server. These client
  programs can be located on the same machine with the PostgreSQL
  server, or may be on a remote machine which accesses a PostgreSQL
  server over a network connection. This package contains the docs
  in HTML for the whole package, as well as command-line utilities for
  managing PostgreSQL databases on a PostgreSQL server.

  If you want to manipulate a PostgreSQL database on a local or remote PostgreSQL
  server, you need this package. You also need to install this package
  if you're installing the postgresql-server package.";

tag_affected = "postgresql on Fedora 15";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.fedoraproject.org/pipermail/package-announce/2012-June/082294.html");
  script_oid("1.3.6.1.4.1.25623.1.0.864463");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-06-19 09:37:48 +0530 (Tue, 19 Jun 2012)");
  script_cve_id("CVE-2012-2143", "CVE-2012-2655", "CVE-2012-0866", "CVE-2012-0867",
                "CVE-2012-0868");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_xref(name: "FEDORA", value: "2012-8915");
  script_name("Fedora Update for postgresql FEDORA-2012-8915");

  script_tag(name: "summary" , value: "Check for the Version of postgresql");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
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

  if ((res = isrpmvuln(pkg:"postgresql", rpm:"postgresql~9.0.8~1.fc15", rls:"FC15")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
