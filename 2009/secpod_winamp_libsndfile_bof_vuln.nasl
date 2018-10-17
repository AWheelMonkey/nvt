###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_winamp_libsndfile_bof_vuln.nasl 11554 2018-09-22 15:11:42Z cfischer $
#
# Winamp libsndfile Buffer Overflow Vulnerability
#
# Authors:
# Nikita MR <rnikita@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.900558");
  script_version("$Revision: 11554 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-22 17:11:42 +0200 (Sat, 22 Sep 2018) $");
  script_tag(name:"creation_date", value:"2009-06-04 10:49:28 +0200 (Thu, 04 Jun 2009)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2009-1788", "CVE-2009-1791");
  script_bugtraq_id(34978);
  script_name("Winamp libsndfile Buffer Overflow Vulnerability");


  script_tag(name:"qod_type", value:"registry");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Buffer overflow");
  script_dependencies("secpod_winamp_detect.nasl");
  script_mandatory_keys("Winamp/Version");
  script_tag(name:"impact", value:"Attackers may leverage this issue by executing arbitrary codes in the
  context of the affected application via specially crafted VOC, AIFF
  files and can cause denial of service.");
  script_tag(name:"affected", value:"Winamp version 5.552 and prior on Windows.");
  script_tag(name:"insight", value:"The flaw is generated due to boundary error in 'voc_read_header()' and
  'aiff_read_header()' functions in libsndfile.dll while processing VOC
  and AIFF files with invalid header values.");
  script_tag(name:"summary", value:"This host is installed with Winamp and is prone to Buffer
  Overflow vulnerability.");
  script_tag(name:"solution", value:"Upgrade to the latest libsndfile version or apply the patch.
  http://www.mega-nerd.com/libsndfile/
  http://www.mega-nerd.com/erikd/Blog/CodeHacking/libsndfile/rel_20.html

  *****
  NOTE : Ignore this warning, if above mentioned patch is already applied.
  *****");
  script_xref(name:"URL", value:"http://secunia.com/advisories/35076");
  script_xref(name:"URL", value:"http://trapkit.de/advisories/TKADV2009-006.txt");
  script_xref(name:"URL", value:"http://www.vupen.com/english/advisories/2009/1324");

  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}


include("smb_nt.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

winampVer = get_kb_item("Winamp/Version");
if(!winampVer){
  exit(0);
}

if(version_is_less_equal(version:winampVer, test_version:"5.5.5.2435")){
   security_message( port: 0, data: "The target host was found to be vulnerable" );
}
