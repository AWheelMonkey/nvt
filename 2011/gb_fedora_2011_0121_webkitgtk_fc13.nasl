###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for webkitgtk FEDORA-2011-0121
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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

include("revisions-lib.inc");
tag_affected = "webkitgtk on Fedora 13";
tag_insight = "WebKitGTK+ is the port of the portable web rendering engine WebKit to the
  GTK+ platform.";
tag_solution = "Please Install the Updated Packages.";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.fedoraproject.org/pipermail/package-announce/2011-January/052906.html");
  script_oid("1.3.6.1.4.1.25623.1.0.862779");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-01-11 16:07:49 +0100 (Tue, 11 Jan 2011)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name: "FEDORA", value: "2011-0121");
  script_cve_id("CVE-2010-1407", "CVE-2010-1405", "CVE-2010-1664", "CVE-2010-1421", "CVE-2010-1788", "CVE-2010-1760", "CVE-2010-1422", "CVE-2010-1665", "CVE-2010-1771", "CVE-2010-2264", "CVE-2010-2648", "CVE-2010-1784", "CVE-2010-1785", "CVE-2010-4198", "CVE-2010-1787", "CVE-2010-1780", "CVE-2010-1782", "CVE-2010-1807", "CVE-2010-4197", "CVE-2010-1774", "CVE-2010-1762", "CVE-2010-1386", "CVE-2010-1770", "CVE-2010-3812", "CVE-2010-3813", "CVE-2010-1761", "CVE-2010-3259", "CVE-2010-1416", "CVE-2010-1417", "CVE-2010-1418", "CVE-2010-3255", "CVE-2010-1773", "CVE-2010-3257", "CVE-2010-1786", "CVE-2010-1759", "CVE-2010-1767", "CVE-2010-3113", "CVE-2010-3116", "CVE-2010-3115", "CVE-2010-3114", "CVE-2010-3119", "CVE-2010-1758", "CVE-2010-1814", "CVE-2010-1815", "CVE-2010-1812", "CVE-2010-1793", "CVE-2010-1792", "CVE-2010-1791", "CVE-2010-1790", "CVE-2010-4206", "CVE-2010-4204", "CVE-2010-1772", "CVE-2010-1392", "CVE-2010-4577");
  script_name("Fedora Update for webkitgtk FEDORA-2011-0121");

  script_tag(name:"summary", value:"Check for the Version of webkitgtk");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");


res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC13")
{

  if ((res = isrpmvuln(pkg:"webkitgtk", rpm:"webkitgtk~1.2.6~1.fc13", rls:"FC13")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}