###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for apr-util CESA-2009:1107 centos5 i386
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
tag_insight = "apr-util is a utility library used with the Apache Portable Runtime (APR).
  It aims to provide a free library of C data structures and routines. This
  library contains additional utility interfaces for APR; including support
  for XML, LDAP, database interfaces, URI parsing, and more.

  An off-by-one overflow flaw was found in the way apr-util processed a
  variable list of arguments. An attacker could provide a specially-crafted
  string as input for the formatted output conversion routine, which could,
  on big-endian platforms, potentially lead to the disclosure of sensitive
  information or a denial of service (application crash). (CVE-2009-1956)
  
  Note: The CVE-2009-1956 flaw only affects big-endian platforms, such as the
  IBM S/390 and PowerPC. It does not affect users using the apr-util package
  on little-endian platforms, due to their different organization of byte
  ordering used to represent particular data.
  
  A denial of service flaw was found in the apr-util Extensible Markup
  Language (XML) parser. A remote attacker could create a specially-crafted
  XML document that would cause excessive memory consumption when processed
  by the XML decoding engine. (CVE-2009-1955)
  
  A heap-based underwrite flaw was found in the way apr-util created compiled
  forms of particular search patterns. An attacker could formulate a
  specially-crafted search keyword, that would overwrite arbitrary heap
  memory locations when processed by the pattern preparation engine.
  (CVE-2009-0023)
  
  All apr-util users should upgrade to these updated packages, which contain
  backported patches to correct these issues. Applications using the Apache
  Portable Runtime library, such as httpd, must be restarted for this update
  to take effect.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "apr-util on CentOS 5";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2009-June/015983.html");
  script_oid("1.3.6.1.4.1.25623.1.0.880775");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-08-09 08:20:34 +0200 (Tue, 09 Aug 2011)");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_xref(name: "CESA", value: "2009:1107");
  script_cve_id("CVE-2009-0023", "CVE-2009-1955", "CVE-2009-1956");
  script_name("CentOS Update for apr-util CESA-2009:1107 centos5 i386");

  script_tag(name:"summary", value:"Check for the Version of apr-util");
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

  if ((res = isrpmvuln(pkg:"apr-util", rpm:"apr-util~1.2.7~7.el5_3.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"apr-util-devel", rpm:"apr-util-devel~1.2.7~7.el5_3.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"apr-util-docs", rpm:"apr-util-docs~1.2.7~7.el5_3.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
