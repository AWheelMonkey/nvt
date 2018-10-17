###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for kernel FEDORA-2011-14747
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_affected = "kernel on Fedora 14";
tag_insight = "The kernel package contains the Linux kernel (vmlinuz), the core of any
  Linux operating system.  The kernel handles the basic functions
  of the operating system: memory allocation, process allocation, device
  input and output, etc.";
tag_solution = "Please Install the Updated Packages.";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.fedoraproject.org/pipermail/package-announce/2011-October/068684.html");
  script_oid("1.3.6.1.4.1.25623.1.0.863604");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-10-31 13:45:00 +0100 (Mon, 31 Oct 2011)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name: "FEDORA", value: "2011-14747");
  script_cve_id("CVE-2011-1161", "CVE-2011-3353", "CVE-2011-2918", "CVE-2011-3188",
                "CVE-2011-2723", "CVE-2011-2928", "CVE-2011-3191", "CVE-2011-1833",
                "CVE-2011-2905", "CVE-2011-2695", "CVE-2011-2497", "CVE-2011-2517",
                "CVE-2011-2699", "CVE-2011-1770", "CVE-2011-1494", "CVE-2011-1495",
                "CVE-2011-1745", "CVE-2011-1746", "CVE-2010-4668", "CVE-2010-4073",
                "CVE-2010-4072", "CVE-2010-3880", "CVE-2010-2962", "CVE-2010-3698",
                "CVE-2010-2963", "CVE-2010-3904", "CVE-2011-3638");
  script_name("Fedora Update for kernel FEDORA-2011-14747");

  script_tag(name:"summary", value:"Check for the Version of kernel");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
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

if(release == "FC14")
{

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~2.6.35.14~100.fc14", rls:"FC14")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}