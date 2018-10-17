###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2017_9c29af2c64_lame_fc26.nasl 7635 2017-11-03 05:52:33Z teissa $
#
# Fedora Update for lame FEDORA-2017-9c29af2c64
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
  script_oid("1.3.6.1.4.1.25623.1.0.873552");
  script_version("$Revision: 7635 $");
  script_tag(name:"last_modification", value:"$Date: 2017-11-03 06:52:33 +0100 (Fri, 03 Nov 2017) $");
  script_tag(name:"creation_date", value:"2017-11-02 18:05:28 +0530 (Thu, 02 Nov 2017)");
  script_cve_id("CVE-2015-9099", "CVE-2015-9100", "CVE-2017-11720", "CVE-2017-13712", 
                "CVE-2017-15018", "CVE-2017-15019", "CVE-2017-15045", "CVE-2017-15046", 
                "CVE-2017-9410", "CVE-2017-9411", "CVE-2017-9412", "CVE-2017-8419");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for lame FEDORA-2017-9c29af2c64");
  script_tag(name: "summary", value: "Check the version of lame");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "LAME is an open source MP3 encoder whose 
quality and speed matches commercial encoders. LAME handles MPEG1,2 and 2.5 layer 
III encoding with both constant and variable bitrates.");
  script_tag(name: "affected", value: "lame on Fedora 26");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-9c29af2c64");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/Y4C44S3KMREUEPXI3KOGYZFGXUVVSHMV");
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

if(release == "FC26")
{

  if ((res = isrpmvuln(pkg:"lame", rpm:"lame~3.100~1.fc26", rls:"FC26")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
