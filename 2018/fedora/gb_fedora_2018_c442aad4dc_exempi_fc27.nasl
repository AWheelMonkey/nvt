###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_c442aad4dc_exempi_fc27.nasl 9430 2018-04-11 01:54:49Z ckuersteiner $
#
# Fedora Update for exempi FEDORA-2018-c442aad4dc
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
  script_oid("1.3.6.1.4.1.25623.1.0.874330");
  script_version("$Revision: 9430 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-11 03:54:49 +0200 (Wed, 11 Apr 2018) $");
  script_tag(name:"creation_date", value:"2018-04-06 10:09:12 +0200 (Fri, 06 Apr 2018)");
  script_cve_id("CVE-2018-7728", "CVE-2018-7729", "CVE-2018-7730", "CVE-2018-7731", 
                "CVE-2017-18233", "CVE-2017-18236", "CVE-2017-18234", "CVE-2017-18235", 
                "CVE-2017-18237");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for exempi FEDORA-2018-c442aad4dc");
  script_tag(name: "summary", value: "Check the version of exempi");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Exempi provides a library for easy parsing 
of XMP metadata. It is a port of Adobe XMP SDK to work on UNIX and to be build 
with GNU automake. It includes XMPCore and XMPFiles.
");
  script_tag(name: "affected", value: "exempi on Fedora 27");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2018-c442aad4dc");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/H4PKNNGR3XYNB7B7BYNWTABCOPERDDLB");
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

if(release == "FC27")
{

  if ((res = isrpmvuln(pkg:"exempi", rpm:"exempi~2.4.5~1.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
