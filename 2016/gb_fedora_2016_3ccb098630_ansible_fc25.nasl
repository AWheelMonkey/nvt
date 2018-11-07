###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for ansible FEDORA-2016-3ccb098630
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.871982");
  script_version("$Revision: 11972 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-19 07:34:20 +0200 (Fri, 19 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-12-07 05:22:27 +0100 (Wed, 07 Dec 2016)");
  script_cve_id("CVE-2016-8614", "CVE-2016-8628");
  script_tag(name:"cvss_base", value:"9.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for ansible FEDORA-2016-3ccb098630");
  script_tag(name: "summary", value: "Check the version of ansible");

  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");

  script_tag(name: "insight", value: "Ansible is a radically simple model-driven
  configuration management, multi-node deployment, and remote task execution
  system. Ansible works over SSH and does not require any software or daemons
  to be installed on remote nodes. Extension modules can be written in any
  language and are transferred to managed machines automatically.");

  script_tag(name: "affected", value: "ansible on Fedora 25");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2016-3ccb098630");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/PMZYFQA4TFUUZGRH2S4QNJWZITCFAMSY");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
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

  if ((res = isrpmvuln(pkg:"ansible", rpm:"ansible~2.2.0.0~3.fc25", rls:"FC25")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
