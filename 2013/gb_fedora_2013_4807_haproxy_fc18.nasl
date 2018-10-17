###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for haproxy FEDORA-2013-4807
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_solution = "Please Install the Updated Packages.";
tag_insight = "HA-Proxy is a TCP/HTTP reverse proxy which is particularly suited for high
  availability environments. Indeed, it can:
  - route HTTP requests depending on statically assigned cookies
  - spread the load among several servers while assuring server persistence
    through the use of HTTP cookies
  - switch to backup servers in the event a main one fails
  - accept connections to special ports dedicated to service monitoring
  - stop accepting connections without breaking existing ones
  - add/modify/delete HTTP headers both ways
  - block requests matching a particular pattern";
tag_affected = "haproxy on Fedora 18";


if(description)
{
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_oid("1.3.6.1.4.1.25623.1.0.865584");
  script_version("$Revision: 9353 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-05-03 09:52:51 +0530 (Fri, 03 May 2013)");
  script_cve_id("CVE-2013-1912");
  script_tag(name:"cvss_base", value:"5.1");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_name("Fedora Update for haproxy FEDORA-2013-4807");

  script_xref(name: "FEDORA", value: "2013-4807");
  script_xref(name: "URL" , value: "http://lists.fedoraproject.org/pipermail/package-announce/2013-April/103730.html");
  script_tag(name: "summary" , value: "Check for the Version of haproxy");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC18")
{

  if ((res = isrpmvuln(pkg:"haproxy", rpm:"haproxy~1.4.23~1.fc18", rls:"FC18")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
