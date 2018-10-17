###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_faslo_player_m3u_bof_vuln.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# Faslo Player .m3u Playlist Processing Buffer Overflow Vulnerability
#
# Authors:
# Maneesh KB <kmaneesh@secpod.com>
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

tag_impact = "Attackers can exploit this issue to execute arbitrary code by
tricking users into opening crafted m3u playlist files and may cause Denial
of Service.

Impact Level: Application";

tag_affected = "Faslo Player version 7.0 on Windows.";

tag_insight = "A boundary error occurs when processing .m3u playlist files
containing overly long data.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "The host is installed with Faslo Player and is prone to Buffer
Overflow vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900254");
  script_version("$Revision: 9350 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2009-11-23 07:01:19 +0100 (Mon, 23 Nov 2009)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2009-3969");
  script_name("Fasloi Player .m3u Playlist Processing Buffer Overflow Vulnerability");
  script_xref(name : "URL" , value : "http://www.milw0rm.com/exploits/9487");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/36444/");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2009/2395");

  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"registry");
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Buffer overflow");
  script_dependencies("secpod_faslo_player_detect.nasl");
  script_mandatory_keys("FasloPlayer/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}


include("version_func.inc");

fpVer = get_kb_item("FasloPlayer/Ver");
if(!fpVer){
  exit(0);
}

if(version_is_equal(version:fpVer, test_version:"7.0")){
  security_message(0);
}
