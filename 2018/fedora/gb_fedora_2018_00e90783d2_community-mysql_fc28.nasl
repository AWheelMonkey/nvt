###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_00e90783d2_community-mysql_fc28.nasl 9876 2018-05-17 03:47:45Z ckuersteiner $
#
# Fedora Update for community-mysql FEDORA-2018-00e90783d2
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
  script_oid("1.3.6.1.4.1.25623.1.0.874489");
  script_version("$Revision: 9876 $");
  script_tag(name:"last_modification", value:"$Date: 2018-05-17 05:47:45 +0200 (Thu, 17 May 2018) $");
  script_tag(name:"creation_date", value:"2018-05-16 05:57:41 +0200 (Wed, 16 May 2018)");
  script_cve_id("CVE-2018-2755", "CVE-2018-2758", "CVE-2018-2759", "CVE-2018-2761", 
                "CVE-2018-2762", "CVE-2018-2766", "CVE-2018-2769", "CVE-2018-2771", 
                "CVE-2018-2773", "CVE-2018-2775", "CVE-2018-2776", "CVE-2018-2777", 
                "CVE-2018-2778", "CVE-2018-2779", "CVE-2018-2780", "CVE-2018-2781", 
                "CVE-2018-2782", "CVE-2018-2784", "CVE-2018-2786", "CVE-2018-2787", 
                "CVE-2018-2810", "CVE-2018-2812", "CVE-2018-2813", "CVE-2018-2816", 
                "CVE-2018-2817", "CVE-2018-2818", "CVE-2018-2819", "CVE-2018-2839", 
                "CVE-2018-2846");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for community-mysql FEDORA-2018-00e90783d2");
  script_tag(name:"summary", value:"Check the version of community-mysql");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"MySQL is a multi-user, multi-threaded SQL database server. MySQL is a
client/server implementation consisting of a server daemon (mysqld)
and many different client programs and libraries. The base package
contains the standard MySQL client programs and generic MySQL files.
");
  script_tag(name:"affected", value:"community-mysql on Fedora 28");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-00e90783d2");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/NUNYFR3FFTGAFCUH54EWRGMHNCVBEUM2");
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

if(release == "FC28")
{

  if ((res = isrpmvuln(pkg:"community-mysql", rpm:"community-mysql~5.7.22~1.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
