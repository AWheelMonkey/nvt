###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_c3838931e1_libsoup_fc27.nasl 11180 2018-08-31 14:10:20Z mmartin $
#
# Fedora Update for libsoup FEDORA-2018-c3838931e1
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
  script_oid("1.3.6.1.4.1.25623.1.0.874777");
  script_version("$Revision: 11180 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-31 16:10:20 +0200 (Fri, 31 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-07-06 06:04:43 +0200 (Fri, 06 Jul 2018)");
  script_cve_id("CVE-2018-12910");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for libsoup FEDORA-2018-c3838931e1");
  script_tag(name:"summary", value:"Check the version of libsoup");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present 
on the target host.");
  script_tag(name:"insight", value:"Libsoup is an HTTP library implementation in C. 
It was originally part of a SOAP (Simple Object Access Protocol) implementation 
called Soup, but the SOAP and non-SOAP parts have now been split into separate 
packages.

libsoup uses the Glib main loop and is designed to work well with GTK
applications. This enables GNOME applications to access HTTP servers
on the network in a completely asynchronous fashion, very similar to
the Gtk+ programming model (a synchronous operation mode is also
supported for those who want it).
");
  script_tag(name:"affected", value:"libsoup on Fedora 27");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-c3838931e1");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LJ76WBT2X56NALAJM7ZWPFJRXJKBHJ4L");
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

  if ((res = isrpmvuln(pkg:"libsoup", rpm:"libsoup~2.60.3~2.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
