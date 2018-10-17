###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for qemu FEDORA-2016-890
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.806982");
  script_version("$Revision: 7900 $");
  script_tag(name:"last_modification", value:"$Date: 2017-11-24 11:35:02 +0100 (Fri, 24 Nov 2017) $");
  script_tag(name:"creation_date", value:"2016-01-20 06:15:42 +0100 (Wed, 20 Jan 2016)");
  script_cve_id("CVE-2015-7549", "CVE-2015-8558", "CVE-2015-8666", "CVE-2015-8744", "CVE-2015-8745");
  script_tag(name:"cvss_base", value:"4.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for qemu FEDORA-2016-890");
  script_tag(name: "summary", value: "Check the version of qemu");

  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");

  script_tag(name: "insight", value: "QEMU is a generic and open source processor
  emulator which achieves a good emulation speed by using dynamic translation.
  QEMU has two operating modes:
  * Full system emulation. In this mode, QEMU emulates a full system (for
  example a PC), including a processor and various peripherials. It can be
  used to launch different Operating Systems without rebooting the PC or
  to debug system code.
  * User mode emulation. In this mode, QEMU can launch Linux processes compiled
  for one CPU on another CPU.
  As QEMU requires no host kernel patches to run, it is safe and easy to use.");

  script_tag(name: "affected", value: "qemu on Fedora 22");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2016-890");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2016-January/175760.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
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

if(release == "FC22")
{

  if ((res = isrpmvuln(pkg:"qemu", rpm:"qemu~2.3.1~10.fc22", rls:"FC22")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
