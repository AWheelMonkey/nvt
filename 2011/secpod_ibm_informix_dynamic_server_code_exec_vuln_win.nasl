###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ibm_informix_dynamic_server_code_exec_vuln_win.nasl 11552 2018-09-22 13:45:08Z cfischer $
#
# IBM Informix Dynamic Server Oninit Remote Code Execution Vulnerability (Windows)
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
#
# Copyright:
# Copyright (c) 2011 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.902546");
  script_version("$Revision: 11552 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-22 15:45:08 +0200 (Sat, 22 Sep 2018) $");
  script_tag(name:"creation_date", value:"2011-08-02 09:08:31 +0200 (Tue, 02 Aug 2011)");
  script_cve_id("CVE-2011-1033");
  script_bugtraq_id(46230);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("IBM Informix Dynamic Server Oninit Remote Code Execution Vulnerability (Windows)");
  script_xref(name:"URL", value:"http://secunia.com/advisories/43212");
  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/65209");
  script_xref(name:"URL", value:"http://zerodayinitiative.com/advisories/ZDI-11-050/");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2011 SecPod");
  script_family("Buffer overflow");
  script_dependencies("secpod_ibm_informix_dynamic_server_detect_win.nasl");
  script_mandatory_keys("IBM/Informix/Dynamic/Server/Win/Ver");
  script_tag(name:"impact", value:"Successful exploitation could allow remote attackers to execute arbitrary
  code with SYSTEM-level privileges.");
  script_tag(name:"affected", value:"IBM Informix Dynamic Server (IDS) version 11.50");
  script_tag(name:"insight", value:"The flaw is due to a boundary error in the oninit process bound to TCP
  port 9088 when processing the arguments to the USELASTCOMMITTED option in a
  SQL query.");
  script_tag(name:"solution", value:"Upgrade to IBM Informix IDS version 11.50.xC8 or later,
  For updates refer to http://www-01.ibm.com/software/data/informix/");
  script_tag(name:"summary", value:"This host is installed with IBM Informix Dynamic Server and is
  prone to remote code execution vulnerability.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

version = get_kb_item("IBM/Informix/Dynamic/Server/Win/Ver");
if(version)
{
  if(version_is_equal(version:version, test_version:"11.50")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
}
