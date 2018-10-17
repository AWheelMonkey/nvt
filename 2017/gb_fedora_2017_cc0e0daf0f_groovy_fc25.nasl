###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for groovy FEDORA-2017-cc0e0daf0f
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
  script_oid("1.3.6.1.4.1.25623.1.0.872286");
  script_version("$Revision: 8746 $");
  script_tag(name:"last_modification", value:"$Date: 2018-02-09 15:31:43 +0100 (Fri, 09 Feb 2018) $");
  script_tag(name:"creation_date", value:"2017-01-22 05:41:52 +0100 (Sun, 22 Jan 2017)");
  script_cve_id("CVE-2016-6814");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for groovy FEDORA-2017-cc0e0daf0f");
  script_tag(name: "summary", value: "Check the version of groovy");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Groovy is an agile and dynamic language for
  the Java Virtual Machine, built upon Java with features inspired by languages
  like Python, Ruby and Smalltalk.  It seamlessly integrates with all existing Java
  objects and libraries and compiles straight to Java bytecode so you can use it
  anywhere you can use Java.");
  script_tag(name: "affected", value: "groovy on Fedora 25");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-cc0e0daf0f");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/GLUK73YU2ETK7USTPIIC4YQT3BYKGEOB");
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

  if ((res = isrpmvuln(pkg:"groovy", rpm:"groovy~2.4.5~10.fc25", rls:"FC25")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
