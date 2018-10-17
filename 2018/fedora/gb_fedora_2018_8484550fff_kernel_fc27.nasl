###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_8484550fff_kernel_fc27.nasl 10558 2018-07-20 14:08:23Z santu $
#
# Fedora Update for kernel FEDORA-2018-8484550fff
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
  script_oid("1.3.6.1.4.1.25623.1.0.874813");
  script_version("$Revision: 10558 $");
  script_tag(name:"last_modification", value:"$Date: 2018-07-20 16:08:23 +0200 (Fri, 20 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-07-15 06:04:39 +0200 (Sun, 15 Jul 2018)");
  script_cve_id("CVE-2018-13405", "CVE-2018-13053", "CVE-2018-12896", "CVE-2018-13093", 
                "CVE-2018-13094", "CVE-2018-13095", "CVE-2018-12714", "CVE-2018-12633", 
                "CVE-2018-12232", "CVE-2018-10853", "CVE-2018-11506", "CVE-2018-10840", 
                "CVE-2018-3639", "CVE-2018-1120", "CVE-2018-10322", "CVE-2018-10323", 
                "CVE-2018-1108", "CVE-2018-10021", "CVE-2017-18232", "CVE-2018-7995", 
                "CVE-2018-8043", "CVE-2018-7757", "CVE-2018-5803", "CVE-2018-1065", 
                "CVE-2018-1000026", "CVE-2018-5750", "CVE-2018-1000004", "CVE-2018-5344", 
                "CVE-2018-5332", "CVE-2018-5333", "CVE-2017-17862", "CVE-2017-17863", 
                "CVE-2017-17864", "CVE-2017-17852", "CVE-2017-17853", "CVE-2017-17854", 
                "CVE-2017-17855", "CVE-2017-17856", "CVE-2017-17857", "CVE-2017-17741", 
                "CVE-2017-17712", "CVE-2017-17449", "CVE-2017-17450", "CVE-2017-17448", 
                "CVE-2017-17558", "CVE-2017-8824", "CVE-2017-1000405", "CVE-2017-16649", 
                "CVE-2017-16650", "CVE-2017-16644", "CVE-2017-16647", "CVE-2017-15115", 
                "CVE-2017-16532", "CVE-2017-16538", "CVE-2017-12193", "CVE-2018-13406");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for kernel FEDORA-2018-8484550fff");
  script_tag(name:"summary", value:"Check the version of kernel");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present 
on the target host.");
  script_tag(name:"insight", value:"The kernel meta package
");
  script_tag(name:"affected", value:"kernel on Fedora 27");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-8484550fff");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/VOZHI2THAILWJPPQV3NONSSGW7WEZHWA");
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

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~4.17.5~100.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
