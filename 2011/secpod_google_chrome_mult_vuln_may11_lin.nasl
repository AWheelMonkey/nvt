###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_google_chrome_mult_vuln_may11_lin.nasl 11997 2018-10-20 11:59:41Z mmartin $
#
# Google Chrome Multiple Vulnerabilities May11 (Linux)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.902383");
  script_version("$Revision: 11997 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-20 13:59:41 +0200 (Sat, 20 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-06-02 11:54:09 +0200 (Thu, 02 Jun 2011)");
  script_cve_id("CVE-2011-1801", "CVE-2011-1804", "CVE-2011-1806", "CVE-2011-1807");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Google Chrome Multiple Vulnerabilities May11 (Linux)");
  script_xref(name:"URL", value:"http://trac.webkit.org/changeset/86862");
  script_xref(name:"URL", value:"http://googlechromereleases.blogspot.com/2011/05/stable-channel-update_24.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2011 SecPod");
  script_family("Denial of Service");
  script_dependencies("gb_google_chrome_detect_lin.nasl");
  script_mandatory_keys("Google-Chrome/Linux/Ver");
  script_tag(name:"impact", value:"Successful exploitation will allow remote attackers to cause a denial of
  service.");
  script_tag(name:"affected", value:"Google Chrome version prior to 11.0.696.71 on Linux.");
  script_tag(name:"insight", value:"Multiple flaws are due to:

  - An error in 'Pop-up' blocker bypass,

  - An error in 'rendering/RenderBox.cpp' in WebCore in 'WebKit', which fails
    to properly render floats and results in stale pointer,

  - A memory corruption error in in GPU command buffer and

  - A out-of-bounds write error in 'blob' handling.");
  script_tag(name:"solution", value:"Upgrade to Google Chrome version 11.0.696.71 or later");
  script_tag(name:"summary", value:"This host is installed with Google Chrome and is prone to multiple
  vulnerabilities.");
  script_tag(name:"qod_type", value:"executable_version");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"http://www.google.com/chrome");
  exit(0);
}


include("version_func.inc");

chromeVer = get_kb_item("Google-Chrome/Linux/Ver");
if(!chromeVer){
  exit(0);
}

if(version_is_less(version:chromeVer, test_version:"11.0.696.71")){
  security_message( port: 0, data: "The target host was found to be vulnerable" );
}
