###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_1e033dc308_kernel_fc27.nasl 10932 2018-08-13 02:58:36Z ckuersteiner $
#
# Fedora Update for kernel FEDORA-2018-1e033dc308
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
  script_oid("1.3.6.1.4.1.25623.1.0.874366");
  script_version("$Revision: 10932 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-13 04:58:36 +0200 (Mon, 13 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-04-18 08:57:51 +0200 (Wed, 18 Apr 2018)");
  script_cve_id("CVE-2018-10021", "CVE-2017-18232", "CVE-2018-7995", "CVE-2018-8043", 
                "CVE-2018-7757", "CVE-2018-5803", "CVE-2018-1065", "CVE-2018-1000026", 
                "CVE-2018-5750", "CVE-2018-1000004", "CVE-2018-5344", "CVE-2018-5332", 
                "CVE-2018-5333", "CVE-2017-17862", "CVE-2017-17863", "CVE-2017-17864", 
                "CVE-2017-17852", "CVE-2017-17853", "CVE-2017-17854", "CVE-2017-17855", 
                "CVE-2017-17856", "CVE-2017-17857", "CVE-2017-17741", "CVE-2017-17712", 
                "CVE-2017-17449", "CVE-2017-17450", "CVE-2017-17448", "CVE-2017-17558", 
                "CVE-2017-8824", "CVE-2017-1000405", "CVE-2017-16649", "CVE-2017-16650", 
                "CVE-2017-16644", "CVE-2017-16647", "CVE-2017-15115", "CVE-2017-16532", 
                "CVE-2017-16538", "CVE-2017-12193");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for kernel FEDORA-2018-1e033dc308");
  script_tag(name: "summary", value: "Check the version of kernel");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The kernel meta package
");
  script_tag(name: "affected", value: "kernel on Fedora 27");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2018-1e033dc308");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/SKS5SHENFBKZBNJZ5A6BMP6JNTK5D4QC");
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

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~4.15.17~300.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
