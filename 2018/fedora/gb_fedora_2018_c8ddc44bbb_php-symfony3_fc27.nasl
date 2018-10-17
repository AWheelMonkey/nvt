###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_c8ddc44bbb_php-symfony3_fc27.nasl 10932 2018-08-13 02:58:36Z ckuersteiner $
#
# Fedora Update for php-symfony3 FEDORA-2018-c8ddc44bbb
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
  script_oid("1.3.6.1.4.1.25623.1.0.874781");
  script_version("$Revision: 10932 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-13 04:58:36 +0200 (Mon, 13 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-07-08 06:05:21 +0200 (Sun, 08 Jul 2018)");
  script_cve_id("CVE-2018-11407", "CVE-2018-11408", "CVE-2018-11406", "CVE-2018-11385", 
                "CVE-2018-11386", "CVE-2017-16652");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for php-symfony3 FEDORA-2018-c8ddc44bbb");
  script_tag(name:"summary", value:"Check the version of php-symfony3");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present 
on the target host.");
  script_tag(name:"insight", value:"Symfony PHP framework (version 3).

NOTE: Does not require PHPUnit bridge.
");
  script_tag(name:"affected", value:"php-symfony3 on Fedora 27");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-c8ddc44bbb");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/YZXBF7ZKEJK6CXMRI5JWG2VHKQRMKE6Q");
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

  if ((res = isrpmvuln(pkg:"php-symfony3", rpm:"php-symfony3~3.3.17~1.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
