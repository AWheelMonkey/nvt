###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2019_9eb0ae6296_openssh_fc28.nasl 13394 2019-02-01 07:36:10Z mmartin $
#
# Fedora Update for openssh FEDORA-2019-9eb0ae6296
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
  script_oid("1.3.6.1.4.1.25623.1.0.875424");
  script_version("$Revision: 13394 $");
  script_cve_id("CVE-2018-20685");
  script_tag(name:"cvss_base", value:"2.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2019-02-01 08:36:10 +0100 (Fri, 01 Feb 2019) $");
  script_tag(name:"creation_date", value:"2019-01-22 04:06:22 +0100 (Tue, 22 Jan 2019)");
  script_name("Fedora Update for openssh FEDORA-2019-9eb0ae6296");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");

  script_xref(name:"FEDORA", value:"2019-9eb0ae6296");
  script_xref(name:"URL", value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/BWZ5P5HFSLUCVEZJ3HHAVQMAHDE6FYQY");

  script_tag(name:"summary", value:"The remote host is missing an update for the
  'openssh' package(s) announced via the FEDORA-2019-9eb0ae6296 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is
  present on the target host.");

  script_tag(name:"insight", value:"SSH (Secure SHell) is a program for logging
  into and executing commands on a remote machine. SSH is intended to replace
  rlogin and rsh, and to provide secure encrypted communications between two
  untrusted hosts over an insecure network. X11 connections and arbitrary TCP/IP
  ports can also be forwarded over the secure channel.

OpenSSH is OpenBSD&#39 s version of the last free version of SSH, bringing
it up to date in terms of security and features.

This package includes the core files necessary for both the OpenSSH
client and server. To make this package useful, you should also
install openssh-clients, openssh-server, or both.
");

  script_tag(name:"affected", value:"openssh on Fedora 28.");

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

  if ((res = isrpmvuln(pkg:"openssh", rpm:"openssh~7.8p1~4.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
