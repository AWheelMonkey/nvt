###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_dlink_dir_hnap_bo_vuln.nasl 11936 2018-10-17 09:05:37Z mmartin $
#
# D-Link DIR Routers HNAP Buffer Overflow Vulnerability
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
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
  script_oid("1.3.6.1.4.1.25623.1.0.106587");
  script_version("$Revision: 11936 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-17 11:05:37 +0200 (Wed, 17 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-02-14 13:49:17 +0700 (Tue, 14 Feb 2017)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");

  script_cve_id("CVE-2016-6563");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("D-Link DIR Routers HNAP Buffer Overflow Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_dlink_dir_detect.nasl");
  script_mandatory_keys("host_is_dlink_dir", "dlink_hw_version");

  script_tag(name:"summary", value:"Several D-Link DIR Routers are prone to a buffer overflow vulnerability in
HNAP.");

  script_tag(name:"vuldetect", value:"Checks the version.");

  script_tag(name:"insight", value:"Processing malformed SOAP messages when performing the HNAP Login action
causes a buffer overflow in the stack. The vulnerable XML fields within the SOAP body are: Action, Username,
LoginPassword, and Captcha.");

  script_tag(name:"affected", value:"D-Link DIR-885L, DIR-895L, DIR-890L, DIR-880L, DIR-868L, DIR-869, DIR-879,
DIR-859, DIR-822, DIR-823, DIR-818L.");

  script_tag(name:"solution", value:"Upgrade to the latest firmware.");

  script_xref(name:"URL", value:"http://supportannouncement.us.dlink.com/announcement/publication.aspx?name=SAP10066");

  exit(0);
}

include("version_func.inc");

port = get_kb_item("dlink_dir_port");
if (!port)
  exit(0);

typ = get_kb_item("dlink_typ");
if (!typ)
  exit(0);

version = get_kb_item("dlink_fw_version");
if (!version)
  exit(0);

hw_version = get_kb_item("dlink_hw_version");
if (!hw_version)
  exit(0);

if (typ == "DIR-885L" || typ == "DIR-895L") {
  if (hw_version == "A1" && version_is_less(version: version, test_version: "1.12")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "1.12");
    security_message(port: port, data: report);
  }
  exit(0);
}

if (typ == "DIR-890L") {
  if (hw_version == "A1" && version_is_less(version: version, test_version: "1.11b01")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "1.11b01_beta01_g97i");
    security_message(port: port, data: report);
  }
  exit(0);
}

if (typ == "DIR-880L") {
  if (hw_version == "A1" && version_is_less(version: version, test_version: "1.08WWb04")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "1.08WWb04");
    security_message(port: port, data: report);
  }
  exit(0);
}

if (typ == "DIR-868L") {
  if (hw_version == "A1" && version_is_less(version: version, test_version: "1.12WWb04")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "1.12WWb04");
    security_message(port: port, data: report);
  }
  exit(0);
}

if (typ == "DIR-868L") {
  if (hw_version == "B1" && version_is_less(version: version, test_version: "2.05b01")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "2.05b01");
    security_message(port: port, data: report);
  }
  exit(0);
}

if (typ == "DIR-869") {
  if (hw_version == "A1" && version_is_less(version: version, test_version: "1.03")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "1.03");
    security_message(port: port, data: report);
  }
  exit(0);
}

if (typ == "DIR-879") {
  if (hw_version == "A1" && version_is_less(version: version, test_version: "1.04")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "1.04");
    security_message(port: port, data: report);
  }
  exit(0);
}

if (typ == "DIR-859") {
  if (hw_version == "A1" && version_is_less(version: version, test_version: "1.06")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "1.06");
    security_message(port: port, data: report);
  }
  exit(0);
}

if (typ == "DIR-822") {
  if (hw_version == "B1" && version_is_less(version: version, test_version: "2.03WWb01")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "2.03WWb01");
    security_message(port: port, data: report);
  }
  exit(0);
}

if (typ == "DIR-823") {
  if (hw_version == "A1" && version_is_less(version: version, test_version: "1.00WWb06")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "1.00WWb06");
    security_message(port: port, data: report);
  }
  exit(0);
}

if (typ == "DIR-818L") {
  if (hw_version == "B1" && version_is_less(version: version, test_version: "2.05")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "2.05 beta 08");
    security_message(port: port, data: report);
  }
  exit(0);
}

exit(0);
