###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_VMSA-2016-0002.nasl 11640 2018-09-27 07:15:20Z asteins $
#
# VMSA-2016-0002: VMware product updates address a critical glibc security vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
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
  script_oid("1.3.6.1.4.1.25623.1.0.105560");
  script_cve_id("CVE-2015-7547");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_version("$Revision: 11640 $");
  script_name("VMSA-2016-0002: VMware product updates address a critical glibc security vulnerability");

  script_xref(name:"URL", value:"http://www.vmware.com/security/advisories/VMSA-2016-0002.html");

  script_tag(name:"vuldetect", value:"Checks for missing patches.");

  script_tag(name:"insight", value:"a. glibc update for multiple products.
The glibc library has been updated in multiple products to resolve a stack buffer overflow present in the glibc getaddrinfo function.");

  script_tag(name:"solution", value:"Apply the missing patch(es).");

  script_tag(name:"summary", value:"VMware product updates address a critical glibc security vulnerability ");

  script_tag(name:"affected", value:"ESXi 6.0 without patch ESXi600-201602401-SG
ESXi 5.5 without patch ESXi550-201602401-SG ");

  script_tag(name:"last_modification", value:"$Date: 2018-09-27 09:15:20 +0200 (Thu, 27 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-02-24 15:23:40 +0100 (Wed, 24 Feb 2016)");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_family("VMware Local Security Checks");
  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_dependencies("gb_vmware_esxi_init.nasl");
  script_mandatory_keys("VMware/ESXi/LSC", "VMware/ESX/version");

 exit(0);

}

include("vmware_esx.inc");
include("version_func.inc");

if( ! get_kb_item( 'VMware/ESXi/LSC' ) ) exit( 0 );
if( ! esxVersion = get_kb_item( "VMware/ESX/version" ) ) exit( 0 );

patches = make_array( "6.0.0", "VIB:esx-base:6.0.0-1.29.3568940",
                      "5.5.0", "VIB:esx-base:5.5.0-3.84.3568722");

if( ! patches[esxVersion] ) exit( 0 );

if( _esxi_patch_missing( esxi_version:esxVersion, patch:patches[esxVersion] ) )
{
  security_message(port:0);
  exit(0);

}

exit(99);

