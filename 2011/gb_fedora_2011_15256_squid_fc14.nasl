###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for squid FEDORA-2011-15256
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
tag_insight = "Squid is a high-performance proxy caching server for Web clients,
  supporting FTP, gopher, and HTTP data objects. Unlike traditional
  caching software, Squid handles all requests in a single,
  non-blocking, I/O-driven process. Squid keeps meta data and especially
  hot objects cached in RAM, caches DNS lookups, supports non-blocking
  DNS lookups, and implements negative caching of failed requests.

  Squid consists of a main server program squid, a Domain Name System
  lookup program (dnsserver), a program for retrieving FTP data
  (ftpget), and some management and client tools.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "squid on Fedora 14";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.fedoraproject.org/pipermail/package-announce/2011-November/069398.html");
  script_oid("1.3.6.1.4.1.25623.1.0.863624");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-11-18 09:44:59 +0530 (Fri, 18 Nov 2011)");
  script_xref(name: "FEDORA", value: "2011-15256");
  script_cve_id("CVE-2011-4096");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_name("Fedora Update for squid FEDORA-2011-15256");

  script_tag(name:"summary", value:"Check for the Version of squid");
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

if(release == "FC14")
{

  if ((res = isrpmvuln(pkg:"squid", rpm:"squid~3.1.16~1.fc14", rls:"FC14")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
