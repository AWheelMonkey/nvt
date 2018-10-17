###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for graphite2 FEDORA-2017-e0a9e51dd5
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.872854");
  script_version("$Revision: 10997 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-16 11:07:13 +0200 (Thu, 16 Aug 2018) $");
  script_tag(name:"creation_date", value:"2017-07-14 15:55:11 +0530 (Fri, 14 Jul 2017)");
  script_cve_id("CVE-2017-7778");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for graphite2 FEDORA-2017-e0a9e51dd5");
  script_tag(name: "summary", value: "Check the version of graphite2");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Graphite2 is a project within SILs 
Non-Roman Script Initiative and Language Software Development groups to 
provide rendering capabilities for complex non-Roman writing systems. 
Graphite can be used to create smart fonts capable of displaying writing 
systems with various complex behaviors. With respect to the Text Encoding 
Model, Graphite handles the 'Rendering' aspect of writing system 
implementation.");
  script_tag(name: "affected", value: "graphite2 on Fedora 24");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-e0a9e51dd5");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/5N2MJMMOHWUQRD2FV2ZHQ7VOQPEYQCJJ");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
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

if(release == "FC24")
{

  if ((res = isrpmvuln(pkg:"graphite2", rpm:"graphite2~1.3.10~1.fc24", rls:"FC24")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
