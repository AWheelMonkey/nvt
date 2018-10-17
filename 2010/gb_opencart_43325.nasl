###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_opencart_43325.nasl 5838 2017-04-03 10:26:36Z cfi $
#
# OpenCart 'fckeditor' Arbitrary File Upload Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
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
 script_oid("1.3.6.1.4.1.25623.1.0.100816");
 script_version("$Revision: 5838 $");
 script_tag(name:"last_modification", value:"$Date: 2017-04-03 12:26:36 +0200 (Mon, 03 Apr 2017) $");
 script_tag(name:"creation_date", value:"2010-09-21 16:24:40 +0200 (Tue, 21 Sep 2010)");
 script_bugtraq_id(43325);
 script_tag(name:"cvss_base", value:"4.6");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:S/C:P/I:P/A:P");
 script_name("OpenCart 'fckeditor' Arbitrary File Upload Vulnerability");

 script_xref(name : "URL" , value : "https://www.securityfocus.com/bid/43325");
 script_xref(name : "URL" , value : "http://www.opencart.com");

 script_category(ACT_ATTACK);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
 script_dependencies("opencart_detect.nasl");
 script_require_ports("Services/www", 80);
 script_mandatory_keys("OpenCart/installed");

 script_tag(name : "summary" , value : "OpenCart is prone to an arbitrary-file-upload vulnerability because it
 fails to properly sanitize user-supplied input.");
 script_tag(name : "impact" , value : "An attacker may leverage this issue to upload arbitrary files to the
 affected computer; this can result in arbitrary code execution within
 the context of the vulnerable application.");
 script_tag(name : "affected" , value : "OpenCart versions up to 1.3.2 are vulnerable; other versions may also be affected.");
 script_tag(name : "solution" , value : "Update OpenCart to version 1.3.3 or above; make sure the directory 
 /admin/view/javascript/fckeditor/ is deleted during the update.");

 script_tag(name:"solution_type", value:"VendorFix");
 script_tag(name:"qod_type", value:"remote_app");

 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("version_func.inc");
   
port = get_http_port(default:80);

if(!dir = get_dir_from_kb(port:port, app:"opencart"))exit(0);

file = string("openvas-upload-test-delete-me-",rand(),".php");
url = string(dir,"/admin/view/javascript/fckeditor/editor/filemanager/connectors/php/connector.php?Command=FileUpload&Type=File&CurrentFolder=%2F"); 

host = http_host_name( port:port );

req = string("POST ", url, " HTTP/1.1\r\n",
	     "Host: ", host,"\r\n",
	     "User-Agent: ", OPENVAS_HTTP_USER_AGENT,"\r\n",
	     "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\n",
	     "Accept-Language: de-de,de;q=0.8,en-us;q=0.5,en;q=0.3\r\n",
	     "Accept-Encoding: gzip,deflate\r\n",
	     "Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7\r\n",
	     "Keep-Alive: 115\r\n",
	     "Connection: keep-alive\r\n",
	     "Referer: http://",get_host_name(),"/",dir,"//admin/view/javascript/fckeditor/editor/filemanager/connectors/test.html\r\n",
             "Content-Type: multipart/form-data; boundary=---------------------------1179981022663023650735134601\r\n",								      
	     "Content-Length: 275\r\n",
	     "\r\n",
	     "-----------------------------1179981022663023650735134601\r\n",
	     "Content-Disposition: form-data; name='NewFile'; filename='",file,"'\r\n",
	     "Content-Type: text/plain\r\n",
	     "\r\n",
	     "OpenVAS-Upload-Test\r\n",
	     "\r\n",
	     "-----------------------------1179981022663023650735134601--\r\n",
	     "\r\n\r\n");

recv = http_keepalive_send_recv(data:req, port:port, bodyonly:FALSE);

if("OnUploadCompleted" >< recv && file >< recv) {

  url = string(dir,"/admin/view/javascript/fckeditor/editor/filemanager/connectors/php/",file);
  req2 = http_get(item:url, port:port);
  recv = http_keepalive_send_recv(data:req2, port:port, bodyonly:FALSE);

  if("OpenVAS-Upload-Test" >< recv) {
    report = 'It was possible to upload the file "' + dir + file + '". Please delete this file.';
    security_message(port:port, data:report);
    exit(0);
  }  
}  

exit(99);
