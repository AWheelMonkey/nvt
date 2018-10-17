###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_d955395c08_mariadb_fc26.nasl 9974 2018-05-28 03:25:02Z ckuersteiner $
#
# Fedora Update for mariadb FEDORA-2018-d955395c08
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
  script_oid("1.3.6.1.4.1.25623.1.0.874594");
  script_version("$Revision: 9974 $");
  script_tag(name:"last_modification", value:"$Date: 2018-05-28 05:25:02 +0200 (Mon, 28 May 2018) $");
  script_tag(name:"creation_date", value:"2018-05-23 05:50:35 +0200 (Wed, 23 May 2018)");
  script_cve_id("CVE-2018-2755", "CVE-2018-2761", "CVE-2018-2766", "CVE-2018-2771", 
                "CVE-2018-2781", "CVE-2018-2782", "CVE-2018-2784", "CVE-2018-2787", 
                "CVE-2018-2813", "CVE-2018-2817", "CVE-2018-2819", "CVE-2017-3265", 
                "CVE-2017-3313", "CVE-2017-3308", "CVE-2017-3309", "CVE-2017-3453", 
                "CVE-2017-3456", "CVE-2017-3464", "CVE-2018-2773", "CVE-2018-2818");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for mariadb FEDORA-2018-d955395c08");
  script_tag(name:"summary", value:"Check the version of mariadb");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present 
on the target host.");
  script_tag(name:"insight", value:"MariaDB is a community developed branch of 
MySQL. MariaDB is a multi-user, multi-threaded SQL database server. 
It is a client/server implementation consisting of a server daemon (mysqld)
and many different client programs and libraries. The base package
contains the standard MariaDB/MySQL client programs and generic MySQL files.
");
  script_tag(name:"affected", value:"mariadb on Fedora 26");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-d955395c08");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/C7UF6XVJNCHPSN5BBYHUX267XZGFVP5P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC26")
{

  if ((res = isrpmvuln(pkg:"mariadb", rpm:"mariadb~10.1.33~1.fc26", rls:"FC26")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
