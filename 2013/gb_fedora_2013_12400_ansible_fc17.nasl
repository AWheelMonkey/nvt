###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for ansible FEDORA-2013-12400
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.866071");
  script_version("$Revision: 10148 $");
  script_tag(name:"last_modification", value:"$Date: 2018-06-11 05:14:29 +0200 (Mon, 11 Jun 2018) $");
  script_tag(name:"creation_date", value:"2013-07-16 10:17:41 +0530 (Tue, 16 Jul 2013)");
  script_cve_id("CVE-2013-2233");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:N");
  script_name("Fedora Update for ansible FEDORA-2013-12400");

  script_xref(name: "FEDORA", value: "2013-12400");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2013-July/111624.html");
  script_tag(name: "summary" , value: "Check for the Version of ansible");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  script_tag(name : "affected" , value : "ansible on Fedora 17");
  script_tag(name : "insight" , value : "Ansible is a radically simple model-driven configuration management,
  multi-node deployment, and remote task execution system. Ansible works
  over SSH and does not require any software or daemons to be installed
  on remote nodes. Extension modules can be written in any language and
  are transferred to managed machines automatically.");
  script_tag(name : "solution" , value : "Please Install the Updated Packages.");
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

if(release == "FC17")
{

  if ((res = isrpmvuln(pkg:"ansible", rpm:"ansible~1.2.2~1.fc17", rls:"FC17")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
