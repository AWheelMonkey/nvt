###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for mediawiki FEDORA-2015-24
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.806583");
  script_version("$Revision: 8493 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-23 07:43:13 +0100 (Tue, 23 Jan 2018) $");
  script_tag(name:"creation_date", value:"2015-11-06 06:01:15 +0100 (Fri, 06 Nov 2015)");
  script_cve_id("CVE-2015-8001", "CVE-2015-8002", "CVE-2015-8003", "CVE-2015-8004",
                "CVE-2015-8005", "CVE-2015-8006", "CVE-2015-8007", "CVE-2015-8008",
                "CVE-2015-8009");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for mediawiki FEDORA-2015-24");
  script_tag(name: "summary", value: "Check the version of mediawiki");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "MediaWiki is the software used for
Wikipedia and the other Wikimedia Foundation websites. Compared to other wikis,
it has an excellent range of features and support for high-traffic websites
using multiple servers

This package supports wiki farms. Read the instructions for creating wiki
instances under /usr/share/doc/mediawiki/README.RPM.
Remember to remove the config dir after completing the configuration.
");
  script_tag(name: "affected", value: "mediawiki on Fedora 22");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "FEDORA", value: "2015-24");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2015-November/171007.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
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

if(release == "FC22")
{

  if ((res = isrpmvuln(pkg:"mediawiki", rpm:"mediawiki~1.25.3~1.fc22", rls:"FC22")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
