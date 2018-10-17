###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_22776e8ca9_pdns_fc27.nasl 11897 2018-10-15 05:26:22Z cfischer $
#
# Fedora Update for pdns FEDORA-2018-22776e8ca9
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
  script_oid("1.3.6.1.4.1.25623.1.0.875171");
  script_version("$Revision: 11897 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-15 07:26:22 +0200 (Mon, 15 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-10-11 08:53:55 +0200 (Thu, 11 Oct 2018)");
  script_cve_id("CVE-2017-5950");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for pdns FEDORA-2018-22776e8ca9");
  script_tag(name:"summary", value:"Check the version of pdns");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");
  script_tag(name:"insight", value:"The PowerDNS Nameserver is a modern, advanced
  and high performance authoritative-only nameserver. It is written from scratch
  and conforms to all relevant DNS standards documents. Furthermore, PowerDNS
  interfaces with almost any database.");
  script_tag(name:"affected", value:"pdns on Fedora 27");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-22776e8ca9");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/UTUK5W6EWAMPEK2C57MC46E6QRFHRCKT");
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

  if ((res = isrpmvuln(pkg:"pdns", rpm:"pdns~4.1.4~1.fc27.1", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
