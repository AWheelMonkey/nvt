###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2017_0306_1.nasl 12284 2018-11-09 12:37:21Z cfischer $
#
# SuSE Update for rabbitmq-server openSUSE-SU-2017:0306-1 (rabbitmq-server)
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
  script_oid("1.3.6.1.4.1.25623.1.0.851514");
  script_version("$Revision: 12284 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-09 13:37:21 +0100 (Fri, 09 Nov 2018) $");
  script_tag(name:"creation_date", value:"2017-02-22 15:18:58 +0100 (Wed, 22 Feb 2017)");
  script_cve_id("CVE-2016-9877");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for rabbitmq-server openSUSE-SU-2017:0306-1 (rabbitmq-server)");
  script_tag(name:"summary", value:"Check the version of rabbitmq-server");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"This update for rabbitmq-server fixes the following issue:

  - CVE-2016-9877: An issue in Pivotal RabbitMQ caused connection
  authentication with a username/password pair to succeed if an existing
  username was provided but the password is omitted from the connection
  request. Connections that use TLS with a client-provided certificate
  were not affected (bsc#1017642).");
  script_tag(name:"affected", value:"rabbitmq-server on openSUSE Leap 42.2");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"openSUSE-SU", value:"2017:0306_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSELeap42\.2");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);
res = "";

if(release == "openSUSELeap42.2")
{

  if ((res = isrpmvuln(pkg:"erlang-rabbitmq-client", rpm:"erlang-rabbitmq-client~3.5.8~3.2", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"rabbitmq-server", rpm:"rabbitmq-server~3.5.8~3.2", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"rabbitmq-server-plugins", rpm:"rabbitmq-server-plugins~3.5.8~3.2", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}