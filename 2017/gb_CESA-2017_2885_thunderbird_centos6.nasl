###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_CESA-2017_2885_thunderbird_centos6.nasl 7453 2017-10-17 06:34:30Z santu $
#
# CentOS Update for thunderbird CESA-2017:2885 centos6 
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
  script_oid("1.3.6.1.4.1.25623.1.0.882785");
  script_version("$Revision: 7453 $");
  script_tag(name:"last_modification", value:"$Date: 2017-10-17 08:34:30 +0200 (Tue, 17 Oct 2017) $");
  script_tag(name:"creation_date", value:"2017-10-13 08:35:31 +0200 (Fri, 13 Oct 2017)");
  script_cve_id("CVE-2017-7793", "CVE-2017-7810", "CVE-2017-7814", "CVE-2017-7818", 
                "CVE-2017-7819", "CVE-2017-7823", "CVE-2017-7824");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for thunderbird CESA-2017:2885 centos6 ");
  script_tag(name: "summary", value: "Check the version of thunderbird");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Mozilla Thunderbird is a standalone mail 
and newsgroup client.

This update upgrades Thunderbird to version 52.4.0.

Security Fix(es):

* Multiple flaws were found in the processing of malformed web content. A
web page containing malicious content could cause Thunderbird to crash or,
potentially, execute arbitrary code with the privileges of the user running
Thunderbird. (CVE-2017-7810, CVE-2017-7793, CVE-2017-7818, CVE-2017-7819,
CVE-2017-7824, CVE-2017-7814, CVE-2017-7823)

Red Hat would like to thank the Mozilla project for reporting these issues.
Upstream acknowledges Christoph Diehl, Jan de Mooij, Jason Kratzer, Randell
Jesup, Tom Ritter, Tyson Smith, Sebastian Hengst, Abhishek Arya, Nils,
Omair, Andre Weissflog, Francois Marier, and Jun Kokatsu as the original
reporters.
");
  script_tag(name: "affected", value: "thunderbird on CentOS 6");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2017:2885");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2017-October/022566.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
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

  if ((res = isrpmvuln(pkg:"thunderbird", rpm:"thunderbird~52.4.0~2.el6.centos", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
