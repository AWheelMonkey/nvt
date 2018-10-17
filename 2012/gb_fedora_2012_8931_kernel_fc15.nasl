###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for kernel FEDORA-2012-8931
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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

include("revisions-lib.inc");
tag_affected = "kernel on Fedora 15";
tag_insight = "The kernel package contains the Linux kernel (vmlinuz), the core of any
  Linux operating system.  The kernel handles the basic functions
  of the operating system: memory allocation, process allocation, device
  input and output, etc.";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.fedoraproject.org/pipermail/package-announce/2012-June/082625.html");
  script_oid("1.3.6.1.4.1.25623.1.0.864488");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-06-25 09:44:40 +0530 (Mon, 25 Jun 2012)");
  script_cve_id("CVE-2012-2390", "CVE-2012-2372", "CVE-2011-4131", "CVE-2012-2123",
                "CVE-2012-2119", "CVE-2012-1601", "CVE-2012-1568", "CVE-2012-1179",
                "CVE-2012-1146", "CVE-2012-1097", "CVE-2012-1090", "CVE-2011-4086",
                "CVE-2012-0056", "CVE-2011-4127", "CVE-2012-0045", "CVE-2011-4347",
                "CVE-2011-4622", "CVE-2011-4132", "CVE-2011-4097", "CVE-2011-4077",
                "CVE-2011-3347", "CVE-2011-1083", "CVE-2011-1161", "CVE-2011-1162",
                "CVE-2011-3191", "CVE-2011-2905", "CVE-2012-2373", "CVE-2012-2375");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name: "FEDORA", value: "2012-8931");
  script_name("Fedora Update for kernel FEDORA-2012-8931");

  script_tag(name: "summary" , value: "Check for the Version of kernel");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC15")
{

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~2.6.43.8~1.fc15", rls:"FC15")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
