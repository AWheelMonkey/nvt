###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_8fc2cb8cb0_wordpress_fc27.nasl 11099 2018-08-24 03:13:46Z ckuersteiner $
#
# Fedora Update for wordpress FEDORA-2018-8fc2cb8cb0
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
  script_oid("1.3.6.1.4.1.25623.1.0.874806");
  script_version("$Revision: 11099 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-24 05:13:46 +0200 (Fri, 24 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-07-15 06:04:19 +0200 (Sun, 15 Jul 2018)");
  script_cve_id("CVE-2018-12895");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for wordpress FEDORA-2018-8fc2cb8cb0");
  script_tag(name:"summary", value:"Check the version of wordpress");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present 
on the target host.");
  script_tag(name:"insight", value:"Wordpress is an online publishing / weblog 
package that makes it very easy, almost trivial, to get information out to people 
on the web.

Important information in /usr/share/doc/wordpress/README.fedora
");
  script_tag(name:"affected", value:"wordpress on Fedora 27");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-8fc2cb8cb0");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/K664HBXAVPNEI4GPMMOWK2X665JXETO2");
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

  if ((res = isrpmvuln(pkg:"wordpress", rpm:"wordpress~4.9.7~1.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
