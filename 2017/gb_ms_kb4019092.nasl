###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4019092.nasl 11982 2018-10-19 08:49:21Z mmartin $
#
# Microsoft SQL Server Information Disclosure Vulnerability (KB4019092)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811566");
  script_version("$Revision: 11982 $");
  script_cve_id("CVE-2017-8516");
  script_bugtraq_id(100041);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-19 10:49:21 +0200 (Fri, 19 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-08-09 17:30:22 +0530 (Wed, 09 Aug 2017)");
  script_name("Microsoft SQL Server Information Disclosure Vulnerability (KB4019092)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4019092");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to the microsoft SQL
  Server Analysis Services improperly enforces permissions.");

  script_tag(name:"impact", value:"Successful exploitation will allow
  an attacker to access affected SQL server database.");

  script_tag(name:"affected", value:"Microsoft SQL Server 2012 Service Pack 3");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4019092");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("smb_reg_service_pack.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## OS Architecture
os_arch = get_kb_item("SMB/Windows/Arch");
if(!os_arch){
  exit(0);
}

if("x64" >< os_arch){
  arch = "x64";
}
else if("x86" >< os_arch){
  arch = "x86";
}
else{
  exit(0);
}

ms_sql_key = "SOFTWARE\Microsoft\Microsoft SQL Server\";
if(!registry_key_exists(key:ms_sql_key)){
  exit(0);
}

foreach item (registry_enum_keys(key:ms_sql_key))
{
  sql_path = registry_get_sz(key:ms_sql_key + item + "\Tools\Setup", item:"SQLPath");
  sql_ver = registry_get_sz(key:ms_sql_key + item + "\Tools\Setup", item:"Version");

  if(!sql_ver){
    continue;
  }

  if("Microsoft SQL Server" >< sql_path)
  {
    ## Reset the string
    sql_ver_path = "";

    if(sql_ver =~ "11\.0"){
      sql_ver_path = "SQLServer2012";
    }
    else{
      continue;
    }

    ## TODO: We have taken arch path for "x86" on assumtion and some google
    ## but not sure about the file path in case in "x86", we need to update the
    ## path if it's different.
    sql_path = sql_path - "Tools\" + "Setup Bootstrap\" + sql_ver_path + "\" + arch;

    sysVer = fetch_file_version(sysPath:sql_path,
             file_name:"Microsoft.sqlserver.chainer.infrastructure.dll");

    if(sysVer)
    {
      ## MS SQl 2012 :  GDR(11.0.6251.0)
      if(sysVer =~ "^11\.0")
      {
        if(version_in_range(version:sysVer, test_version:"11.0.6000.0", test_version2:"11.0.6250.0"))
        {
          report = 'File checked:     ' + sql_path + "\microsoft.sqlserver.chainer.infrastructre.dll" + '\n' +
                   'File version:     ' + sysVer  + '\n' +
                   'Vulnerable range: 11.0.6000.0 - 11.0.6250.0\n' ;
          security_message(data:report);
          exit(0);
        }
      }
    }
  }
}
