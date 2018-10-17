###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_909707fc68_python-bottle_fc26.nasl 8575 2018-01-30 07:16:35Z asteins $
#
# Fedora Update for python-bottle FEDORA-2018-909707fc68
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
  script_oid("1.3.6.1.4.1.25623.1.0.874042");
  script_version("$Revision: 8575 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-30 08:16:35 +0100 (Tue, 30 Jan 2018) $");
  script_tag(name:"creation_date", value:"2018-01-24 07:46:29 +0100 (Wed, 24 Jan 2018)");
  script_cve_id("CVE-2016-9964");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for python-bottle FEDORA-2018-909707fc68");
  script_tag(name: "summary", value: "Check the version of python-bottle");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Bottle is a fast and simple micro-framework 
for small web-applications. It offers request dispatching (Routes) with URL 
parameter support, Templates, a built-in HTTP Server and adapters for many third 
party WSGI/HTTP-server and template engines. All in a single file and with no 
dependencies other than the Python Standard Library.
");
  script_tag(name: "affected", value: "python-bottle on Fedora 26");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2018-909707fc68");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/UHEFBNBIQKU63HOQHCS2AVE4XR7OGJP7");
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

  if ((res = isrpmvuln(pkg:"python-bottle", rpm:"python-bottle~0.12.13~1.fc26", rls:"FC26")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
