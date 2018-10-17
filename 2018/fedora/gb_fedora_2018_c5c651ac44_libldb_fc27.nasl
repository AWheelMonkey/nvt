###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_c5c651ac44_libldb_fc27.nasl 9543 2018-04-20 01:56:24Z ckuersteiner $
#
# Fedora Update for libldb FEDORA-2018-c5c651ac44
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
  script_oid("1.3.6.1.4.1.25623.1.0.874235");
  script_version("$Revision: 9543 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-20 03:56:24 +0200 (Fri, 20 Apr 2018) $");
  script_tag(name:"creation_date", value:"2018-03-15 08:54:04 +0100 (Thu, 15 Mar 2018)");
  script_cve_id("CVE-2018-1050", "CVE-2018-1057");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for libldb FEDORA-2018-c5c651ac44");
  script_tag(name: "summary", value: "Check the version of libldb");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "An extensible library that implements 
an LDAP like API to access remote LDAP servers, or use local tdb databases.
");
  script_tag(name: "affected", value: "libldb on Fedora 27");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2018-c5c651ac44");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/TSEA6GWWGBHUTR2IVCLHKI5VCXTHRA3U");
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

  if ((res = isrpmvuln(pkg:"libldb", rpm:"libldb~1.3.2~1.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
