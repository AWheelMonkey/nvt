###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for 389-admin FEDORA-2015-1711
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
  script_oid("1.3.6.1.4.1.25623.1.0.869096");
  script_version("$Revision: 7101 $");
  script_tag(name:"last_modification", value:"$Date: 2017-09-12 08:15:03 +0200 (Tue, 12 Sep 2017) $");
  script_tag(name:"creation_date", value:"2015-03-16 06:41:57 +0100 (Mon, 16 Mar 2015)");
  script_cve_id("CVE-2015-0233");
  script_tag(name:"cvss_base", value:"4.6");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for 389-admin FEDORA-2015-1711");
  script_tag(name: "summary", value: "Check the version of 389-admin");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "389 Administration Server is an HTTP agent
that provides management features for 389 Directory Server. It provides some
management web apps that can be used through a web browser. It provides the
authentication, access control, and CGI utilities used by the console.
");
  script_tag(name: "affected", value: "389-admin on Fedora 21");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "FEDORA", value: "2015-1711");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2015-March/151954.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
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

if(release == "FC21")
{

  if ((res = isrpmvuln(pkg:"389-admin", rpm:"389-admin~1.1.38~1.fc21", rls:"FC21")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
