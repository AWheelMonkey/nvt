###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for qemu FEDORA-2012-8592
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
tag_insight = "QEMU is a generic and open source processor emulator which achieves a good
  emulation speed by using dynamic translation. QEMU has two operating modes:

   * Full system emulation. In this mode, QEMU emulates a full system (for
     example a PC), including a processor and various peripherials. It can be
     used to launch different Operating Systems without rebooting the PC or
     to debug system code.
   * User mode emulation. In this mode, QEMU can launch Linux processes compiled
     for one CPU on another CPU.
  
  As QEMU requires no host kernel patches to run, it is safe and easy to use.";

tag_affected = "qemu on Fedora 16";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.fedoraproject.org/pipermail/package-announce/2012-June/081949.html");
  script_oid("1.3.6.1.4.1.25623.1.0.864289");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-06-08 10:11:09 +0530 (Fri, 08 Jun 2012)");
  script_cve_id("CVE-2012-0029");
  script_tag(name:"cvss_base", value:"7.4");
  script_tag(name:"cvss_base_vector", value:"AV:A/AC:M/Au:S/C:C/I:C/A:C");
  script_xref(name: "FEDORA", value: "2012-8592");
  script_name("Fedora Update for qemu FEDORA-2012-8592");

  script_tag(name: "summary" , value: "Check for the Version of qemu");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
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

if(release == "FC16")
{

  if ((res = isrpmvuln(pkg:"qemu", rpm:"qemu~0.15.1~5.fc16", rls:"FC16")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
