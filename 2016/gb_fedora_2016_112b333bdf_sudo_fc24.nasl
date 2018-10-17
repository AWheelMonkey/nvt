###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for sudo FEDORA-2016-112b333bdf
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
  script_oid("1.3.6.1.4.1.25623.1.0.810132");
  script_version("$Revision: 10495 $");
  script_tag(name:"last_modification", value:"$Date: 2018-07-13 08:13:03 +0200 (Fri, 13 Jul 2018) $");
  script_tag(name:"creation_date", value:"2016-12-02 14:04:19 +0100 (Fri, 02 Dec 2016)");
  script_cve_id("CVE-2016-7076");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for sudo FEDORA-2016-112b333bdf");
  script_tag(name: "summary", value: "Check the version of sudo");

  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");

  script_tag(name: "insight", value: "Sudo (superuser do) allows a system
  administrator to give certain users (or groups of users) the ability to
  run some (or all) commands as root while logging all commands and arguments.
  Sudo operates on a per-command basis.  It is not a replacement for the shell.
  Features include: the ability to restrict what commands a user may run on a
  per-host basis, copious logging of each command (providing a clear
  audit trail of who did what), a configurable timeout of the sudo
  command, and the ability to use the same configuration file (sudoers)
  on many different machines.");

  script_tag(name: "affected", value: "sudo on Fedora 24");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2016-112b333bdf");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/DBELDP5KT7URCP7P3RQFYBBKPBNLAJY6");
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

if(release == "FC24")
{

  if ((res = isrpmvuln(pkg:"sudo", rpm:"sudo~1.8.18p1~1.fc24", rls:"FC24")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}