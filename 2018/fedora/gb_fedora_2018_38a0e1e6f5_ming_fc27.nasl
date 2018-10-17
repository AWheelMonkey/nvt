###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_38a0e1e6f5_ming_fc27.nasl 9192 2018-03-23 14:54:27Z cfischer $
#
# Fedora Update for ming FEDORA-2018-38a0e1e6f5
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
  script_oid("1.3.6.1.4.1.25623.1.0.874262");
  script_version("$Revision: 9192 $");
  script_tag(name:"last_modification", value:"$Date: 2018-03-23 15:54:27 +0100 (Fri, 23 Mar 2018) $");
  script_tag(name:"creation_date", value:"2018-03-21 15:11:56 +0100 (Wed, 21 Mar 2018)");
  script_cve_id("CVE-2017-8782", "CVE-2017-9988", "CVE-2017-9989", "CVE-2017-11704", 
                "CVE-2017-11728", "CVE-2017-11729", "CVE-2017-11730", "CVE-2017-11731", 
                "CVE-2017-11732", "CVE-2017-11733", "CVE-2017-11734", "CVE-2017-16883", 
                "CVE-2017-16898", "CVE-2018-5251", "CVE-2018-5294", "CVE-2018-6315", 
                "CVE-2018-6359");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for ming FEDORA-2018-38a0e1e6f5");
  script_tag(name: "summary", value: "Check the version of ming");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Ming is a library for generating Macromedia 
Flash files (.swf), written in C, and includes useful utilities for working with 
.swf files.
");
  script_tag(name: "affected", value: "ming on Fedora 27");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2018-38a0e1e6f5");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/Z65NZJOBGTBW6Y3JD3IX5GIEKCRY7DQD");
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

  if ((res = isrpmvuln(pkg:"ming", rpm:"ming~0.4.8~5.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
