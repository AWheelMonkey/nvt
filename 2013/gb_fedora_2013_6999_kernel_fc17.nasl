###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for kernel FEDORA-2013-6999
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
  script_oid("1.3.6.1.4.1.25623.1.0.865597");
  script_version("$Revision: 11484 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-20 05:38:48 +0200 (Thu, 20 Sep 2018) $");
  script_tag(name:"creation_date", value:"2013-05-06 13:49:05 +0530 (Mon, 06 May 2013)");
  script_cve_id("CVE-2013-3228", "CVE-2013-3230", "CVE-2013-3231", "CVE-2013-3232",
                "CVE-2013-3233", "CVE-2013-3234", "CVE-2013-3076", "CVE-2013-3223",
                "CVE-2013-3225", "CVE-2013-1979", "CVE-2013-3224", "CVE-2013-3222",
                "CVE-2013-1929", "CVE-2013-2634", "CVE-2013-1796", "CVE-2013-1797",
                "CVE-2013-1798", "CVE-2013-1860", "CVE-2013-0913", "CVE-2013-0914",
                "CVE-2013-1828", "CVE-2013-1792", "CVE-2013-1819", "CVE-2013-1767",
                "CVE-2013-1763", "CVE-2013-0290", "CVE-2013-0228", "CVE-2013-0216",
                "CVE-2013-0190", "CVE-2012-4530", "CVE-2012-4461", "CVE-2012-4565",
                "CVE-2012-4508", "CVE-2012-0957", "CVE-2012-3520", "CVE-2012-3412",
                "CVE-2012-2390", "CVE-2012-2372", "CVE-2011-4131", "CVE-2013-2635", "CVE-2013-2636");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_name("Fedora Update for kernel FEDORA-2013-6999");

  script_xref(name: "FEDORA", value: "2013-6999");
  script_xref(name: "URL" , value: "http://lists.fedoraproject.org/pipermail/package-announce/2013-May/104480.html");
  script_tag(name:"summary", value:"Check for the Version of kernel");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  script_tag(name:"affected", value:"kernel on Fedora 17");
  script_tag(name:"insight", value:"The kernel package contains the Linux kernel (vmlinuz), the core of any
  Linux operating system.  The kernel handles the basic functions of the operating system: memory allocation,
  process allocation, device input and output, etc.");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
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

if(release == "FC17")
{

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~3.8.11~100.fc17", rls:"FC17")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
