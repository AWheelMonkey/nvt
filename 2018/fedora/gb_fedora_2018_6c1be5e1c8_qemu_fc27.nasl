###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_6c1be5e1c8_qemu_fc27.nasl 11661 2018-09-28 03:58:36Z ckuersteiner $
#
# Fedora Update for qemu FEDORA-2018-6c1be5e1c8
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
  script_oid("1.3.6.1.4.1.25623.1.0.874988");
  script_version("$Revision: 11661 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-28 05:58:36 +0200 (Fri, 28 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-08-26 07:05:30 +0200 (Sun, 26 Aug 2018)");
  script_cve_id("CVE-2017-16845", "CVE-2017-17381", "CVE-2018-5683", "CVE-2018-7550", "CVE-2018-7858", "CVE-2018-11806", "CVE-2018-12617", "CVE-2017-15119", "CVE-2017-15118", "CVE-2017-5715", "CVE-2018-3639", "CVE-2017-15038", "CVE-2017-15268");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for qemu FEDORA-2018-6c1be5e1c8");
  script_tag(name:"summary", value:"Check the version of qemu");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"QEMU is a generic and open source processor emulator which achieves a good
emulation speed by using dynamic translation. QEMU has two operating modes:

 * Full system emulation. In this mode, QEMU emulates a full system (for
   example a PC), including a processor and various peripherials. It can be
   used to launch different Operating Systems without rebooting the PC or
   to debug system code.
 * User mode emulation. In this mode, QEMU can launch Linux processes compiled
   for one CPU on another CPU.

As QEMU requires no host kernel patches to run, it is safe and easy to use.
");
  script_tag(name:"affected", value:"qemu on Fedora 27");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-6c1be5e1c8");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/OAL4BMIMIAGDUMR2IHBYAKWQ4PAWCY7S");
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

  if ((res = isrpmvuln(pkg:"qemu", rpm:"qemu~2.10.2~1.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
