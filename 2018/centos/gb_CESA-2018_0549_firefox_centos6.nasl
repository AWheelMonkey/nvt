###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_CESA-2018_0549_firefox_centos6.nasl 10965 2018-08-15 03:42:43Z ckuersteiner $
#
# CentOS Update for firefox CESA-2018:0549 centos6 
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
  script_oid("1.3.6.1.4.1.25623.1.0.882863");
  script_version("$Revision: 10965 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-15 05:42:43 +0200 (Wed, 15 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-03-21 08:50:32 +0100 (Wed, 21 Mar 2018)");
  script_cve_id("CVE-2018-5146");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for firefox CESA-2018:0549 centos6 ");
  script_tag(name: "summary", value: "Check the version of firefox");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Mozilla Firefox is an open-source web
  browser, designed for standards compliance, performance, and portability.

This update upgrades Firefox to version 52.7.2 ESR.

Security Fix(es):

* Mozilla: Vorbis audio processing out of bounds write (MFSA 2018-08)
(CVE-2018-5146)

For more details about the security issue(s), including the impact, a CVSS
score, acknowledgments, and other related information, refer to the CVE
page(s) listed in the References section.
");
  script_tag(name: "affected", value: "firefox on CentOS 6");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2018:0549");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2018-March/022807.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"firefox", rpm:"firefox~52.7.2~1.el6.centos", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
