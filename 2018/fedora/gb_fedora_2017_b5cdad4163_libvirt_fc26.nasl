###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2017_b5cdad4163_libvirt_fc26.nasl 8337 2018-01-09 07:04:57Z teissa $
#
# Fedora Update for libvirt FEDORA-2017-b5cdad4163
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
  script_oid("1.3.6.1.4.1.25623.1.0.873967");
  script_version("$Revision: 8337 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-09 08:04:57 +0100 (Tue, 09 Jan 2018) $");
  script_tag(name:"creation_date", value:"2018-01-05 23:58:50 +0100 (Fri, 05 Jan 2018)");
  script_cve_id("CVE-2017-1000256");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for libvirt FEDORA-2017-b5cdad4163");
  script_tag(name: "summary", value: "Check the version of libvirt");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Libvirt is a C toolkit to interact with 
the virtualization capabilities of recent versions of Linux (and other OSes). 
The main package includes the libvirtd server exporting the virtualization 
support.");
  script_tag(name: "affected", value: "libvirt on Fedora 26");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-b5cdad4163");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/X7BUAUFIKODL3AR7BCK3UEMWHIT4CFGN");
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

if(release == "FC26")
{

  if ((res = isrpmvuln(pkg:"libvirt", rpm:"libvirt~3.2.1~7.fc26", rls:"FC26")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
