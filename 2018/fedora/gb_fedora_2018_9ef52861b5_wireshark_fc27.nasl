###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_9ef52861b5_wireshark_fc27.nasl 11416 2018-09-17 03:39:26Z ckuersteiner $
#
# Fedora Update for wireshark FEDORA-2018-9ef52861b5
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
  script_oid("1.3.6.1.4.1.25623.1.0.874872");
  script_version("$Revision: 11416 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-17 05:39:26 +0200 (Mon, 17 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-08-02 06:01:38 +0200 (Thu, 02 Aug 2018)");
  script_cve_id("CVE-2018-14339", "CVE-2018-14340", "CVE-2018-14341", "CVE-2018-14342", 
                "CVE-2018-14343", "CVE-2018-14344", "CVE-2018-14367", "CVE-2018-14368", 
                "CVE-2018-14369", "CVE-2018-14370", "CVE-2018-7419", "CVE-2018-7418", 
                "CVE-2018-7417", "CVE-2018-7420", "CVE-2018-7320", "CVE-2018-7336", 
                "CVE-2018-7337", "CVE-2018-7334", "CVE-2018-7335", "CVE-2018-6836", 
                "CVE-2018-5335", "CVE-2018-5334", "CVE-2017-6014", "CVE-2017-9616", 
                "CVE-2017-9617", "CVE-2017-9766", "CVE-2017-17935", "CVE-2017-17085", 
                "CVE-2017-17084", "CVE-2017-17083", "CVE-2017-15189", "CVE-2017-15190", 
                "CVE-2017-15191", "CVE-2017-15192", "CVE-2017-15193", "CVE-2017-13764", 
                "CVE-2017-13765", "CVE-2017-13766", "CVE-2017-13767");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for wireshark FEDORA-2018-9ef52861b5");
  script_tag(name:"summary", value:"Check the version of wireshark");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Metapackage with installs wireshark-cli and wireshark-qt.
");
  script_tag(name:"affected", value:"wireshark on Fedora 27");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-9ef52861b5");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/AM62HSZGLJTWME5BBTQHN5RW6HL3PMPQ");
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

  if ((res = isrpmvuln(pkg:"wireshark", rpm:"wireshark~2.6.2~1.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
