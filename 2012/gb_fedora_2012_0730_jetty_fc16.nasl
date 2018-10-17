###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for jetty FEDORA-2012-0730
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_affected = "jetty on Fedora 16";
tag_insight = "Jetty is a 100% Java HTTP Server and Servlet Container.
  This means that you do not need to configure and run a
  separate web server (like Apache) in order to use java,
  servlets and JSPs to generate dynamic content. Jetty is
  a fully featured web server for static and dynamic content.
  Unlike separate server/container solutions, this means
  that your web server and web application run in the same
  process, without interconnection overheads and complications.
  Furthermore, as a pure java component, Jetty can be simply
  included in your application for demonstration, distribution
  or deployment. Jetty is available on all Java supported
  platforms.";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.fedoraproject.org/pipermail/package-announce/2012-March/076411.html");
  script_oid("1.3.6.1.4.1.25623.1.0.864103");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-03-26 14:16:31 +0530 (Mon, 26 Mar 2012)");
  script_cve_id("CVE-2011-4461");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_xref(name: "FEDORA", value: "2012-0730");
  script_name("Fedora Update for jetty FEDORA-2012-0730");

  script_tag(name: "summary" , value: "Check for the Version of jetty");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
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

if(release == "FC16")
{

  if ((res = isrpmvuln(pkg:"jetty", rpm:"jetty~6.1.26~8.fc16", rls:"FC16")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}