###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2017_88b6a06bce_selinux-policy_fc26.nasl 7558 2017-10-25 10:46:31Z santu $
#
# Fedora Update for selinux-policy FEDORA-2017-88b6a06bce
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
  script_oid("1.3.6.1.4.1.25623.1.0.873518");
  script_version("$Revision: 7558 $");
  script_tag(name:"last_modification", value:"$Date: 2017-10-25 12:46:31 +0200 (Wed, 25 Oct 2017) $");
  script_tag(name:"creation_date", value:"2017-10-21 09:52:55 +0200 (Sat, 21 Oct 2017)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for selinux-policy FEDORA-2017-88b6a06bce");
  script_tag(name: "summary", value: "Check the version of selinux-policy");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "SELinux Base package for SELinux Reference 
Policy - modular. Based off of reference policy: Checked out revision  2.20091117
");
  script_tag(name: "affected", value: "selinux-policy on Fedora 26");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-88b6a06bce");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/F46VCW2MTSJTSYA5MNFSVPHEEYVPVHDD");
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

if(release == "FC26")
{

  if ((res = isrpmvuln(pkg:"selinux-policy", rpm:"selinux-policy~3.13.1~260.13.fc26", rls:"FC26")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
