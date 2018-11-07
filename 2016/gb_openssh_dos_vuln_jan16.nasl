###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_openssh_dos_vuln_jan16.nasl 12051 2018-10-24 09:14:54Z asteins $
#
# OpenSSH Denial of Service Vulnerability - Jan16
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:openbsd:openssh";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.806671");
  script_version("$Revision: 12051 $");
  script_cve_id("CVE-2016-1907");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-24 11:14:54 +0200 (Wed, 24 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-01-28 12:15:36 +0530 (Thu, 28 Jan 2016)");
  script_name("OpenSSH Denial of Service Vulnerability - Jan16");

  script_tag(name:"summary", value:"This host is installed with openssh and is prone
  to denial of service vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an error in
  'ssh_packet_read_poll2' function within 'packet.c' script.");

  script_tag(name:"impact", value:"Successfully exploiting this issue allow
  remote attackers to cause a denial of service (out-of-bounds read and application
  crash).");

  script_tag(name:"affected", value:"OpenSSH versions before 7.1p2");

  script_tag(name:"solution", value:"Upgrade to OpenSSH version 7.1p2 or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_xref(name:"URL", value:"http://www.openssh.com/txt/release-7.1p2");
  script_xref(name:"URL", value:"https://anongit.mindrot.org/openssh.git/commit/?id=2fecfd486bdba9f51b3a789277bb0733ca36e1c0");

  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Denial of Service");
  script_dependencies("ssh_detect.nasl");
  script_require_ports("Services/ssh", 22);
  script_mandatory_keys("openssh/detected");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(!sshPort = get_app_port(cpe:CPE)){
  exit(0);
}

if(!sshVer = get_app_version(cpe:CPE, port:sshPort)){
  exit(0);
}
if(version_is_less(version:sshVer, test_version:"7.1p2"))
{
  report = report_fixed_ver(installed_version:sshVer, fixed_version:'7.1p2');
  security_message(port:sshPort, data:report);
  exit(0);
}
