###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_f97cb1c9b0_krb5_fc26.nasl 9296 2018-04-04 09:19:02Z cfischer $
#
# Fedora Update for krb5 FEDORA-2018-f97cb1c9b0
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
  script_oid("1.3.6.1.4.1.25623.1.0.874179");
  script_version("$Revision: 9296 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-04 11:19:02 +0200 (Wed, 04 Apr 2018) $");
  script_tag(name:"creation_date", value:"2018-03-02 08:46:07 +0100 (Fri, 02 Mar 2018)");
  script_cve_id("CVE-2018-5729", "CVE-2018-5730");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for krb5 FEDORA-2018-f97cb1c9b0");
  script_tag(name: "summary", value: "Check the version of krb5");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Kerberos V5 is a trusted-third-party network authentication system,
which can improve your network&#39 s security by eliminating the insecure
practice of sending passwords over the network in unencrypted form.
");
  script_tag(name: "affected", value: "krb5 on Fedora 26");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2018-f97cb1c9b0");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/OIFUL3CPM4S5TOXTTOCQ3CUZN6XCXUTR");
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

if(release == "FC26")
{

  if ((res = isrpmvuln(pkg:"krb5", rpm:"krb5~1.15.2~7.fc26", rls:"FC26")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}