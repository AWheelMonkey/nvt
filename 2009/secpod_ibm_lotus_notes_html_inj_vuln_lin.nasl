###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ibm_lotus_notes_html_inj_vuln_lin.nasl 11554 2018-09-22 15:11:42Z cfischer $
#
# IBM Lotus Notes RSS Reader Widget HTML Injection Vulnerability (Linux)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.901015");
  script_version("$Revision: 11554 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-22 17:11:42 +0200 (Sat, 22 Sep 2018) $");
  script_tag(name:"creation_date", value:"2009-09-11 18:01:06 +0200 (Fri, 11 Sep 2009)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2009-3114");
  script_bugtraq_id(36305);
  script_name("IBM Lotus Notes RSS Reader Widget HTML Injection Vulnerability (Linux)");


  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("General");
  script_dependencies("secpod_ibm_lotus_notes_detect_lin.nasl");
  script_mandatory_keys("IBM/LotusNotes/Linux/Ver");
  script_tag(name:"impact", value:"Successful exploitation will allow attackers to inject HTML based
code.");
  script_tag(name:"affected", value:"IBM Lotus Notes Version 8.5 on Linux.");
  script_tag(name:"insight", value:"The flaw is due to error in the RSS reader widget, caused when
items are saved from an RSS feed as local HTML documents. This can be exploited
via a crafted feed.");
  script_tag(name:"solution", value:"Vendor has released a patch to fix the issue, refer below link
for patch details.
http://www-01.ibm.com/support/docview.wss?uid=swg21403834");
  script_tag(name:"summary", value:"This host has IBM Lotus Notes installed and is prone to HTML
Injection vulnerability.");
  script_tag(name:"qod_type", value:"executable_version");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"http://www.scip.ch/?vuldb.4021");
  script_xref(name:"URL", value:"http://www-01.ibm.com/support/docview.wss?uid=swg21403834");
  script_xref(name:"URL", value:"http://www.securityfocus.com/archive/1/archive/1/506296/100/0/threaded");
  exit(0);
}


include("version_func.inc");

lotusVer = get_kb_item("IBM/LotusNotes/Linux/Ver");

if(lotusVer != NULL)
{
  if(version_in_range(version:lotusVer, test_version:"8.5",
                                       test_version2:"8.5.00.8318")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
}
