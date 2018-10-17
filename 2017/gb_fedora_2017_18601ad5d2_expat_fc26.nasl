###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2017_18601ad5d2_expat_fc26.nasl 10743 2018-08-03 02:50:31Z ckuersteiner $
#
# Fedora Update for expat FEDORA-2017-18601ad5d2
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
  script_oid("1.3.6.1.4.1.25623.1.0.873157");
  script_version("$Revision: 10743 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-03 04:50:31 +0200 (Fri, 03 Aug 2018) $");
  script_tag(name:"creation_date", value:"2017-08-04 12:47:00 +0530 (Fri, 04 Aug 2017)");
  script_cve_id("CVE-2016-9063", "CVE-2017-9233");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for expat FEDORA-2017-18601ad5d2");
  script_tag(name: "summary", value: "Check the version of expat");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "This is expat, the C library for parsing 
XML, written by James Clark. Expat is a stream oriented XML parser. This means 
that you register handlers with the parser prior to starting the parse. These 
handlers are called when the parser discovers the associated structures in the 
document being parsed. A start tag is an example of the kind of structures for 
which you may register handlers.");
  script_tag(name: "affected", value: "expat on Fedora 26");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-18601ad5d2");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/HZFH5HSDXUB3L3TWRID55EQPJOQCE5WU");
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

  if ((res = isrpmvuln(pkg:"expat", rpm:"expat~2.2.1~1.fc26", rls:"FC26")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
