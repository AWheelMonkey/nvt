###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2017_ed31e1f941_freerdp_fc25.nasl 10012 2018-05-30 03:37:26Z ckuersteiner $
#
# Fedora Update for freerdp FEDORA-2017-ed31e1f941
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
  script_oid("1.3.6.1.4.1.25623.1.0.873225");
  script_version("$Revision: 10012 $");
  script_tag(name:"last_modification", value:"$Date: 2018-05-30 05:37:26 +0200 (Wed, 30 May 2018) $");
  script_tag(name:"creation_date", value:"2017-08-08 07:36:21 +0200 (Tue, 08 Aug 2017)");
  script_cve_id("CVE-2017-2836", "CVE-2017-2837", "CVE-2017-2838", "CVE-2017-2839",
                "CVE-2017-2835", "CVE-2017-2834");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for freerdp FEDORA-2017-ed31e1f941");
  script_tag(name: "summary", value: "Check the version of freerdp");
  script_tag(name: "vuldetect", value: "Checks if a vulnerable version is present on the target host.");
  script_tag(name: "insight", value: "The xfreerdp Remote Desktop Protocol (RDP)
client from the FreeRDP project.

xfreerdp can connect to RDP servers such as Microsoft Windows machines, xrdp and
VirtualBox.
");
  script_tag(name: "affected", value: "freerdp on Fedora 25");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-ed31e1f941");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/JUJDOXW3GPYZOIAITVUF5GBUYCFQMLNP");
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

if(release == "FC25")
{

  if ((res = isrpmvuln(pkg:"freerdp", rpm:"freerdp~2.0.0~31.20170724gitf8c9f43.fc25", rls:"FC25")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
