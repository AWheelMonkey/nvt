###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for kernel FEDORA-2014-2606
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.867520");
  script_version("$Revision: 11484 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-20 05:38:48 +0200 (Thu, 20 Sep 2018) $");
  script_tag(name:"creation_date", value:"2014-02-20 15:05:46 +0530 (Thu, 20 Feb 2014)");
  script_cve_id("CVE-2014-0069", "CVE-2014-1874", "CVE-2014-1446", "CVE-2014-1438",
                "CVE-2013-4579", "CVE-2013-4587", "CVE-2013-6376", "CVE-2013-6368",
                "CVE-2013-6367", "CVE-2013-6382", "CVE-2013-6380",
                "CVE-2013-6378", "CVE-2013-4563", "CVE-2013-4348", "CVE-2013-4470",
                "CVE-2013-4387", "CVE-2013-4345", "CVE-2013-4350", "CVE-2013-4343",
                "CVE-2013-2888", "CVE-2013-2889", "CVE-2013-2891", "CVE-2013-2892",
                "CVE-2013-2893", "CVE-2013-2894", "CVE-2013-2895", "CVE-2013-2896",
                "CVE-2013-2897", "CVE-2013-2899", "CVE-2013-0343", "CVE-2013-4254",
                "CVE-2013-4125", "CVE-2013-2232", "CVE-2013-1059", "CVE-2013-2234",
                "CVE-2013-7263", "CVE-2013-7264", "CVE-2013-7265", "CVE-2013-7281");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");

  script_name("Fedora Update for kernel FEDORA-2014-2606");

  script_tag(name: "affected", value: "kernel on Fedora 19");

  script_tag(name: "insight", value: "The kernel package contains the Linux kernel (vmlinuz), the core of any
Linux operating system.  The kernel handles the basic functions of the operating system: memory allocation,
process allocation, device input and output, etc.");

  script_tag(name: "solution" , value: "Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "FEDORA", value: "2014-2606");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2014-February/128493.html");
  script_tag(name:"summary", value:"Check for the Version of kernel");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
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

if(release == "FC19")
{

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~3.12.11~201.fc19", rls:"FC19")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
