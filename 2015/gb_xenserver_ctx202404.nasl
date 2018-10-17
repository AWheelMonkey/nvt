###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_xenserver_ctx202404.nasl 11872 2018-10-12 11:22:41Z cfischer $
#
# Citrix XenServer Multiple Security Updates (CTX202404)
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH
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

CPE = "cpe:/a:citrix:xenserver";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.105466");
  script_cve_id("CVE-2015-7835", "CVE-2015-7969", "CVE-2015-7970", "CVE-2015-7971", "CVE-2015-7972");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_version("$Revision: 11872 $");

  script_name("Citrix XenServer Multiple Security Updates (CTX202404)");

  script_xref(name:"URL", value:"http://support.citrix.com/article/CTX202404");

  script_tag(name:"vuldetect", value:"Check the installed hotfixes");
  script_tag(name:"solution", value:"Apply the hotfix referenced in the advisory.");

  script_tag(name:"summary", value:"A number of security vulnerabilities have been identified in Citrix XenServer that may allow a malicious administrator of a guest VM to compromise the host and guest users to crash the host. These vulnerabilities affect all currently supported versions of Citrix XenServer up to and including Citrix XenServer 6.5 Service Pack 1.
The following vulnerabilities have been addressed:

CVE-2015-7835 (High): Uncontrolled creation of large page mappings by PV guests
CVE-2015-7969 (Low): Leak of main per-domain vcpu pointer array/Leak of per-domain profiling-related vcpu pointer array
CVE-2015-7970 (Medium): Host crash when migrating a PoD VM
CVE-2015-7971 (Low): Some pmu and profiling hypercalls log without rate limiting
CVE-2015-7972 (Low): Populate-on-demand balloon size inaccuracy can crash guests");
  script_tag(name:"affected", value:"Citrix XenServer up to and including Citrix XenServer 6.5 Service Pack 1");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:22:41 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2015-11-26 12:29:16 +0100 (Thu, 26 Nov 2015)");
  script_category(ACT_GATHER_INFO);
  script_family("Citrix Xenserver Local Security Checks");
  script_copyright("This script is Copyright (C) 2015 Greenbone Networks GmbH");
  script_dependencies("gb_xenserver_version.nasl");
  script_mandatory_keys("xenserver/product_version", "xenserver/patches");

  exit(0);
}

include("host_details.inc");
include("misc_func.inc");
include("citrix_version_func.inc");

if( ! version = get_app_version( cpe:CPE ) ) exit( 0 );

if( ! hotfixes = get_kb_item("xenserver/patches") ) exit( 0 );

patches = make_array();

patches['6.5.0'] = make_list( 'XS65ESP1014', 'XS65E015' );
patches['6.2.0'] = make_list( 'XS62ESP1033' );
patches['6.1.0'] = make_list( 'XS61E059' );
patches['6.0.2'] = make_list( 'XS602E047', 'XS602ECC023' );
patches['6.0.0'] = make_list( 'XS60E052' );

report_if_citrix_xenserver_is_vulnerable( version:version,
                                          hotfixes:hotfixes,
                                          patches:patches );

exit( 99 );

