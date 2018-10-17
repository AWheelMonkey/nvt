###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for kernel FEDORA-2014-17283
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.868627");
  script_version("$Revision: 6750 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-18 11:56:47 +0200 (Tue, 18 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-12-22 05:58:58 +0100 (Mon, 22 Dec 2014)");
  script_cve_id("CVE-2014-8559", "CVE-2014-8133", "CVE-2014-8134", "CVE-2014-9090",
                "CVE-2014-7843", "CVE-2014-7842", "CVE-2014-7841", "CVE-2014-7826",
                "CVE-2014-7825", "CVE-2014-3610", "CVE-2014-3611", "CVE-2014-3646",
                "CVE-2014-8369", "CVE-2014-3688", "CVE-2014-3687", "CVE-2014-3673",
                "CVE-2014-3690", "CVE-2014-8086", "CVE-2014-7975", "CVE-2014-7970",
                "CVE-2014-6410", "CVE-2014-3186", "CVE-2014-3181", "CVE-2014-3631",
                "CVE-2014-5077", "CVE-2014-4171", "CVE-2014-5045", "CVE-2014-3534",
                "CVE-2014-4943", "CVE-2014-4715", "CVE-2014-4699", "CVE-2014-0206",
                "CVE-2014-4508", "CVE-2014-4014", "CVE-2014-3153", "CVE-2014-3940",
                "CVE-2014-3917", "CVE-2014-3144", "CVE-2014-3145", "CVE-2014-1738",
                "CVE-2014-1737", "CVE-2014-0181", "CVE-2014-0196", "CVE-2014-3122",
                "CVE-2014-2851", "CVE-2014-0155", "CVE-2014-2678", "CVE-2014-2580",
                "CVE-2014-0077", "CVE-2014-0055", "CVE-2014-2568", "CVE-2014-0131",
                "CVE-2014-2523", "CVE-2014-2309", "CVE-2014-0100", "CVE-2014-0101",
                "CVE-2014-0049", "CVE-2014-0102", "CVE-2014-2039", "CVE-2014-0069",
                "CVE-2014-1874", "CVE-2014-1446", "CVE-2014-1438", "CVE-2013-4579",
                "CVE-2013-4587", "CVE-2013-6376", "CVE-2013-6368", "CVE-2013-6367");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Fedora Update for kernel FEDORA-2014-17283");
  script_tag(name: "summary", value: "Check the version of kernel");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The kernel package contains the Linux kernel (vmlinuz), the core of any
Linux operating system.  The kernel handles the basic functions
of the operating system: memory allocation, process allocation, device
input and output, etc.
");
  script_tag(name: "affected", value: "kernel on Fedora 20");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "FEDORA", value: "2014-17283");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2014-December/146609.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
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

if(release == "FC20")
{

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~3.17.7~200.fc20", rls:"FC20")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
