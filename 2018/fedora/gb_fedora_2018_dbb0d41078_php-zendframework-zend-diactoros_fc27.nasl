###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_dbb0d41078_php-zendframework-zend-diactoros_fc27.nasl 12004 2018-10-22 05:34:04Z cfischer $
#
# Fedora Update for php-zendframework-zend-diactoros FEDORA-2018-dbb0d41078
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
  script_oid("1.3.6.1.4.1.25623.1.0.874944");
  script_version("$Revision: 12004 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-22 07:34:04 +0200 (Mon, 22 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-08-15 06:36:25 +0200 (Wed, 15 Aug 2018)");
  script_cve_id("CVE-2018-14773", "CVE-2018-14774");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for php-zendframework-zend-diactoros FEDORA-2018-dbb0d41078");
  script_tag(name:"summary", value:"Check the version of php-zendframework-zend-diactoros");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
on the target host.");
  script_tag(name:"insight", value:"A PHP package containing implementations of the
accepted PSR-7 HTTP message interfaces [1], as well as a 'server' implementation similar
to node&#39 s http.Server [2].

Documentation: 'https://zendframework.github.io/zend-diactoros/'

Autoloader: /usr/share/php/Zend/Diactoros/autoload.php

[1] 'http://www.php-fig.org/psr/psr-7/'
[2] 'http://nodejs.org/api/http.html'
");
  script_tag(name:"affected", value:"php-zendframework-zend-diactoros on Fedora 27");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-dbb0d41078");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/2Q5NN4YKQFE3WLFLIS7AJTOJ6E5FNTRH");
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

  if ((res = isrpmvuln(pkg:"php-zendframework-zend-diactoros", rpm:"php-zendframework-zend-diactoros~1.8.4~1.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
