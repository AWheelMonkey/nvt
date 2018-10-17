###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_55b7018374_mailman_fc27.nasl 9141 2018-03-20 06:46:48Z cfischer $
#
# Fedora Update for mailman FEDORA-2018-55b7018374
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.874239");
  script_version("$Revision: 9141 $");
  script_tag(name:"last_modification", value:"$Date: 2018-03-20 07:46:48 +0100 (Tue, 20 Mar 2018) $");
  script_tag(name:"creation_date", value:"2018-03-17 08:51:04 +0100 (Sat, 17 Mar 2018)");
  script_cve_id("CVE-2016-6893", "CVE-2018-5950");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for mailman FEDORA-2018-55b7018374");
  script_tag(name: "summary", value: "Check the version of mailman");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Mailman is software to help manage email 
discussion lists, much like Majordomo and Smartmail. Unlike most similar 
products, Mailman gives each mailing list a webpage, and allows users to subscribe,
unsubscribe, etc. over the Web. Even the list manager can administer
his or her list entirely from the Web. Mailman also integrates most
things people want to do with mailing lists, including archiving, mail
 -  news gateways, and so on.

Documentation can be found in: /usr/share/doc/mailman

When the package has finished installing, you will need to perform some
additional installation steps, these are described in:
/usr/share/doc/mailman/INSTALL.REDHAT
");
  script_tag(name: "affected", value: "mailman on Fedora 27");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2018-55b7018374");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/D2AEL7JYG6A6XX44ML5ICTKMTP4D62ZG");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
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

if(release == "FC27")
{

  if ((res = isrpmvuln(pkg:"mailman", rpm:"mailman~2.1.21~8.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
