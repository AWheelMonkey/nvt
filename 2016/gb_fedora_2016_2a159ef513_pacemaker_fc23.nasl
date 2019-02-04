###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for pacemaker FEDORA-2016-2a159ef513
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
  script_oid("1.3.6.1.4.1.25623.1.0.810188");
  script_version("$Revision: 13012 $");
  script_tag(name:"last_modification", value:"$Date: 2019-01-10 09:11:33 +0100 (Thu, 10 Jan 2019) $");
  script_tag(name:"creation_date", value:"2016-12-02 14:06:35 +0100 (Fri, 02 Dec 2016)");
  script_cve_id("CVE-2016-7035");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for pacemaker FEDORA-2016-2a159ef513");
  script_tag(name: "summary", value: "Check the version of pacemaker");

  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");

  script_tag(name: "insight", value: "Pacemaker is an advanced, scalable High
  -Availability cluster resource manager for Corosync, CMAN and/or Linux-HA.

  It supports more than 16 node clusters with significant capabilities
  for managing resources and dependencies.

  It will run scripts at initialization, when machines go up or down,
  when related resources fail and can be configured to periodically check
  resource health.

  Available rpmbuild rebuild options:
  --with(out) : doc coverage profiling upstart_job");

  script_tag(name: "affected", value: "pacemaker on Fedora 23");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2016-2a159ef513");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/274QI7QA2K2AKV45N5UJVKS4NBRW4MUX");
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

if(release == "FC23")
{

  if ((res = isrpmvuln(pkg:"pacemaker", rpm:"pacemaker~1.1.15~2.fc23", rls:"FC23")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
