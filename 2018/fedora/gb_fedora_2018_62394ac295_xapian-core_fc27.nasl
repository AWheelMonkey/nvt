###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_62394ac295_xapian-core_fc27.nasl 11180 2018-08-31 14:10:20Z mmartin $
#
# Fedora Update for xapian-core FEDORA-2018-62394ac295
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
  script_oid("1.3.6.1.4.1.25623.1.0.874817");
  script_version("$Revision: 11180 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-31 16:10:20 +0200 (Fri, 31 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-07-15 06:08:07 +0200 (Sun, 15 Jul 2018)");
  script_cve_id("CVE-2018-0499");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for xapian-core FEDORA-2018-62394ac295");
  script_tag(name:"summary", value:"Check the version of xapian-core");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present 
on the target host.");
  script_tag(name:"insight", value:"Xapian is an Open Source Probabilistic 
Information Retrieval Library. It offers a highly adaptable toolkit that allows 
developers to easily add advanced indexing and search facilities to applications
");
  script_tag(name:"affected", value:"xapian-core on Fedora 27");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-62394ac295");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/J5TGVQHDSYTYAMGMIBHBMIEZO3P7KVTK");
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

  if ((res = isrpmvuln(pkg:"xapian-core", rpm:"xapian-core~1.4.6~1.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
