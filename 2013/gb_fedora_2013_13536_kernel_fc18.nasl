###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for kernel FEDORA-2013-13536
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.866121");
  script_version("$Revision: 9353 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-08-01 18:25:18 +0530 (Thu, 01 Aug 2013)");
  script_cve_id("CVE-2013-4125", "CVE-2013-2232", "CVE-2013-1059", "CVE-2013-2234",
                "CVE-2013-2164", "CVE-2013-2851", "CVE-2013-2852", "CVE-2013-2148",
                "CVE-2013-2147", "CVE-2013-2140", "CVE-2013-2850", "CVE-2013-3228",
                "CVE-2013-3230", "CVE-2013-3231", "CVE-2013-3232", "CVE-2013-3233",
                "CVE-2013-3234", "CVE-2013-3076", "CVE-2013-3223", "CVE-2013-3225",
                "CVE-2013-1979", "CVE-2013-3224", "CVE-2013-3222", "CVE-2013-1929",
                "CVE-2013-1873", "CVE-2013-1796", "CVE-2013-1797", "CVE-2013-1798",
                "CVE-2013-1860", "CVE-2013-0913", "CVE-2013-0914", "CVE-2013-1828",
                "CVE-2013-1792", "CVE-2013-1767", "CVE-2013-1763", "CVE-2013-0290",
                                                  "CVE-2013-0228", "CVE-2013-0190");
  script_tag(name:"cvss_base", value:"7.9");
  script_tag(name:"cvss_base_vector", value:"AV:A/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Fedora Update for kernel FEDORA-2013-13536");

  tag_insight = "The kernel package contains the Linux kernel (vmlinuz), the core of any
Linux operating system.  The kernel handles the basic functions
of the operating system: memory allocation, process allocation, device
input and output, etc.
";

  tag_affected = "kernel on Fedora 18";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "FEDORA", value: "2013-13536");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2013-July/112454.html");
  script_tag(name: "summary" , value: "Check for the Version of kernel");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC18")
{

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~3.9.11~200.fc18", rls:"FC18")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
