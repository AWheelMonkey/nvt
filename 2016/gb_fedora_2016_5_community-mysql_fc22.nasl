###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for community-mysql FEDORA-2016-5
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
  script_oid("1.3.6.1.4.1.25623.1.0.807488");
  script_version("$Revision: 6631 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:36:10 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-03-10 06:12:02 +0100 (Thu, 10 Mar 2016)");
  script_cve_id("CVE-2015-4766", "CVE-2015-4791", "CVE-2015-4792", "CVE-2015-4800",
                "CVE-2015-4802", "CVE-2015-4807", "CVE-2015-4815", "CVE-2015-4819",
                "CVE-2015-4826", "CVE-2015-4830", "CVE-2015-4833", "CVE-2015-4836",
                "CVE-2015-4858", "CVE-2015-4861", "CVE-2015-4862", "CVE-2015-4864",
                "CVE-2015-4866", "CVE-2015-4870", "CVE-2015-4879", "CVE-2015-4890",
                "CVE-2015-4895", "CVE-2015-4904", "CVE-2015-4905", "CVE-2015-4910",
                "CVE-2015-4913", "CVE-2015-7744", "CVE-2016-0502", "CVE-2016-0503",
                "CVE-2016-0504", "CVE-2016-0505", "CVE-2016-0546", "CVE-2016-0594",
                "CVE-2016-0595", "CVE-2016-0596", "CVE-2016-0597", "CVE-2016-0598",
                "CVE-2016-0599", "CVE-2016-0600", "CVE-2016-0601", "CVE-2016-0605",
                "CVE-2016-0606", "CVE-2016-0607", "CVE-2016-0608", "CVE-2016-0609",
                "CVE-2016-0610", "CVE-2016-0611", "CVE-2016-0616");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for community-mysql FEDORA-2016-5");
  script_tag(name: "summary", value: "Check the version of community-mysql");

  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");

  script_tag(name: "insight", value: "MySQL is a multi-user, multi-threaded SQL
  database server. MySQL is a client/server implementation consisting of a server
  daemon (mysqld) and many different client programs and libraries. The base
  package contains the standard MySQL client programs and generic MySQL files.");

  script_tag(name: "affected", value: "community-mysql on Fedora 22");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2016-5");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2016-March/178585.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
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

if(release == "FC22")
{

  if ((res = isrpmvuln(pkg:"community-mysql", rpm:"community-mysql~5.6.29~1.fc22", rls:"FC22")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
