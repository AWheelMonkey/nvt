###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for xen FEDORA-2013-1274
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

tag_affected = "xen on Fedora 16";
tag_insight = "This package contains the XenD daemon and xm command line
  tools, needed to manage virtual machines running under the
  Xen hypervisor";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.fedoraproject.org/pipermail/package-announce/2013-February/098095.html");
  script_oid("1.3.6.1.4.1.25623.1.0.865292");
  script_version("$Revision: 9372 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:56:37 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-02-04 09:51:54 +0530 (Mon, 04 Feb 2013)");
  script_cve_id("CVE-2012-6075", "CVE-2012-5634", "CVE-2012-5510", "CVE-2012-5511",
                "CVE-2012-5512", "CVE-2012-5513", "CVE-2012-5514", "CVE-2012-5515",
                "CVE-2012-4535", "CVE-2012-4536", "CVE-2012-4537", "CVE-2012-4538",
                "CVE-2012-4539", "CVE-2012-4544", "CVE-2012-3494", "CVE-2012-3495",
                "CVE-2012-3496", "CVE-2012-3498", "CVE-2012-3515", "CVE-2012-4411",
                "CVE-2012-3433", "CVE-2012-3432", "CVE-2012-2625", "CVE-2012-0217",
                "CVE-2012-0218", "CVE-2012-2934", "CVE-2012-0029");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name: "FEDORA", value: "2013-1274");
  script_name("Fedora Update for xen FEDORA-2013-1274");

  script_tag(name:"summary", value:"Check for the Version of xen");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
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

if(release == "FC16")
{
  if ((res = isrpmvuln(pkg:"xen", rpm:"xen~4.1.4~3.fc16", rls:"FC16")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
