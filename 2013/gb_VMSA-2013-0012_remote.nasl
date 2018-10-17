###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_VMSA-2013-0012_remote.nasl 11056 2018-08-20 13:34:00Z mmartin $
#
# VMSA-2013-0012 VMware vSphere updates address multiple vulnerabilities (remote check)
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
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

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.103847");
  script_cve_id("CVE-2013-5970", "CVE-2013-5971");
  script_tag(name:"cvss_base", value:"7.1");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:C");
  script_version("$Revision: 11056 $");
  script_name("VMSA-2013-0012 VMware vSphere updates address multiple vulnerabilities (remote check)");


  script_xref(name:"URL", value:"http://www.vmware.com/security/advisories/VMSA-2013-0012.html");

  script_tag(name:"last_modification", value:"$Date: 2018-08-20 15:34:00 +0200 (Mon, 20 Aug 2018) $");
  script_tag(name:"creation_date", value:"2013-12-03 14:04:01 +0100 (Tue, 03 Dec 2013)");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_copyright("This script is Copyright (C) 2013 Greenbone Networks GmbH");
  script_dependencies("gb_vmware_esx_web_detect.nasl");
  script_mandatory_keys("VMware/ESX/build", "VMware/ESX/version");

  script_tag(name:"vuldetect", value:"Check the build number.");
  script_tag(name:"insight", value:"a. VMware ESXi and ESX contain a vulnerability in hostd-vmdb.

To exploit this vulnerability, an attacker must intercept and
modify the management traffic. Exploitation of the issue may lead
to a Denial of Service of the hostd-vmdb service.

To reduce the likelihood of exploitation, vSphere components
should be deployed on an isolated management network.

b. VMware vSphere Web Client Server Session Fixation Vulnerability

The VMware vSphere Web Client Server contains a vulnerability in
the handling of session IDs. To exploit this vulnerability, an
attacker must know a valid session ID of an authenticated user.
Exploitation of the issue may lead to Elevation of Privilege.

To reduce the likelihood of exploitation, vSphere components
should be deployed on an isolated management network.

c. vCenter and Update Manager, Oracle JRE update 1.6.0_51.

Oracle JRE is updated to version 1.6.0_51, which addresses
multiple security issues that existed in earlier releases of
Oracle JRE.

Oracle has documented the CVE identifiers that are addressed
in JRE 1.6.0_51 in the Oracle Java SE Critical Patch Update
Advisory of June 2013. The References section provides a
link to this advisory.");
  script_tag(name:"solution", value:"Apply the missing patch(es).");
  script_tag(name:"summary", value:"VMware has updated vCenter Server, vCenter Server Appliance (vCSA),
vSphere Update Manager (VUM), ESXi and ESX to address multiple security
vulnerabilities.");
  script_tag(name:"affected", value:"VMware vCenter Server before 5.0 update 3

VMware Update Manager before 5.0 update 3

VMware ESXi 5.0 without patch ESXi500-201310101-SG
VMware ESXi 4.1 without patch ESXi410-201307401-SG
VMware ESXi 4.0 without patch ESXi400-201305401-SG

VMware ESX 4.1 without patch ESX410-201307401-SG
VMware ESX 4.0 without patch ESX400-201305401-SG");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

 exit(0);

}

include("vmware_esx.inc");

if(!esxVersion = get_kb_item("VMware/ESX/version"))exit(0);
if(!esxBuild = get_kb_item("VMware/ESX/build"))exit(0);

fixed_builds = make_array("5.0.0","1311177");
if(!fixed_builds[esxVersion])exit(0);

if(int(esxBuild) < int(fixed_builds[esxVersion])) {
  security_message(port:0, data: esxi_remote_report(ver:esxVersion, build: esxBuild, fixed_build: fixed_builds[esxVersion]));
  exit(0);
}

exit(99);






