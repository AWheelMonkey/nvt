###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for kernel FEDORA-2011-13809
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

if(description)
{
  script_xref(name:"URL", value:"http://lists.fedoraproject.org/pipermail/package-announce/2011-October/067370.html");
  script_oid("1.3.6.1.4.1.25623.1.0.863575");
  script_version("$Revision: 11484 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-20 05:38:48 +0200 (Thu, 20 Sep 2018) $");
  script_tag(name:"creation_date", value:"2011-10-10 16:05:48 +0200 (Mon, 10 Oct 2011)");
  script_xref(name: "FEDORA", value: "2011-13809");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2011-1160", "CVE-2011-1162", "CVE-2011-3191", "CVE-2011-2905");
  script_name("Fedora Update for kernel FEDORA-2011-13809");

  script_tag(name:"summary", value:"Check for the Version of kernel");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");

  script_tag(name:"affected", value:"kernel on Fedora 15");

  script_tag(name:"insight", value:"The kernel package contains the Linux kernel (vmlinuz), the core of any
  Linux operating system.  The kernel handles the basic functions of the operating system: memory allocation,
  process allocation, device input and output, etc.");

  script_tag(name: "solution", value:"Please Install the Updated Packages.");
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

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~2.6.40.6~0.fc15", rls:"FC15")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
