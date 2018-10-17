###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_6020628437_thunderbird-enigmail_fc26.nasl 10374 2018-07-02 04:44:41Z asteins $
#
# Fedora Update for thunderbird-enigmail FEDORA-2018-6020628437
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
  script_oid("1.3.6.1.4.1.25623.1.0.874615");
  script_version("$Revision: 10374 $");
  script_tag(name:"last_modification", value:"$Date: 2018-07-02 06:44:41 +0200 (Mon, 02 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-05-28 05:53:42 +0200 (Mon, 28 May 2018)");
  script_cve_id("CVE-2017-17688", "CVE-2017-17689");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for thunderbird-enigmail FEDORA-2018-6020628437");
  script_tag(name:"summary", value:"Check the version of thunderbird-enigmail");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present 
on the target host.");
  script_tag(name:"insight", value:"Enigmail is an extension to the mail client 
Mozilla Thunderbird which allows users to access the authentication and encryption
features provided by GnuPG
");
  script_tag(name:"affected", value:"thunderbird-enigmail on Fedora 26");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-6020628437");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/FWIR75AEHUD3Y4WUJOSWSVJ32W4XR2UK");
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

  if ((res = isrpmvuln(pkg:"thunderbird-enigmail", rpm:"thunderbird-enigmail~2.0.4~1.fc26", rls:"FC26")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
