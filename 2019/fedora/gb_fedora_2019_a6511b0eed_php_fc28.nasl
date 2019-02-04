###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2019_a6511b0eed_php_fc28.nasl 13255 2019-01-24 07:43:16Z mmartin $
#
# Fedora Update for php FEDORA-2019-a6511b0eed
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2019 Greenbone Networks GmbH, http://www.greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
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
  script_oid("1.3.6.1.4.1.25623.1.0.875418");
  script_version("$Revision: 13255 $");
  script_cve_id("CVE-2018-19935");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2019-01-24 08:43:16 +0100 (Thu, 24 Jan 2019) $");
  script_tag(name:"creation_date", value:"2019-01-19 04:04:35 +0100 (Sat, 19 Jan 2019)");
  script_name("Fedora Update for php FEDORA-2019-a6511b0eed");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");

  script_xref(name:"FEDORA", value:"2019-a6511b0eed");
  script_xref(name:"URL", value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/KPJD6UJK4UTRP4JJGAPUBHK6UB7B46IC");

  script_tag(name:"summary", value:"The remote host is missing an update for
  the 'php' package(s) announced via the FEDORA-2019-a6511b0eed advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present
  on the target host.");

  script_tag(name:"insight", value:"PHP is an HTML-embedded scripting language.
  PHP attempts to make it easy for developers to write dynamically generated web
  pages. PHP also offers built-in database integration for several commercial and
  non-commercial database management systems, so writing a database-enabled
  webpage with PHP is fairly simple. The most common use of PHP coding is probably
  as a replacement for CGI scripts.

The php package contains the module (often referred to as mod_php)
which adds support for the PHP language to Apache HTTP Server.
");

  script_tag(name:"affected", value:"php on Fedora 28.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "FC28")
{

  if ((res = isrpmvuln(pkg:"php", rpm:"php~7.2.14~1.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
