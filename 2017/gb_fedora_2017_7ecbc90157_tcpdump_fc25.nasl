###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for tcpdump FEDORA-2017-7ecbc90157
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
  script_oid("1.3.6.1.4.1.25623.1.0.872340");
  script_version("$Revision: 6634 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 09:32:24 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2017-02-20 11:37:42 +0100 (Mon, 20 Feb 2017)");
  script_cve_id("CVE-2016-7922", "CVE-2016-7923", "CVE-2016-7924", "CVE-2016-7925",
                "CVE-2016-7926", "CVE-2016-7927", "CVE-2016-7928", "CVE-2016-7929",
                "CVE-2016-7930", "CVE-2016-7931", "CVE-2016-7932", "CVE-2016-7933",
                "CVE-2016-7934", "CVE-2016-7935", "CVE-2016-7936", "CVE-2016-7937",
                "CVE-2016-7938", "CVE-2016-7939", "CVE-2016-7940", "CVE-2016-7973",
                "CVE-2016-7974", "CVE-2016-7975", "CVE-2016-7983", "CVE-2016-7984",
                "CVE-2016-7985", "CVE-2016-7986", "CVE-2016-7992", "CVE-2016-7993",
                "CVE-2016-8574", "CVE-2016-8575", "CVE-2017-5202", "CVE-2017-5203",
                "CVE-2017-5204", "CVE-2017-5205", "CVE-2017-5341", "CVE-2017-5342",
                "CVE-2017-5482", "CVE-2017-5483", "CVE-2017-5484", "CVE-2017-5485",
                "CVE-2017-5486");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for tcpdump FEDORA-2017-7ecbc90157");
  script_tag(name: "summary", value: "Check the version of tcpdump");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Tcpdump is a command-line tool for monitoring network traffic.
Tcpdump can capture and display the packet headers on a particular
network interface or on all interfaces.  Tcpdump can display all of
the packet headers, or just the ones that match particular criteria.

Install tcpdump if you need a program to monitor network traffic.
");
  script_tag(name: "affected", value: "tcpdump on Fedora 25");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-7ecbc90157");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/VBUINM5KB5DMV72ZZEFB5U6ZJTMG7SFO");
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

  if ((res = isrpmvuln(pkg:"tcpdump", rpm:"tcpdump~4.9.0~1.fc25", rls:"FC25")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}