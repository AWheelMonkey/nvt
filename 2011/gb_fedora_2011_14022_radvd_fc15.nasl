###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for radvd FEDORA-2011-14022
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_insight = "radvd is the router advertisement daemon for IPv6.  It listens to router
  solicitations and sends router advertisements as described in &quot;Neighbor
  Discovery for IP Version 6 (IPv6)&quot; (RFC 2461).  With these advertisements
  hosts can automatically configure their addresses and some other
  parameters.  They also can choose a default router based on these
  advertisements.

  Install radvd if you are setting up IPv6 network and/or Mobile IPv6
  services.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "radvd on Fedora 15";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.fedoraproject.org/pipermail/package-announce/2011-October/068489.html");
  script_oid("1.3.6.1.4.1.25623.1.0.863601");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-10-31 13:45:00 +0100 (Mon, 31 Oct 2011)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_xref(name: "FEDORA", value: "2011-14022");
  script_cve_id("CVE-2011-3601", "CVE-2011-3602", "CVE-2011-3603", "CVE-2011-3604",
                "CVE-2011-3605");
  script_name("Fedora Update for radvd FEDORA-2011-14022");

  script_tag(name:"summary", value:"Check for the Version of radvd");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
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

if(release == "FC15")
{

  if ((res = isrpmvuln(pkg:"radvd", rpm:"radvd~1.8.2~2.fc15", rls:"FC15")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
