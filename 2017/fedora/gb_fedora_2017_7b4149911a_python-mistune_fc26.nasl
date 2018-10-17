###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2017_7b4149911a_python-mistune_fc26.nasl 8493 2018-01-23 06:43:13Z ckuersteiner $
#
# Fedora Update for python-mistune FEDORA-2017-7b4149911a
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
  script_oid("1.3.6.1.4.1.25623.1.0.873958");
  script_version("$Revision: 8493 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-23 07:43:13 +0100 (Tue, 23 Jan 2018) $");
  script_tag(name:"creation_date", value:"2017-12-29 08:05:34 +0100 (Fri, 29 Dec 2017)");
  script_cve_id("CVE-2017-15612", "CVE-2017-16876");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for python-mistune FEDORA-2017-7b4149911a");
  script_tag(name: "summary", value: "Check the version of python-mistune");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The fastest markdown parser in pure Python, 
inspired by marked.");
  script_tag(name: "affected", value: "python-mistune on Fedora 26");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-7b4149911a");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/NUR3GMHQBMA3UC4PFMCK6GCLOQC4LQQC");
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

if(release == "FC26")
{

  if ((res = isrpmvuln(pkg:"python-mistune", rpm:"python-mistune~0.8.3~1.fc26", rls:"FC26")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
