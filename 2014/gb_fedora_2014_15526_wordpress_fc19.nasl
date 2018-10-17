###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for wordpress FEDORA-2014-15526
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.868539");
  script_version("$Revision: 6750 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-18 11:56:47 +0200 (Tue, 18 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-12-03 06:34:33 +0100 (Wed, 03 Dec 2014)");
  script_cve_id("CVE-2014-0165", "CVE-2014-0166", "CVE-2013-4338", "CVE-2013-4339",
                "CVE-2013-4340", "CVE-2013-2173", "CVE-2013-2199", "CVE-2013-2200",
                "CVE-2013-2201", "CVE-2013-2202", "CVE-2013-2203", "CVE-2013-2204",
                "CVE-2014-9031", "CVE-2014-9032", "CVE-2014-9033", "CVE-2014-9034",
                "CVE-2014-9035", "CVE-2014-9036", "CVE-2014-9037", "CVE-2014-9038",
                "CVE-2014-9039");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("Fedora Update for wordpress FEDORA-2014-15526");
  script_tag(name: "summary", value: "Check the version of wordpress");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Wordpress is an online publishing / weblog package that makes it very easy,
almost trivial, to get information out to people on the web.

Important information in /usr/share/doc/wordpress-4.0.1/README.fedora
");
  script_tag(name: "affected", value: "wordpress on Fedora 19");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "FEDORA", value: "2014-15526");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2014-December/145140.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
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

if(release == "FC19")
{

  if ((res = isrpmvuln(pkg:"wordpress", rpm:"wordpress~4.0.1~1.fc19", rls:"FC19")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
