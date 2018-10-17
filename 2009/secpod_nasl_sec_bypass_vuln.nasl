###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_nasl_sec_bypass_vuln.nasl 11554 2018-09-22 15:11:42Z cfischer $
#
# OpenSSL DSA_do_verify() Security Bypass Vulnerability in NASL
#
# Authors:
# Sharath S <sharaths@secpod.com>
#
# Copyright:
# Copyright (c) 2009 SecPod, http://www.secpod.com
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900190");
  script_version("$Revision: 11554 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-22 17:11:42 +0200 (Sat, 22 Sep 2018) $");
  script_tag(name:"creation_date", value:"2009-01-22 12:00:13 +0100 (Thu, 22 Jan 2009)");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:P");
  script_cve_id("CVE-2008-5077", "CVE-2009-0125");
  script_bugtraq_id(33151);
  script_name("OpenSSL DSA_do_verify() Security Bypass Vulnerability in NASL");

  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=479655");
  script_xref(name:"URL", value:"http://openwall.com/lists/oss-security/2009/01/12/4");
  script_xref(name:"URL", value:"http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=511517");

  script_tag(name:"qod_type", value:"executable_version");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("General");
  script_dependencies("secpod_nasl_detect_lin.nasl");
  script_mandatory_keys("NASL/Linux/Ver");
  script_tag(name:"impact", value:"Successful exploitation could allow remote attackers to bypass the
  certificate validation checks and can cause spoofing attacks via
  signature checks with SSL/TLS.");
  script_tag(name:"affected", value:"Nessus Attack Scripting Language (NASL) version 2.2.11 and prior on Linux.");
  script_tag(name:"insight", value:"The flaw is due to improper validation of return value in
  nasl/nasl_crypto2.c file from DSA_do_verify function of OpenSSL.");
  script_tag(name:"summary", value:"The host is running NASL and is prone to Security Bypass
  vulnerability.");
  script_tag(name:"solution", value:"Apply Patch
  http://cvs.fedoraproject.org/viewvc/rpms/libnasl/F-10/libnasl.spec?r1=1.16&r2=1.17

  *********
  NOTE: Please ignore the warning, if patch is applied.
  *********");

  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}


include("version_func.inc");

naslPort = 1241;
if(!get_tcp_port_state(naslPort)){
  exit(0);
}

naslVer = get_kb_item("NASL/Linux/Ver");
if(!naslVer){
  exit(0);
}

if(version_is_less_equal(version:naslVer, test_version:"2.2.11")){
  security_message(naslPort);
}
