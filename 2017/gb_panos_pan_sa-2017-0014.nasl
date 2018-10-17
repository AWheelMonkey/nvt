###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_panos_pan_sa-2017-0014.nasl 11835 2018-10-11 08:38:49Z mmartin $
#
# Palo Alto Networks PAN-OS CVE-2017-7945 Brute Force Vulnerability
#
# Authors:
# Tameem Eissa <tameem.eissa@greenbone.net>
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

CPE = 'cpe:/o:paloaltonetworks:pan-os';

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.107176");
  script_version("$Revision: 11835 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-11 10:38:49 +0200 (Thu, 11 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-05-19 12:42:40 +0200 (Fri, 19 May 2017)");

  script_cve_id("CVE-2017-7945");

  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

  script_tag(name:"qod_type", value:"package");

  script_name("Palo Alto Networks PAN-OS CVE-2017-7945 Brute Force Vulnerability");
  script_tag(name:"summary", value:"A vulnerability exists in PAN-OS GlobalProtect external interface that could allow for an attacker to brute force a username on PAN-OS GlobalProtect external Interface.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The vulnerability is caused by PAN-OS provided different responses when supplying login credentials. ");

  script_tag(name:"impact", value:"Successfully exploiting this issue would require an attacker to be authenticated.");
  script_tag(name:"affected", value:"PAN-OS 6.1.16 and earlier, PAN-OS 7.0.14 and earlier, PAN-OS 7.1.8 and earlier, PAN-OS 8.0.1 and earlier");

  script_tag(name:"solution", value:"Update to PAN-OS 6.1.17 and later, PAN-OS 7.0.15 and later, PAN-OS 7.1.9 and later, PAN-OS 8.0.2 and later");

  script_xref(name:"URL", value:"https://securityadvisories.paloaltonetworks.com/Home/Detail/84");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");

  script_family("Palo Alto PAN-OS Local Security Checks");

  script_dependencies("gb_palo_alto_panOS_version.nasl");
  script_mandatory_keys("palo_alto_pan_os/version");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!Ver = get_app_version(cpe:CPE, nofork:TRUE)){
  exit(0);
}

model = get_kb_item( "palo_alto_pan_os/model" );

if ( Ver =~"7\.0")
{
    if(version_is_less(version: Ver, test_version:"7.0.15"))
    {
      Vuln = TRUE;
      fix = "7.0.15";
    }
}
else if (Ver =~"7\.1")
{
    if(version_is_less(version: Ver, test_version:"7.1.9"))
    {
       Vuln = TRUE;
       fix = "7.1.9";
    }
}
else if (Ver =~"6\.1")
{
    if(version_is_less(version: Ver, test_version:"6.1.17"))
    {
       Vuln = TRUE;
       fix = "6.1.17";
    }
}
else if (Ver =~"8\.0")
{
    if(version_is_less(version: Ver, test_version:"8.0.2"))
    {
       Vuln = TRUE;
       fix = "8.0.2";
    }
}

if (Vuln)
{
    report =  report_fixed_ver(installed_version:Ver, fixed_version:fix);
    if ( model )
       report += '\nModel:              ' + model;

    security_message(port: 0, data:report);
    exit( 0 );
}

exit ( 99 );
