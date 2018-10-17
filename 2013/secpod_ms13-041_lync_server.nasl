###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms13-041_lync_server.nasl 11865 2018-10-12 10:03:43Z cfischer $
#
# Microsoft Lync Server Remote Code Execution Vulnerability (2834695)
#
# Authors:
# Veerendra G.G <veerendragg@secpod.com>
#
# Copyright:
# Copyright (c) 2013 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.901219");
  script_version("$Revision: 11865 $");
  script_bugtraq_id(59791);
  script_cve_id("CVE-2013-1302");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:03:43 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-05-15 17:48:13 +0530 (Wed, 15 May 2013)");
  script_name("Microsoft Lync Server Remote Code Execution Vulnerability (2834695)");
  script_xref(name:"URL", value:"http://support.microsoft.com/kb/2827753");
  script_xref(name:"URL", value:"http://support.microsoft.com/kb/2827750");
  script_xref(name:"URL", value:"http://secunia.com/advisories/53363/");
  script_xref(name:"URL", value:"https://technet.microsoft.com/en-us/security/bulletin/ms13-041");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("smb_reg_service_pack.nasl",
                      "secpod_ms_lync_server_detect_win.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("MS/Lync/Server/Name", "MS/Lync/Server/path");
  script_tag(name:"impact", value:"Successful exploitation could allow an attacker could execute arbitrary
  code in the context of the current user by sharing specially crafted
  content, such as a file or a program, as a presentation in a Lync or
  Communicator session and then convince a user to view or share the
  specially crafted content.");
  script_tag(name:"affected", value:"Microsoft Lync Server 2013 (Web Components Server)");
  script_tag(name:"insight", value:"A use-after-free error within the Lync control can be exploited to
  dereference already freed memory.");
  script_tag(name:"solution", value:"Run Windows Update and update the listed hotfixes or download and
  install the hotfixes from the referenced advisory.");
  script_tag(name:"summary", value:"This host is missing an important security update according to
  Microsoft Bulletin MS13-041.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"http://technet.microsoft.com/en-us/security/bulletin/ms13-041");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

ms_lync_name = get_kb_item("MS/Lync/Server/Name");

if("Microsoft Lync Server 2013" >< ms_lync_name)
{
  ms_lync_path = get_kb_item("MS/Lync/Server/path");
  if(ms_lync_path)
  {
    fname = "\Web Components\Autodiscover\Ext\Bin\microsoft.rtc.internal.autodiscover.dll";

    dll_ver = fetch_file_version(sysPath:ms_lync_path, file_name:fname);
    if(dll_ver)
    {
      if(version_in_range(version:dll_ver, test_version:"5.0", test_version2:"5.0.8308.300"))
      {
        security_message( port: 0, data: "The target host was found to be vulnerable" );
        exit(0);
      }
    }
  }
}
