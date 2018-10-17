###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_63de5f3f6b_mod_http2_fc26.nasl 9700 2018-05-03 05:41:05Z ckuersteiner $
#
# Fedora Update for mod_http2 FEDORA-2018-63de5f3f6b
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
  script_oid("1.3.6.1.4.1.25623.1.0.874396");
  script_version("$Revision: 9700 $");
  script_tag(name:"last_modification", value:"$Date: 2018-05-03 07:41:05 +0200 (Thu, 03 May 2018) $");
  script_tag(name:"creation_date", value:"2018-05-02 16:59:03 +0530 (Wed, 02 May 2018)");
  script_cve_id("CVE-2018-1302");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for mod_http2 FEDORA-2018-63de5f3f6b");
  script_tag(name: "summary", value: "Check the version of mod_http2");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The mod_h2 Apache httpd module implements 
the HTTP2 protocol (h2+h2c) on top of libnghttp2 for httpd 2.4 servers.
");
  script_tag(name: "affected", value: "mod_http2 on Fedora 26");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2018-63de5f3f6b");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LKKJZY3KR23XVOMRIFSRAKWQCN3B6B7N");
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

  if ((res = isrpmvuln(pkg:"mod_http2", rpm:"mod_http2~1.10.18~1.fc26", rls:"FC26")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
