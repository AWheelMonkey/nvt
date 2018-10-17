###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2017_d4709b0d8b_xen_fc25.nasl 7673 2017-11-07 05:08:13Z teissa $
#
# Fedora Update for xen FEDORA-2017-d4709b0d8b
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.873562");
  script_version("$Revision: 7673 $");
  script_tag(name:"last_modification", value:"$Date: 2017-11-07 06:08:13 +0100 (Tue, 07 Nov 2017) $");
  script_tag(name:"creation_date", value:"2017-11-02 11:13:56 +0100 (Thu, 02 Nov 2017)");
  script_cve_id("CVE-2017-13673", "CVE-2017-13672", "CVE-2017-15590", "CVE-2017-15591", 
                "CVE-2017-15589", "CVE-2017-15595", "CVE-2017-15588", "CVE-2017-15593", 
                "CVE-2017-15592", "CVE-2017-15594");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for xen FEDORA-2017-d4709b0d8b");
  script_tag(name: "summary", value: "Check the version of xen");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "This package contains the XenD daemon and 
xm command line tools, needed to manage virtual machines running under the Xen 
hypervisor");
  script_tag(name: "affected", value: "xen on Fedora 25");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-d4709b0d8b");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/WXXVHVMUK6LKXWAIDZDOQA4FEI5LN5AT");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
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

if(release == "FC25")
{

  if ((res = isrpmvuln(pkg:"xen", rpm:"xen~4.7.3~7.fc25", rls:"FC25")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
